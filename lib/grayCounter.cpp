/* Copyright (c) 2019 The Connectal Project
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

template <int width>
__interface GrayCounterIfc {
    void increment();
    void decrement();
    __uint(width) readGray();
    void writeGray(__uint(width) v);
    __uint(width) readBin();
    void writeBin(__uint(width) v);
};

template <int width>
__module GrayCounter {
    GrayCounterIfc<width> ifc;
    __uint(width) counter;
    __shared __uint(width) m;

    void ifc.increment() { }
    void ifc.decrement() { }

    __uint(width) ifc.readGray() {
        return counter;
    }
    void ifc.writeGray(__uint(width) v) {
        counter = v;
    }

    __uint(width) ifc.readBin() {
        __uint(1) temp[width];
        temp[width - 1] = __bitsubstr(counter, width - 1);
        for(int i = 0; i < width - 1; i += 1)
            temp[i] = temp[i + 1] ^  __bitsubstr(counter, i);
        return __bit_cast<__uint(width)>(temp);
    }
    void ifc.writeBin(__uint(width) v) {
        *__bitsubstrl(counter, width - 1) = __bitsubstr(v, width - 1);
        for(int i = 0; i < width - 1; i += 1)
            *__bitsubstrl(counter, i) = __bitsubstr(v, i + 1) ^  __bitsubstr(v, i);
    }

    __rule incdec if (__valid(ifc.increment) != __valid(ifc.decrement)) {
        //__uint(__clog2(width)) ind[width];
        __uint(16) ind[width];
        __uint(1) parity[width];
        parity[width - 1] = __bitsubstr(counter, width - 1);
        ind[width - 1] = width - 1;
        for(int i = 0; i < width - 1; i += 1) {
            parity[i] = parity[i+1] ^ __bitsubstr(counter, i);
            ind[i] = __bitsubstr(counter, i) ? (i + 1) : ind[i + 1];
        }
        *__bitsubstrl(counter, (parity[0] == __valid(ifc.decrement)) ? 0 : ind[0]) ^= 1;
    }
};

GrayCounter<10> dummy;
