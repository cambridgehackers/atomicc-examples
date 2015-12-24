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
#include <fifo.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

////////////////////////////////////////////////////////////
// Echo
////////////////////////////////////////////////////////////

class EchoIndication {
public:
  INDICATION(heard, (int v), { return true; });
};

typedef bool (*GUARDPTR)(void);
typedef bool (*GUARDPTR2)(void *);
template <class T>
class PIN {
public:
    void *p;
    GUARDPTR2 enq__RDYp;
    void (*enqp)(void *p, T v);
    bool enq__RDY() { return enq__RDYp(p); }
    void enq(T v) { enqp(p, v); }
};
template <class T>
class POUT {
public:
    void *p;
    GUARDPTR2 deq__RDYp;
    void (*deqp)(void *p);
    GUARDPTR2 first__RDYp;
    T (*FIRSTPTR)(void *p);
};

//template <class T>
Fifo1<int> bozome;
PIN<int> finbozo = PIN<int>{&bozome, Fifo1<int>::enq__RDY_static, Fifo1<int>::enq_static};
POUT<int> foutbozo = POUT<int>{&bozome, Fifo1<int>::deq__RDY_static, Fifo1<int>::deq_static, Fifo1<int>::first__RDY_static, Fifo1<int>::first_static};
typedef bool (Fifo1<int>::*GUARDME)(void);
GUARDME bazbozo[] = {&Fifo1<int>::enq__RDY, &Fifo1<int>::deq__RDY, &Fifo1<int>::first__RDY};

class EchoRequest {
public:
  METHOD(say, (int v), {return true; }){}
};

class Echo : public Module, EchoRequest {
  Fifo<int> *fifo;
  EchoIndication *ind;
  int pipetemp;
public:
  METHOD(say, (int v), {return true; }) {
      fifo->enq(v);
  }
  Echo(EchoIndication *ind) : fifo(new Fifo1<int>()), ind(ind) {
    printf("Echo: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    EXPORTREQUEST(say);
    RULE(Echo,respond, { 
	 //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	 this->fifo->deq();
	 this->ind->heard(this->fifo->first());
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
  echoTest.echo->say(22);
  if (argc != 1)
      run_main_program();
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

