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
  static void echo(int v);
  EchoIndication() {}
  ~EchoIndication() {}
};

class Echo : public Module {
public:
  Fifo<int> *fifo;
  EchoIndication *ind;
  int response;
  GuardedValue<int> *firstreq;
  Action<int> *deqreq;
  int pipetemp;
  RULE2(Echo,respond,
       { 
	 module->response = PIPELINE(module->firstreq->value(), module->pipetemp);
	 module->deqreq->body();
	 module->ind->echo(module->response);
       });
public:
  Action<int> *echoreq;
  Echo(EchoIndication *ind) : Module(sizeof(Echo)), fifo(new Fifo1<int>()), ind(ind), respondRule(this) {
    printf("Echo: addr %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    echoreq = fifo->enq;
    firstreq = fifo->first;
    deqreq = fifo->deq;
  };
  ~Echo() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void EchoIndication::echo(int v)
{
    printf("Heard an echo: %d\n", v);
    stop_main_program = 1;
}

typedef void (^rule)();

#define RULE2(b) rules.push_back(b);

class EchoTest : public Module {
public:
  Echo *echo;
  int x;
  // this should go in class Module
  std::vector<rule> rules;
public:
  EchoTest(): Module(sizeof(Echo)), echo(new Echo(new EchoIndication())), x(7) { printf("EchoTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(EchoTest));
    RULE2(^{
      x++;
      echo->echoreq->body(x);
     })
  }
  ~EchoTest() {}
};

EchoTest echoTest;

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
  if (argc != 1)
      run_main_program();
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

