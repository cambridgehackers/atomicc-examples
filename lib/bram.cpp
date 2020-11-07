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
#include "bram.h"

template <int width, int depth>
class BRAM __implements BRAMIfc<width, depth> {
    __uint(width) RAM [depth];
    __uint(width) readB;
    __uint(1) writeEnable;
    __uint(1) afterRead;

    void write(__uint(__clog2(depth)) addr, __uint(width) data) {
        if (writeEnable)    // need a separate 'enable' for vivado BRAM inference
            RAM[addr] = data;
    }
    void read(__uint(__clog2(depth)) addr) {
        readB = RAM[addr];
    }
    __uint(width) dataOut(void) if (afterRead) {
        return readB;
    }
    __rule init {
        writeEnable = true;
        afterRead = __valid(read);
    }
};


BRAM<4, 1024> dummy;

