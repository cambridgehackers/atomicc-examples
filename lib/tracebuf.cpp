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

#define TIMESTAMP_WIDTH 32

template <int width, int depth>    // 'width' includes TIMESTAMP_WIDTH
class Trace __implements TraceIfc<width, depth> {
    __uint(TIMESTAMP_WIDTH) timestamp;
    __uint(width) buffer;
    BRAM<width, depth> bram;
    __uint(__clog2(depth)) addr, readAddr;
    Bscan<3,width> bscan;
    __implements bscan.fromBscan readUser;
    bool dataAvail;

    void readUser.enq(__uint(width) v) { // data from jtag
        // rate limit the read from trace buffer
        if (!dataAvail) {
            bram.read(readAddr);
            readAddr++;
            dataAvail = true;
        }
    }
    __rule copyRule if (this->enable && buffer != this->data) {
        // write next entry to trace buffer
        bram.write(addr, __bitconcat(timestamp, __bitsubstr(this->data, width - 32L, 0))); // clang weirdly truncates 'width' to int[6]
        addr++;
        buffer = this->data;
    }

    __rule callBack {
        // send to trace buffer to jtag
        bscan.toBscan.enq(bram.dataOut());
        dataAvail = false;
    }
    __rule init {
        timestamp++;
    }
};

Trace<64, 1024> dummy;
