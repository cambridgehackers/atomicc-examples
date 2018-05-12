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

//typedef __int(32) aint32;
typedef __int(16) aint16;
//typedef __int(8) aint8;
#define aint32 __int(32)
//#define aint16 __int(16)
#define aint8 __int(8)
__interface EchoRequest {
    void say(aint32 v);
    void say2(aint16 a, aint16 b);
    //void say3(aint32 a, aint32 b, aint32 c);
    void zsay4(void);
    void setLeds(aint8 v);
};

__interface EchoIndication {
    void heard(aint32 v);
    void heard2(aint16 a, aint16 b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

__module Echo {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
    int busy;
    aint32 v_temp, v_delay;
    aint16 a_temp, b_temp, a_delay, b_delay;
    int busy_delay;
    int v_type;
    void request.say(aint32 v) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(aint16 a, aint16 b) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
#if 0
    void request.say3(aint32 a, aint32 b, aint32 c) if (!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
    }
#endif
    void request.zsay4(void) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
    }
    void request.setLeds(aint8 v) {
    }
    Echo() {
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
    }
};

Echo test;
