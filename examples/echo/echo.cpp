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
#include "atomicc.h"
#include "fifo.h"
#include "mux.h"

class EchoRequest {
  void say(const int v);
  void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth);
};

class EchoIndication {
  void heard(int v);
  void heards(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth);
};

class EchoIfc {
  __software EchoRequest     sout;
  __software EchoIndication *ind;
};

class Echo __implements EchoIfc {
    Fifo1<int> fifo;
    void sout.say(const int v) {
        fifo.in.enq(v);
    }
    void sout.setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth) {
        printf("[%s:%d] ahEnd %d ahFrontEnd %d ahBackSync %d ahSyncWidth %d avEnd %d avFrontEnd %d avBackSync %d avSyncWidth %d\n", __FUNCTION__, __LINE__,
            ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
        ind->heards(ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
    }
    __rule respond_rule {
        fifo.out.deq();
	ind->heard(fifo.out.first());
    }
};

Echo dummy;
