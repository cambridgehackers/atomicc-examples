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
#include "atomicc.h"

class PackRequest {
    void say(__uint(32) v, __uint(8) seqno);
};
class PackIndication {
    void heard(__uint(32) v, __uint(8) writeCount, __uint(8) readCount, __uint(8) seqno);
};

class PackIfc {
    __software PackRequest                     request;
    __software PackIndication                 *indication;
};

class Pack __implements PackIfc {
    __uint(8) readCount, writeCount, seqval;
    __int(32) counter;

    void request.say(__uint(32) v, __uint(8) seqno) {
        seqval = seqno;
        printf("REQUESTSAY v %x write %x read %x seqno %x\n", v, writeCount + 0x20, readCount + 0x40, seqno);
        indication->heard(v, writeCount + 0x20, readCount + 0x40, seqval);
        writeCount++;
        counter--;
        readCount += 0x10;
    }
};
