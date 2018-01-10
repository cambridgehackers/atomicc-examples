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

__interface EchoRequest {
  void say(const int v);
};

__interface EchoIndication {
  void heard(int v);
};

__emodule EchoInd {
  EchoIndication hout;
  //void heardactual(int v);
  //EchoInd() {
      //hout.heard = heardactual;
  //}
};

__module Echo {
  __software EchoRequest sout;
  __software EchoIndication *ind;
  Fifo<int> *fifo;
  void sayactual(const int v) {
      fifo->in.enq(v);
  }
  Echo(EchoInd *aind) : fifo(new Fifo1<int>()), ind(&aind->hout) {
    sout.say = sayactual;
    printf("Echo: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(Echo));
    __rule respond_rule {
        fifo->out.deq();
	ind->heard(fifo->out.first());
    }
  };
  ~Echo() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

//void EchoInd::heardactual(int v)
//{
    //printf("Heard an echo: %d\n", v);
//}

class EchoTest {
  Echo *echo;
  int x;
public:
  EchoTest(): echo(new Echo(new EchoInd())), x(7) {
      printf("EchoTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(EchoTest));
  }
  ~EchoTest() {}
};

EchoTest echoTest;
