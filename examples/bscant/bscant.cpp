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
#define IfcNames_BtestIndicationH2S 5

class BtestRequest {
    void say(__int(32) v);
    void say2(__int(16) a, __int(16) b);
    void setLeds(__int(8) v);
};
class BtestIndication {
    void heard(__int(32) v);
    void heard2(__int(16) a, __int(16) b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

class BtestIfc {
    __software BtestRequest                     request;
    __software BtestIndication                 *indication;
};

class Btest __implements BtestIfc {
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    __int(16) a_temp, b_temp, a_delay, b_delay;
    int v_type;
    Bscan<3,32> bscan;
    __implements bscan.fromBscan readUser;
    __int(32) fromB;
    __int(32) toB;
    bool fromReady;
    bool toReady;

    void readUser._.enq(__int(64) v) {
        fromB = v;
        fromReady = true;
    }

    void request.say(__int(32) v) if(!busy) {
        toB = v;
        toReady = true;
    }
    void request.say2(__int(16) a, __int(16) b) if(!busy) {
    }
    void request.setLeds(__int(8) v) {
    }

    __rule requestRule if (toReady) {
        bscan.toBscan._.enq(toB);
        toReady = false;
    }

    __rule respond_rule if(fromReady) {
        indication->heard(fromB);
        fromReady = false;
   };
};
