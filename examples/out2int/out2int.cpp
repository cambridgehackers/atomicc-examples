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
#include "out2in.h"

class OinRequest {
    void say(__uint(32) v);
};
class OinIndication {
    void heard(__uint(32) v);
};

class OinIfc {
    __software OinRequest                     request;
    __software OinIndication                 *indication;
};

class Oin __implements OinIfc {
    Fifo1<__uint(32)> first, second;
    Out2In<__uint(32)> pipe;
    __connect pipe.in = first.out;
    __connect pipe.out = second.in;

    void request.say(__uint(32) v) {
        first.in.enq(v);
        printf("REQUESTSAY v %x\n", v);
    }

    __rule copyRule {
        indication->heard(second.out.first());
        second.out.deq();
    }

};
