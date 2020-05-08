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

template <int count_sz>
class ConfigCounterIfc {
    void decrement(__uint(count_sz) v);
    __action bool maybeDecrement(__uint(count_sz) v);
    void increment(__uint(count_sz) v);
    __uint(count_sz) read(void);
    bool positive(void);
};

template <int count_sz>
class ConfigCounter __implements ConfigCounterIfc<count_sz> {
    __shared __uint(count_sz) inc_wire;
    __shared __uint(count_sz) dec_wire;
    __int(count_sz) cnt;
    bool positive_reg;
    void decrement(__uint(count_sz) v) {
        dec_wire = v;
    }
    __action bool maybeDecrement(__uint(count_sz) v) {
        if (cnt >= v) {
            dec_wire = v;
            return true;
        }
        return false;
    }
    void increment(__uint(count_sz) v) {
        inc_wire = v;
    }
    __uint(count_sz) read(void) {
        return cnt;
    }
    bool positive(void) {
        return positive_reg;
    }
    __rule react {
        __int(count_sz) new_count = (cnt + inc_wire) - dec_wire;
        cnt = new_count;
        positive_reg = (new_count > 0);
    }
};

ConfigCounter<10> dummy;
