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
#include "atomicc.h"
#include "mux.h"
#include "fifo.h"

typedef struct {
    NOCData data;
    __uint(16) length;
} FifoItem;

class MuxPipe __implements MuxPipeIfc {
    Fifo1<NOCDataH>   forwardFifo;
    void in.enq(NOCDataH v) if (!__ready(forwardFifo.out.first)) {
        out->enq(v);
    }
    void forward.enq(NOCDataH v) {
        forwardFifo.in.enq(v);
    }
    __rule fifoRule if (!__valid(in.enq)) {
        out->enq(forwardFifo.out.first());
        forwardFifo.out.deq();
    }
};
