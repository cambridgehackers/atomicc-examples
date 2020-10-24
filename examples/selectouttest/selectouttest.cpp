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
#include "selectout.h"
#define IfcNames_SelectOutIndicationH2S 5

#define SPLIT_WIDTH 4

class SelectOutRequest {
    void say(__int(32) v);
};
class SelectOutIndication {
    void heard(__int(8) rindex, __int(32) v);
};

class SelectOutTestIfc {
    __software SelectOutRequest     request;
    __software SelectOutIndication *indication;
};

class SelectOutTest __implements SelectOutTestIfc {
    Fifo1<__int(32)>       fifo[SPLIT_WIDTH];
    SelectOut<SPLIT_WIDTH, 32>   funnel;
    __uint(8)              index, rindex;
    
    void request.say(__int(32) v) {
        printf("request.say %x index %d limit %d increment %d\n", v, index, 0, 0);
        fifo[index].in.enq(v);
        if (index >= SPLIT_WIDTH - 1)
            index = 0;
        else
            index++;
    }
    __rule respondRule {
printf("[%s:%d] rindex %d limit %d increment %d\n", __FUNCTION__, __LINE__, rindex, 0, 0);
        indication->heard(rindex, funnel.out.first());
        funnel.out.deq();
    };
    __rule rotateRule {
        if (rindex >= SPLIT_WIDTH - 1)
            rindex = 0;
        else
            rindex++;
        funnel.select(rindex);
    }
    __rule init {
        for (int i = 0; i < SPLIT_WIDTH; i = i + 1)
            __connect funnel.in[i] = fifo[i].out;
    }
};
