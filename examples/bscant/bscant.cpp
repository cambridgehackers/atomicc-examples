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
#include "bscan.h"

class BtestRequest {
    void say(__uint(32) v);
};
class BtestIndication {
    void heard(__uint(32) v);
};

class BtestIfc {
    __software BtestRequest                     request;
    __software BtestIndication                 *indication;
};

class Btest __implements BtestIfc {
    Bscan<4,32> bscan;
    __implements bscan.fromBscan readUser;
    __uint(8) readCount, writeCount;
    __uint(32) nextV;
    bool ready;

    void readUser.enq(__uint(64) v) {
        indication->heard(v);
        readCount++;
    }
    void request.say(__uint(32) v) {
        nextV = v;
        ready = true;
    }
    __rule copyRule {
        bscan.toBscan.enq(nextV);
        ready = false;
        writeCount++;
    }
};
