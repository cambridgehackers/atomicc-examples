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
#include <fifoN.h>
#include <stdio.h>
#include <stdlib.h>

////////////////////////////////////////////////////////////
// EchoN
////////////////////////////////////////////////////////////

class EchoNIndication {
public:
  virtual void echoN(int v) = 0;
  EchoNIndication() {}
  ~EchoNIndication() {}
};

__module EchoN : public Module {
  Fifo<int> *fifo;
  EchoNIndication *ind;
  int response;
public:
  RULE(EchoN,respond,
       {
	 return module->fifo->deq()->guard()
	   && module->fifo->first()->guard();
       },
       { 
	 module->response = module->fifo->first()->value();
       },
       {
	 module->ind->echoN(module->response);
	 module->fifo->deq()->update();
       });
public:
  EchoN(EchoNIndication *ind) : fifo(new FifoN<int>(16)), ind(ind), respondRule(this) { };
  ~EchoN() {}
  Action<int> *echoNreq() {
    return fifo->enq();
  }
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

class EchoNIndicationTest : public EchoNIndication {
public:
  void echoN(int v) {
    printf("Heard an echoN: %d\n", v);
    exit(0);
  }
};

__module EchoNTest : public Module {
public:
  EchoN *echoN;
  RULE(EchoNTest,drive,
       {
	 return module->echoN->echoNreq()->guard();
       },
       {
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
	 module->echoN->echoNreq()->body(22);
       },
       {
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
	 module->echoN->echoNreq()->update();
       });
public:
  EchoNTest(): echoN(new EchoN(new EchoNIndicationTest())), driveRule(this) { }
  ~EchoNTest() {}
};

EchoNTest echoNTest;

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
  if (argc != 1)
      Module::run();
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

