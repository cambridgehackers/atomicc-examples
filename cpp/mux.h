// Copyright (c) 2015 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#ifndef _MUX_H_
#define _MUX_H_
#include "atomicc.h"

#define FIFO_NO_DUMMY_INSTANTIATION
#include "fifo.cpp"
__module MuxPipe {
public:
    NOCPipe           in;
    NOCPipe      forward;
    NOCPipe         *out;
    Fifo1<NOCData>   forwardFifo;
    void in.enq(NOCData v) {
        out->enq(v);
    }
    void forward.enq(NOCData v) {
        forwardFifo.in.enq(v);
    }
    MuxPipe() {
        __rule fifoRule {
            out->enq(forwardFifo.out.first());
            forwardFifo.out.deq();
        }
    }
};
static MuxPipe unusedMuxPipe;
#endif // _MUX_H_
