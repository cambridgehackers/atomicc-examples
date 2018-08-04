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
#include "adapter.h"
#define __DONT_DEFINE_USER_TOP__
#include "userTop.h"

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
    //__input int readme;
    //__output int writeme;
    //__inout int readwriteme;
};

__interface CNCONNECTNET2 {
    __input  __int(1)         IN1;
    __input  __int(1)         IN2;
    __output __int(1)         OUT1;
    __output __int(1)         OUT2;
};
__module CONNECTNET2 {
    CNCONNECTNET2 _;
    CONNECTNET2() {
        __rule assign {
            _.OUT1 = _.IN1;
            _.OUT2 = _.IN2;
        }
    }
};
CONNECTNET2 cntest;

__interface EchoIndication {
    void heard(aint32 v);
    void heard2(aint16 a, aint16 b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};
typedef __serialize(EchoRequest) fooReq;
typedef __serialize(EchoIndication) fooInd;

__module Echo {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
    //__printf;
    int busy;
    aint32 v_temp, v_delay;
    aint16 a_temp, b_temp, a_delay, b_delay;
    int busy_delay;
    int v_type;
    void request.say(aint32 v) if(!busy) {
//printf("EEEEEEEE say: %d\n", v);
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(aint16 a, aint16 b) if(!busy) {
//printf("EEEEEEEE say2: a %d b %d\n", a, b);
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
#if 0
    void request.say3(aint32 a, aint32 b, aint32 c) if (!busy) {
//printf("EEEEEEEE say3: a %d b %d c %d\n", a, b, c);
    }
#endif
    void request.zsay4(void) {
//printf("EEEEEEEE zsay4:%d]Echo\n", 4);
    }
    void request.setLeds(aint8 v) {
    }
    Echo() {
        __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
//printf("EEEEEEEE delay_rule: v_temp %d a_temp %d b_temp %d\n", v_temp, a_temp, b_temp);
             busy = 0;
             busy_delay = 1;
             v_delay = v_temp;
             a_delay = a_temp;
             b_delay = b_temp;
           };
        __rule respond_rule if(busy_delay != 0) {
//printf("EEEEEEEE respond_rule: v_type %d v_delay %d a_delay %d b_delay %d\n", v_type, v_delay, a_delay, b_delay);
             busy_delay = 0;
             if (v_type == 1)
             indication->heard(v_delay);
             else
             indication->heard2(a_delay, b_delay);
           };
    }
};

Echo test;

#define IfcNames_EchoIndicationH2S 5
__module UserTop {
    PipeInB<BusType> write;
    PipeInB<BusType> *read;
    AdapterToBus<NOCData, BusType> radapter_0;
    AdapterFromBus<BusType, NOCData> wadapter_0;
    __forward radapter_0.out = read;
    __forward wadapter_0.in = write;

    PipeInH<NOCData> wad;
    void wad.enq(NOCData v, __int(16) length) {
printf("reqConnect.enq v %llx length %lx\n", (long long)__bit_cast<__int(__bitsize(v))>(v), (long)length);
        ctop.request.enq(v);
    }
    PipeIn<NOCData> indication;
    void indication.enq(NOCData v) {
        __int(__bitsize(v)) vint = __bit_cast<__int(__bitsize(v))>(v);
        __int(16) len = __bitsubstr(vint, 15, 0) - 1;
        __int(16) port = IfcNames_EchoIndicationH2S;
printf("indConnect.enq v %llx len %lx\n", (long long)__bit_cast<__int(__bitsize(v))>(v), (long)len);
        radapter_0.in.enq(__bit_cast<NOCData>(__bitconcat(__bitsubstr(vint, __bitsize(v) - 1, 16), port)), len);
    }

    l_top       ctop;
    __connect ctop.indication = indication;
    __connect wadapter_0.out = wad;
};

UserTop ttest;
