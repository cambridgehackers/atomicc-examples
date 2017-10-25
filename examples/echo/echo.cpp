/* Copyright (c) 2014 Quanta Research Cambridge, Inc
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include <fifo.h>

////////////////////////////////////////////////////////////
// Echo
////////////////////////////////////////////////////////////

#if 1
#define ECHO_FIFO Fifo1
#elif 1
#define ECHO_FIFO FifoPong
template<class T>
__module FifoPong : public Fifo<T>
{
    T element1;
    T element2;
    bool pong;
    bool full;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    METHOD(enq, (const T &v), if (notFull())) {
        if (pong)
            element2 = v;
        else
            element1 = v;
        full = true;
    }
    METHOD(deq, (void), if (notEmpty())) { full = false; pong = !pong; }
    GVALUE(first, T, if (return notEmpty();) ) { return pong ? element2 : element1; }
    FifoPong(): Fifo<T>(), full(false), pong(false) {
        FIFOBASECONSTRUCTOR(FifoPong<T>);
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
    bool notEmpty() const { return full; }
    bool notFull() const { return !full; }
};
#else
#define ECHO_FIFO FifoPong
template<class T>
__module FifoPong : public Fifo<T>
{
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    //bad version for testing METHOD(enq, (T v), { return true; }) {
    METHOD(enq, (const T &v), if (true)) {
        if (pong)
            element2.in.enq(v);
        else
            element1.in.enq(v);
    }
    METHOD(deq, (void), if (true)) {
        if (pong)
            element2.out.deq();
        else
            element1.out.deq();
        pong = !pong;
    }
    GVALUE(first, T, if (return true;) ) { return pong ? element2.out.first() : element1.out.first(); }
    FifoPong(): Fifo<T>(), pong(false) {
        FIFOBASECONSTRUCTOR(FifoPong<T>);
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
        printf("in.enq %p in.enq__RDY %p out.deq %p out.deq__RDY %p\n",
           in.enqp, in.enq__RDYp, out.deqp, out.deq__RDYp);
    };
};
#endif

static ECHO_FIFO<int> bozouseless;
__emodule EchoIndication {
public:
  METHOD(heard, (int v), );
  EchoIndication() {
  }
};

class EchoRequest {
public:
  METHOD(say, (const int &v), if (true) ){}
  EchoRequest() {
  }
};

__module Echo : public EchoRequest {
  Fifo<int> *fifo;
  EchoIndication *ind;
  int pipetemp;
public:
  METHOD(say, (const int &v), if (true) ) {
      fifo->in.enq(v);
  }
  Echo(EchoIndication *aind) : fifo(new ECHO_FIFO<int>()), ind(aind) {
    printf("Echo: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    RULE(Echo,"respond_rule", true, { 
	 //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	 int temp = fifo->out.first();
	 fifo->out.deq();
	 ind->heard(temp);
       });
  };
  ~Echo() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void EchoIndication::heard(int v)
{
    printf("Heard an echo: %d\n", v);
    //stop_main_program = 1;
}

class EchoTest {
public:
  Echo *echo;
  int x;
public:
  EchoTest(): echo(new Echo(new EchoIndication())), x(7) {
      printf("EchoTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(EchoTest));
  }
  ~EchoTest() {}
};

EchoTest echoTest;
