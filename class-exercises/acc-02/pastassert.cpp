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

template <__uint(16) MAX_AMOUNT, int F_TESTID>
class PastAssertIfc {
    void startSignal();
    bool busy();
};

template <__uint(16) MAX_AMOUNT, int F_TESTID>
class PastAssert __implements PastAssertIfc<MAX_AMOUNT, F_TESTID> {
    __uint(16) counter;
    bool fPastValid;
    
    void startSignal() if (counter == 0) {
        counter = MAX_AMOUNT - 1;
    }
    bool busy() {
        return counter != 0;
    }
    __rule decRule if (counter != 0) {
        counter--;
    }
    __rule verify0 {
        __assert(counter < MAX_AMOUNT);
    }
    __rule verify1a if (F_TESTID == 1) {
        __assert(!startSignal__ENA);
    }
    __rule verify1b if (F_TESTID == 1) {
        __assert($past(counter == 0));
    }
    __rule verify2a if (F_TESTID == 2) {
        __assert(!startSignal__ENA);
    }
    __rule verify2b if (F_TESTID == 2) {
        __assert(counter == 0);
    }
    __rule verify3a if (F_TESTID == 3) {
        if ($past(__valid(startSignal)) && $past(counter) == 0)
            __assert(counter == 0xffff);
    }
    __rule verify4a if (F_TESTID == 4) {
        fPastValid = 1;
    }
    __rule verify4b if (F_TESTID == 4) {
        if (fPastValid && $past(__valid(startSignal)) && $past(counter) == 0)
            __assert(counter == 0xffff);
    }
};

PastAssert<22, 9999> dummy;