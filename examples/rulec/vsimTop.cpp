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
#include "VMMCME2_ADV.h"
#include "VPPS7.h"
#include "VBUFG.h"
#include "VResetInverter.h"
#include "userTop.h"

__interface VsimInterface {
   __input  __uint(1)  CLK;
   __input  __uint(1)  nRST;
   __input  __uint(1)  CLK_derivedClock;
   __input  __uint(1)  nRST_derivedReset;
};

__module ResetInverter {
    MResetInverterResetInverter _;
    ResetInverter() {
    __rule init {
        _.RESET_OUT = !_.RESET_IN;
    }
    }
};

__interface VBeat {
    //__parameter int width;
    void beat(int v, bool last);
};

__emodule VsimReceive {
    VBeat *_;
};
__emodule VsimSend {
    VBeat _;
};

#define MAX_BUS_WIDTH 32
__module VsimTop {
    VsimInterface    _;
    PipeInB<BusType> readUser;
    UserTop          user;
    VBeat            writeUser;
    VsimReceive/*#(width=MAX_BUS_WIDTH)*/ sink_0;
    VsimSend/*#(width=MAX_BUS_WIDTH)*/ source_0;

    void readUser.enq(BusType v, LenType length) {
        source_0._.beat(v, length == 1);
    }
    void writeUser.beat(int v, bool last) {
        user.write.enq(v, last ? 1 : 2);
    }
    __connect readUser = user.read;
    __connect sink_0._ = writeUser;

    VsimTop() {
        __rule init {
        }
    }
};
