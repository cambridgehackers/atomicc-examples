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
#include "out2in.h"
#include "funnel.h"
#define IfcNames_FunnelIndicationH2S 5

class FunnelRequest {
    void say(__int(32) v);
};
class FunnelIndication {
    void heard(__int(32) v);
};

class FunnelTestIfc {
    __software FunnelRequest                     request;
    __software FunnelIndication                 *indication;
};

class FunnelTest __implements FunnelTestIfc {
    __uint(1) busy, busy_delay;
    Fifo1<__int(32)> fifoA;
    Fifo1<__int(32)> fifoB;
    Fifo1<__int(32)> fifoC;
    Fifo1<__int(32)> fifoD;
    Out2In<__int(32)> iA;
    Out2In<__int(32)> iB;
    Out2In<__int(32)> iC;
    Out2In<__int(32)> iD;
    __uint(2) index;
    __connect iA.in = fifoA.out;
    __connect iB.in = fifoB.out;
    __connect iC.in = fifoC.out;
    __connect iD.in = fifoD.out;
    Funnel<4, __int(32)> funnel;
    __connect funnel.in[0] = iA.out;
    __connect funnel.in[1] = iB.out;
    __connect funnel.in[2] = iC.out;
    __connect funnel.in[3] = iD.out;
    Fifo1<__int(32)> result;
    __connect funnel.out = result.in;
    
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
    __rule respond_rule {
printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, index);
        indication->heard(result.out.first());
        result.out.deq();
   };
};
