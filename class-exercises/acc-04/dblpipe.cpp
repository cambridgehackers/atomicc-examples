/* Copyright (c) 2016 The Connectal Project
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

template <int LN, int TAPS>
class LfsrFibIfc {
    void shiftBit(bool v);
    bool outBit();
};

template <int LN, int TAPS>
class LfsrFib __implements LfsrFibIfc<LN, TAPS> {
    __uint(LN) sreg;
    
    void shiftBit(bool v) {
        sreg = __bitconcat(__bitsubstr(sreg, LN-1, 1), (__bitsubstr(sreg, 0) & TAPS) ^ v);
    }
    bool outBit() {
        return __bitsubstr(sreg, 0);
    }
};

class DblPipeIfc {
    void shiftBit(bool v);
    bool outBit();
};

class DblPipe __implements DblPipeIfc {
    LfsrFib<8, 0x2d> one;
    LfsrFib<8, 0x2d> two;
    bool o_data;

    void shiftBit(bool v) {
        one.shiftBit(v);
        two.shiftBit(v);
    }
    bool outBit() {
        return o_data;
    }
    __rule updateRule {
        o_data = one.outBit() ^ two.outBit();
    }
};
