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
#include "funnel.h"
#include "userTop.h"
#include "bscan.h"
#define IfcNames_BscanTIndicationH2S 5

class BscanTRequest {
    void say(__int(32) v);
    void say2(__int(16) a, __int(16) b);
    void setLeds(__int(8) v);
};
class BscanTIndication {
    void heard(__int(32) v);
    void heard2(__int(16) a, __int(16) b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

class BscanTIfc {
    __software BscanTRequest                     request;
    __software BscanTIndication                 *indication;
};

class BscanT __implements BscanTIfc {
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    __int(16) a_temp, b_temp, a_delay, b_delay;
    int v_type;
    void request.say(__int(32) v) if(!busy) {
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(__int(16) a, __int(16) b) if(!busy) {
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
    void request.setLeds(__int(8) v) {
    }
    __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
        busy = 0;
        busy_delay = 1;
        v_delay = v_temp;
        a_delay = a_temp;
        b_delay = b_temp;
    };
    __rule respond_rule if(busy_delay != 0) {
        busy_delay = 0;
        if (v_type == 1)
            indication->heard(v_delay);
        else
            indication->heard2(a_delay, b_delay);
   };
};
