/* Copyright (c) 2016 The Connectal Project
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
#include "fifo.h"
#include "funnel.h"
#define IfcNames_FunnelIndicationH2S 5

class FunnelRequest {
    void say(__int(32) v);
};
class FunnelIndication {
    void heard(__int(32) v);
};

class FunnelIfc {
    __software FunnelRequest                     request;
    __software FunnelIndication                 *indication;
};

class Funnel __implements FunnelIfc {
    __uint(1) busy, busy_delay;
    Fifo1<__int(32)> fifoA;
    Fifo1<__int(32)> fifoB;
    Fifo1<__int(32)> fifoC;
    Fifo1<__int(32)> fifoD;
    __uint(2) index;
    void request.say(__int(32) v) if(!busy) {
        printf("request.say %x index %d\n", v, index);
        if (index == 0)
            fifoA.in.enq(v);
        if (index == 1)
            fifoB.in.enq(v);
        if (index == 2)
            fifoC.in.enq(v);
        if (index == 3)
            fifoD.in.enq(v);
        index++;
    }
    __rule respondA_rule {
printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, index);
        indication->heard(fifoA.out.first());
        fifoA.out.deq();
   };
    __rule respondB_rule {
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
        indication->heard(fifoB.out.first());
        fifoB.out.deq();
   };
    __rule respondC_rule {
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
        indication->heard(fifoC.out.first());
        fifoC.out.deq();
   };
    __rule respondD_rule {
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
        indication->heard(fifoD.out.first());
        fifoD.out.deq();
   };
};
