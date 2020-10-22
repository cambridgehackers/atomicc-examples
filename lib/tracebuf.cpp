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

template <int width, int depth, int sensitivity>    // 'width' includes TIMESTAMP_WIDTH
class Trace __implements TraceIfc<width, depth, sensitivity> {
    BRAM<width, depth> bram;

    // trace capture to bram
    __uint(TIMESTAMP_WIDTH) timestamp;
    __uint(sensitivity) buffer;
    __uint(__clog2(depth)) addr;
    __rule copyRule if (this->enable && buffer != __bitsubstr(this->data, width - 32L - 1, width - 32L - sensitivity)) {
        // write next entry to trace buffer
        bram.write(addr, __bitconcat(timestamp, __bitsubstr(this->data, width - 32L, 0))); // clang weirdly truncates 'width' to int[6]
        addr++;
        buffer = __bitsubstr(this->data, width - 32L - 1, width - 32L - sensitivity);
    }
    __rule init {
        timestamp++;
    }

    // trace readout to bscan
    __uint(__clog2(depth)) readAddr;
    Bscan<3,32> bscan;
    __implements bscan.fromBscan readUser;
    AdapterToBus<width, 32> radapter;
    void readUser.enq(__uint(32) v) { // data from jtag
        if (radapter.out.last())
            bram.read(readAddr++);
        radapter.out.deq();
    }

    // chop up data
    __rule readCallBack {
        radapter.in.enq(bram.dataOut(), width);
    }

    // pass chopped up data to jtag
    __rule callBack {
        // send to trace buffer to jtag
        bscan.toBscan.enq(radapter.out.first());
    }
};

Trace<64, 1024, 99> dummy;
