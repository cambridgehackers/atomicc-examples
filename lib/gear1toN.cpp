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

template<int widthIn, int widthOut>
__module Gear1toNBase : public Gear<__uint(widthIn), __uint(widthOut)> {
    __uint(widthOut) buffer;
    __uint(widthOut/widthIn) c;
    __shared __uint(widthIn) m;
    bool readyOut() { return c == widthOut/widthIn ; };
    void out.deq() if (readyOut()) {
        c = 0;
    }
    __uint(widthOut) out.first() if (readyOut()) { return buffer; }
    void in.enq(__uint(widthIn) v) if (!readyOut()) {
        m = v;
        for (int i = 0; i < widthOut/widthIn; i = i+1)
            if (i == c)
                *__bitsubstrl(buffer, ((i + 1) * widthIn) - 1, (i * widthIn)) = m;
        c++;
    }
};

template<class In, class Out>
__module Gear1toN : public Gear<In, Out> {
  Gear1toNBase<__bitsize(In), __bitsize(Out)> gear;
  void in.enq(const In v) { gear.in.enq(__bit_cast<__uint(__bitsize(In))>(v)); };
  void out.deq(void) { gear.out.deq(); }
  Out out.first(void) { return __bit_cast<Out>(gear.out.first()); };
};
Gear1toN<__uint(32), __uint(128)> bar;
