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
#include "userTop.h"

// Modules from SystemVerilog runtime
template<int width>
class VsimReceiveIfc {
    PipeInLast<width> *port;
};
template<int width>
class VsimReceive __implements VsimReceiveIfc<width>;

template<int width>
class VsimSendIfc {
    PipeInLast<width> port;
};
template<int width>
class VsimSend __implements VsimSendIfc<width>;

// Top of verilator simulation
class VsimInterface {
   __input  __uint(1)  CLK;
   __input  __uint(1)  nRST;
   __input  __uint(1)  CLK_derivedClock;
   __input  __uint(1)  nRST_derivedReset;
   __input  __uint(1)  CLK_sys_clk;
};

class VsimTop __implements VsimInterface {
    UserTop                    user;
    VsimReceive<BusTypeWidth> sink_0;
    VsimSend<BusTypeWidth>    source_0;
    __connect user.write = sink_0.port;
    __connect user.read = source_0.port;
};
