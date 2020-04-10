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
class GrayCounter __implements GrayCounterIfc<width> {
    __uint(1) counter[width];
    __shared __uint(width) m;

    void increment() { }
    void decrement() { }

    __uint(width) readGray() {
        __uint(width) ctemp;
        for(int i = 0; i < width; i += 1)
            *__bitsubstrl(ctemp, i) = counter[i];
        return ctemp;
    }
    void writeGray(__uint(width) v) {
        for(int i = 0; i < width; i += 1)
            counter[i] = __bitsubstr(v, i);
    }

    __uint(width) readBin() {
        __uint(1) temp[width];
        __uint(width) ctemp;
        for(int i = 0; i < width; i += 1)
            *__bitsubstrl(ctemp, i) = counter[i];
        for(int i = 0; i < width; i += 1)
            temp[i] = __reduce("^", __bitsubstr(ctemp, width - 1, i));
        __uint(width) rtemp;
        for(int i = 0; i < width; i += 1)
            *__bitsubstrl(rtemp, i) = temp[i];
        return rtemp;
    }
    void writeBin(__uint(width) v) {
        for(int i = 0; i < width; i += 1)
            if (i == width - 1)
                counter[i] = __bitsubstr(v, i);
            else
                counter[i] = __reduce("^", __bitsubstr(v, i + 1, i));
    }

    __rule incdec if (__valid(increment) != __valid(decrement)) {
        __uint(width) ctemp;
        for(int i = 0; i < width; i += 1)
            *__bitsubstrl(ctemp, i) = counter[i];
        __uint(1) useLsb = __reduce("^", ctemp) == __valid(decrement);
        for(int i = 0; i < width; i += 1) {
            counter[i] ^= (i == 0) ?  useLsb : ((!useLsb)
               & ((i == width - 1) | __bitsubstr(ctemp, i < 1 ? 0:(i - 1)))
               & ((i == 1) | !__reduce("|", __bitsubstr(ctemp, i < 2 ? 0:(i - 2), 0))));
        }
    }
};

GrayCounter<10> dummy;
