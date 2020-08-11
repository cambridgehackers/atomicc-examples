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
#define IfcNames_EchoIndicationH2S 5

typedef struct {
    __int(16) a;
    __int(16) b;
} ValueType;

class EchoRequest {
    void say(__int(32) v);
    void say2(ValueType v);
    void setLeds(__int(8) v);
};
class EchoIndication {
    void heard(__int(32) v);
    void heard2(__int(16) a, __int(16) b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

class EchoIfc {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
};

class Echo __implements EchoIfc {
    //FunnelBase<4, 32> funnel;
    //__printf;
    //Fifo1<__uint(32)> element2;
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    ValueType vd_temp, vd_delay;
    int v_type;
    void request.say(__int(32) v) if(!busy) {
        printf("request.say %x\n", v);
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(ValueType v) if(!busy) {
        vd_temp.a = v.a;
        vd_temp.b = v.b;
        busy = 1;
        v_type = 2;
    }
    void request.setLeds(__int(8) v) {
    }
    __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
        busy = 0;
        busy_delay = 1;
        v_delay = v_temp;
        vd_delay = vd_temp;
    };
    __rule respond_rule if(busy_delay != 0) {
        busy_delay = 0;
        if (v_type == 1)
            indication->heard(v_delay);
        else
            indication->heard2(vd_delay.a, vd_delay.b);
   };
};
