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
#include "grayCounter.h"

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
        __uint(width) temp;
        for(int i = 0; i < width; i += 1)
            *__bitsubstrl(temp, i) = __reduce("^", __bitsubstr(counter, width - 1, i));
        return temp;
    }
    void ifc.writeBin(__uint(width) v) {
        *__bitsubstrl(counter, width - 1) = __bitsubstr(v, width - 1);
        for(int i = 0; i < width - 1; i += 1)
            *__bitsubstrl(counter, i) = __reduce("^", __bitsubstr(v, i + 1, i));
    }

    __rule incdec if (__valid(ifc.increment) != __valid(ifc.decrement)) {
        __uint(1) useLsb = __reduce("^", counter) == __valid(ifc.decrement);
        if (useLsb)
            *__bitsubstrl(counter, 0) ^= 1;
        else {
            if (__bitsubstr(counter, 0))
                *__bitsubstrl(counter, 0 + 1) ^= 1;
            if (!__reduce("|", __bitsubstr(counter, width - 1 - 1, 0)))
                *__bitsubstrl(counter, width - 1) ^= 1;
        }
        for(int i = 1; i < width - 2; i += 1)
            if (!useLsb && __bitsubstr(counter, i)
               && !__reduce("|", __bitsubstr(counter, i - 1, 0)))
                    *__bitsubstrl(counter, i + 1) ^= 1;
    }
};

GrayCounter<10> dummy;
