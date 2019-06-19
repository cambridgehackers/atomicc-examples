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
__module GearNto1Base : public Gear<__uint(widthIn), __uint(widthOut)> {
    __uint(widthOut) q[widthIn/widthOut];
    //__atomicc_uint(log2(widthIn/widthOut)) c;
    __uint(widthIn/widthOut) c;
    bool empty() { return c == 0; };
    bool full() { return c != 0; };
    void out.deq() if (!empty()) {
        for (int i=0; (i + 1)<widthIn/widthOut; i=i+1)
            q[i] = q[i + 1];
        c--;
    }
    __uint(widthOut) out.first() if (!empty()) { return q[0]; }
    void in.enq(__uint(widthIn) v) if (!full()) {
        q[c] = v;
        c = widthIn/widthOut;
    }
};

template<class In, class Out>
__module GearNto1 : public Gear<In, Out> {
  GearNto1Base<__bitsize(In), __bitsize(Out)> gear;
  void in.enq(const In v) { gear.in.enq(__bit_cast<__uint(__bitsize(In))>(v)); };
  void out.deq(void) { gear.out.deq(); }
  Out out.first(void) { return __bit_cast<Out>(gear.out.first()); };
};
GearNto1<__uint(128), __uint(32)> bar;
