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
#include <atomicc.h>

////////////////////////////////////////////////////////////
// Echo
////////////////////////////////////////////////////////////

#if 1
#define ECHO_FIFO Fifo1
#include <fifo.h>
#else
#define FIFODEFINE Module
#include <fifo.h>
#define ECHO_FIFO FifoPong
template<class T>
Fifo<T>::Fifo(): FIFOBASECONSTRUCTOR(Fifo<T>) {
};
template<class T>
class FifoPong : public Fifo<T> 
{
    T element1;
    T element2;
    bool pong;
    bool full;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    METHOD(enq, (T v), { return notFull(); }) {
        element1 = v;
        full = true;
    }
    METHOD(deq, (void), { return notEmpty(); }) { full = false; }
    GVALUE(first, T, { return notEmpty(); }) { return element1; }
    FifoPong(): Fifo<T>(), full(false), FIFOBASECONSTRUCTOR(FifoPong<T>) {
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
    bool notEmpty() const { return full; }
    bool notFull() const { return !full; }
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
  METHOD(say, (int v), {return true; }){}
  EchoRequest() {
    EXPORTREQUEST(EchoRequest::say);
  }
};

class Echo : public Module, EchoRequest {
  Fifo<int> *fifo;
  EchoIndication *ind;
  int pipetemp;
public:
  METHOD(say, (int v), {return true; }) {
      fifo->in.enq(v);
  }
  Echo(EchoIndication *ind) : fifo(new ECHO_FIFO<int>()), ind(ind) {
    printf("Echo: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    EXPORTREQUEST(Echo::say);
    RULE(Echo,respond, { 
	 //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	 this->fifo->out.deq();
	 this->ind->heard(this->fifo->out.first());
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

