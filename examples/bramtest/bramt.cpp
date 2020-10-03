/* Copyright (c) 2020 The Connectal Project
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
#include "bram.h"

class BtestRequest {
    void read(__uint(32) addr);
    void write(__uint(32) addr, __uint(32) data);
};
class BtestIndication {
    void heard(__uint(32) v);
};

class BtestIfc {
    __software BtestRequest                     request;
    __software BtestIndication                 *indication;
};

class Btest __implements BtestIfc {
    BRAM<4, 1024> bram;
    bool waitRead;

    void request.write(__uint(32) addr, __uint(32) data) {
        printf("write: addr %x data %x\n", addr, data);
        bram.write(__bitsubstr(addr, 9, 0), __bitsubstr(data, 3, 0));
    }

    void request.read(__uint(32) addr) {
        printf("read: addr %x\n", addr);
        bram.read(__bitsubstr(addr, 9, 0));
        waitRead = true;
    }
    __rule callBack if (waitRead) {
        printf("callback: data %x\n", bram.dataOut());
        indication->heard(bram.dataOut());
        waitRead = false;
    }
};
