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
#include <atomicc.h>

//typedef __int(32) aint32;
typedef __int(16) aint16;
//typedef __int(8) aint8;
#define aint32 __int(32)
//#define aint16 __int(16)
#define aint8 __int(8)
__interface EchoRequest {
    void say(aint32 v);
    void say2(aint16 a, aint16 b);
    void setLeds(aint8 v);
};

__interface EchoIndication {
    void heard(aint32 v);
    void heard2(aint16 a, aint16 b);
};

__module Echo {
    EchoRequest                     request;
    EchoIndication                 *indication;
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

//////////////////////////// this is the stack that will run in the hardware
__module Hardware {
    P2M<EchoRequest>                 lERI;      // request pipe
    M2P<EchoIndication>              lEIO;      // indication pipe

    // top interface
    __software decltype(lERI.pipe)              request = lERI.pipe;
    __software decltype(lEIO.pipe)              indication = lEIO.pipe;

    // Module under test
    Echo                       lEcho;
    __connect lERI.method = lEcho.request;
    __connect lEcho.indication = lEIO.method;
};

Hardware test;

// hack for clang
P2M<EchoRequest>::Data foo1;
P2M<EchoIndication>::Data foo2;
M2P<EchoRequest>::Data foo3;
M2P<EchoIndication>::Data foo4;
