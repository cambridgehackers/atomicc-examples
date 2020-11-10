// Copyright (c) 2020 The Connectal Project

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
#include "tracebuf.h"
#include "bram.h"
#include "bscan.h"
#include "adapter.h"
#include "fifo.h"

#define TIMESTAMP_WIDTH 32
//#define DEBUG

template <int width, int depth, int sensitivity, int head>    // 'width' includes TIMESTAMP_WIDTH
class Trace __implements TraceIfc<width, depth, sensitivity, head> {
    BRAM<width, depth> bram;

    // trace capture to bram
    __uint(TIMESTAMP_WIDTH) timestamp;
    __uint(sensitivity) buffer;
    __uint(__clog2(depth)) addr;
    __rule copyRule if (this->enable && buffer != __bitsubstr(this->data, width - 32L - 1, width - 32L - sensitivity)) {
        __uint(32) prefix = 0xffeeddcc;
        __uint(32) suffix = 0xaabbccdd;
        // write next entry to trace buffer
        bram.write(addr, __bitconcat(timestamp, 
#ifndef DEBUG
             __bitsubstr(this->data, width - 32L - 1, 0)
#else
             prefix, __bitsubstr(this->data, width - 32L - 64L - 1, 0), suffix
#endif
        )); // clang weirdly truncates 'width' to int[6]
        if (head == 0 || addr != depth - 1)
            addr++;
        buffer = __bitsubstr(this->data, width - 32L - 1, width - 32L - sensitivity);
    }
    __rule init {
        timestamp++;
    }

    // trace readout to bscan
    __uint(__clog2(depth)) readAddr;
    AdapterToBus<width, 32> radapter;

    // chop trace data into __uint(32) packets
    __rule readCallBack {
        radapter.in.enq(bram.dataOut(), width);
    }

    void clear(void) {
        radapter.clear();
    }
    // pass chopped up data to jtag
    __uint(32) out.first(void) {
        return radapter.out.first();
    }
    void out.deq(void) {
        if (radapter.out.last())
            bram.read(readAddr++);
        radapter.out.deq();
    }
};

Trace<48, 1024, 99, 77> dummy;
