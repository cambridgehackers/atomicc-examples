/* Copyright (c) 2018 The Connectal Project
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
#include "userTop.h"

#define MAX_BUS_WIDTH 32

// Modules from SystemVerilog runtime
template<int width>
__interface VBeat {
    void beat(int v, bool last);
};

template<int width>
__emodule VsimReceive {
    VBeat<width> *_;
};
template<int width>
__emodule VsimSend {
    VBeat<width> _;
};

// Top of verilator simulation
__interface VsimInterface {
   __input  __uint(1)  CLK;
   __input  __uint(1)  nRST;
   __input  __uint(1)  CLK_derivedClock;
   __input  __uint(1)  nRST_derivedReset;
   __input  __uint(1)  CLK_sys_clk;
};

__module VsimTop {
    VsimInterface              _;
    PipeInB<BusType>           readUser;
    UserTop                    user;
    VBeat<MAX_BUS_WIDTH>       writeUser;
    VsimReceive<MAX_BUS_WIDTH> sink_0;
    VsimSend<MAX_BUS_WIDTH>    source_0;
    __connect readUser = user.read;
    __connect sink_0._ = writeUser;

    void readUser.enq(BusType v, LenType length) {
        source_0._.beat(v, length == 1);
    }
    void writeUser.beat(int v, bool last) {
        user.write.enq(v, last ? 1 : 2);
    }
};
