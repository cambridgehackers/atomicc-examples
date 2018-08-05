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
    VBeat *beat;
};
__emodule VsimSend {
    VBeat beat;
};
  //VsimReceive #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .nRST(RST_N),
   //.EN_beat(EN_writeBeat), .RDY_beat(RDY_writeBeat), .beat(writeData), .last(writeLast));
  //VsimSend #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .nRST(RST_N),
   //.EN_beat(EN_readBeat), .RDY_beat(RDY_readBeat), .beat(readData), .last(readLength == 1));

  //assign writeLength = writeLast ? 1 : 2;
  //UserTop top (.CLK(CLK), .nRST(RST_N),
    //.write$enq__ENA(EN_writeBeat), .write$enq__RDY(RDY_writeBeat), .write$enq$v(writeData), .write$enq$length(writeLength),
   //.read$enq__ENA(EN_readBeat), .read$enq__RDY(RDY_readBeat), .read$enq$v(readData), .read$enq$length(readLength));

#define MAX_BUS_WIDTH 32
__module VsimTop {
    VsimInterface    _;
    PipeInB<BusType> readUser;
    UserTop          user;
    VBeat            writeUser;
    VsimReceive/*#(width=MAX_BUS_WIDTH)*/ sink_0;
    VsimSend/*#(width=MAX_BUS_WIDTH)*/ source_0;

    void readUser.enq(BusType v, LenType length) {
        source_0.beat.beat(v, length == 1);
    }
    void writeUser.beat(int v, bool last) {
        user.write.enq(v, last ? 1 : 2);
    }
    __connect readUser = user.read;
    __connect sink_0.beat = writeUser;

    VsimTop() {
        __rule init {
        }
    }
};
