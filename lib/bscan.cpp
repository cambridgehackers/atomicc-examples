/* Copyright (c) 2020 The Connectal Project
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
#include "VBscanE2.h"
#include "VBUFG.h"
#include "bscan.h"
#include "syncFF.h"

// If curious why we need to say 'this->capture' instead of 'capture'
// in class BscanLocal:
// For info on dependent type member resolution:
//   http://www.cs.technion.ac.il/users/yechiel/c++-faq/nondependent-name-lookup-members.html
// Implemented in clang: CXXBasePaths::lookupInBases():
//        if (!LookupInDependent && BaseType->isDependentType())
template <int width>
class BscanLocalIfc {
    __input  __uint(1)  CLK;
    __input  __uint(1)  nRST;
    __input  bool       capture;
    __input  bool       shift;
    __input  bool       update;
    __output bool       capture_out;
    __output __uint(1)  TDO;
    __input  __uint(1)  TDI;
    __input __uint(width) toBscan;
    __output __uint(width) fromBscan;
};

template <int width>
class BscanLocal __implements BscanLocalIfc<width> {
    __uint(width) shiftReg;
    bool wasCaptured;

    __rule shiftRule   if (this->shift) {
        shiftReg = __bitconcat(this->TDI, __bitsubstr(shiftReg, width - 1, 1));
    };
    __rule init {
        this->TDO = __bitsubstr(shiftReg, 0, 0);
        if (this->capture & !wasCaptured)
            shiftReg = this->toBscan;
        this->fromBscan = shiftReg;
        wasCaptured = this->capture;
        this->capture_out = wasCaptured;
    };
};

template <int id, int width>
class Bscan __implements BscanIfc<width> {
    BSCANE2#(JTAG_CHAIN = id) bscan;
    BUFG bscan_mytck;
    BscanLocal<width> localBscan;
    SyncFF updateF;
    SyncFF captureF;

    void toBscan.enq(__uint(width) v) if (captureF.out) { // capture on leading edge
        localBscan.toBscan = v;
    }
    __rule updateRule if (updateF.out) { // capture on leading edge
        this->fromBscan->enq(localBscan.fromBscan);
    }
    __rule init {
        bscan_mytck.I = bscan.TCK;
        localBscan.CLK = bscan_mytck.O;
        localBscan.nRST = __defaultnReset;
        localBscan.TDI = bscan.TDI;
        localBscan.TDO = bscan.TDO;
        localBscan.capture = (bscan.SEL & bscan.CAPTURE) != 0;
        localBscan.shift = (bscan.SEL & bscan.SHIFT) != 0;
        localBscan.update = (bscan.SEL & bscan.UPDATE) != 0;
        updateF.CLK = __defaultClock;
        updateF.nRST = __defaultnReset;
        updateF.in = localBscan.update;
        captureF.CLK = __defaultClock;
        captureF.nRST = __defaultnReset;
        captureF.in = localBscan.capture_out;
    };
};

Bscan<99, 32> dummyBscan;
