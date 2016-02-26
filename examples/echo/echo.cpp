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
class FifoPong : public Fifo<T>, public Module
{
    T element1;
    T element2;
    bool pong;
    bool full;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    METHOD(enq, (const T &v), override { return notFull(); }) override {
        if (pong)
            element2 = v;
        else
            element1 = v;
        full = true;
    }
    METHOD(deq, (void), override { return notEmpty(); }) override { full = false; pong = !pong; }
    GVALUE(first, T, override { return notEmpty(); }) override { return pong ? element2 : element1; }
    FifoPong(): Fifo<T>(), full(false), pong(false) {
        FIFOBASECONSTRUCTOR(FifoPong<T>);
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
    bool notEmpty() const { return full; }
    bool notFull() const { return !full; }
};
#else
#define ECHO_FIFO FifoPong
#define OVERRIDE override
//#define OVERRIDE
template<class T>
class FifoPong : public Fifo<T>, public Module
{
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    //bad version for testing METHOD(enq, (T v), OVERRIDE { return true; }) OVERRIDE {
    METHOD(enq, (const T &v), OVERRIDE { return true; }) OVERRIDE {
        if (pong)
            element2.in.enq(v);
        else
            element1.in.enq(v);
    }
    METHOD(deq, (void), OVERRIDE { return true; }) OVERRIDE {
        if (pong)
            element2.out.deq();
        else
            element1.out.deq();
        pong = !pong;
    }
    GVALUE(first, T, OVERRIDE { return true; }) OVERRIDE { return pong ? element2.out.first() : element1.out.first(); }
    FifoPong(): Fifo<T>(), pong(false) {
        FIFOBASECONSTRUCTOR(FifoPong<T>);
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
        printf("in.enq %p in.enq__RDY %p out.deq %p out.deq__RDY %p\n",
           in.enqp, in.enq__RDYp, out.deqp, out.deq__RDYp);
    };
};
#endif

static ECHO_FIFO<int> bozouseless;
class EchoIndication {
public:
  INDICATION(heard, (int v), { return true; });
  EchoIndication() {
    EXPORTREQUEST(EchoIndication::heard);
  }
};

class EchoRequest {
public:
  METHOD(say, (const int &v), {return true; }){}
  EchoRequest() {
    EXPORTREQUEST(EchoRequest::say);
  }
};

class Echo : public Module, EchoRequest {
  Fifo<int> *fifo;
  EchoIndication *ind;
  int pipetemp;
public:
  METHOD(say, (const int &v), {return true; }) {
      fifo->in.enq(v);
  }
  Echo(EchoIndication *ind) : fifo(new ECHO_FIFO<int>()), ind(ind) {
    printf("Echo: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    EXPORTREQUEST(Echo::say);
    RULE(Echo,"respond_rule", { 
	 //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	 int temp = this->fifo->out.first();
	 this->fifo->out.deq();
	 this->ind->heard(temp);
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
    stop_main_program = 1;
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

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
  while (!echoTest.echo->say__RDY())
      ;
  echoTest.echo->say(22);
  if (argc != 1)
      run_main_program();
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

