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
    __output __uint(1)  TDO;
    __input  __uint(1)  TDI;
    PipeInSync<__uint(width)> toBscan;
    PipeInSync<__uint(width)> *fromBscan;
};

template <int width>
class BscanLocal __implements BscanLocalIfc<width> {
    __uint(width) shiftReg;
    bool notReady;

    void toBscan._.enq(__uint(width) v) if (this->capture & !notReady) {
        shiftReg = v;
        notReady = true;
    };
    __rule shiftRule   if (this->shift) {
        shiftReg = __bitconcat(this->TDI, __bitsubstr(shiftReg, width - 1, 1));
    };
    __rule updateRule  if (this->update) {
        this->fromBscan->_.enq(shiftReg);
        notReady = false;
    };
    __rule init {
        this->TDO = __bitsubstr(shiftReg, 0, 0);
    };
};

template <int id, int width>
class Bscan __implements BscanIfc<width> {
    BSCANE2#(JTAG_CHAIN = id) bscan;
    BUFG bscan_mytck;
    BscanLocal<width> localBscan;
    __implements localBscan.fromBscan readBscan;
    bool delayedIndication, delayedRequest;

    void toBscan.enq(__uint(width) v) if (!delayedRequest) {
        localBscan.toBscan._.enq(v);
    }
    void readBscan._.enq(__uint(width) v) if (!delayedIndication) {
        this->fromBscan->enq(v);
    }
    __rule delay1 {
        delayedIndication = __valid(readBscan._.enq);
        delayedRequest = __valid(toBscan.enq);
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
    };
};

Bscan<3, 32> dummyBscan;
