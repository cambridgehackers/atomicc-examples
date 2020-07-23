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

template <__uint(16) MAX_AMOUNT>
class BusyCtrIfc {
    void startSignal();
    bool busy();
};

template <__uint(16) MAX_AMOUNT>
class BusyCtr __implements BusyCtrIfc<MAX_AMOUNT> {
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
};

BusyCtr<22> dummy;
