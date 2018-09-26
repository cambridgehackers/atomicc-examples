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
#include "atomicc.h"
#include "fifo.h"
#include "userTop.h"
#include "mux.h"

__interface EchoRequest {
    void say(__int(32) v);
    void say2(__int(16) a, __int(16) b);
    void setLeds(__int(8) v);
};
__interface EchoIndication {
    void heard(__int(32) v);
    void heard2(__int(16) a, __int(16) b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

__module Echo {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
    __printf;
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    __int(16) a_temp, b_temp, a_delay, b_delay;
    int v_type;
    int clockReg;
    void request.say(__int(32) v) if(!busy) {
printf("[%s:%d]Echo %x %x\n", __FUNCTION__, __LINE__, busy_delay, clockReg);
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(__int(16) a, __int(16) b) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
    void request.setLeds(__int(8) v) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
    }
    __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
printf("[delay_rule:%d]Echo\n", __LINE__);
         busy = 0;
         busy_delay = 1;
         v_delay = v_temp;
         a_delay = a_temp;
         b_delay = b_temp;
       };
    __rule respond_rule if(busy_delay != 0) {
printf("[respond_rule:%d]Echo\n", __LINE__);
         busy_delay = 0;
         if (v_type == 1)
         indication->heard(v_delay);
         else
         indication->heard2(a_delay, b_delay);
       };
    __rule clockRule {
       clockReg++;
    }
};
//
//Echo test;
