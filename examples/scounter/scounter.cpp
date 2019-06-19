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
//#include "fifo.h"

__interface PulseWireIf {
    bool value();
    void send();
};
__module PulseWire {
    PulseWireIf ifc;
    bool ifc.value() { return false; }
    void ifc.send() {}
};

template<int depth, int width, int bypass = 0>
__module SCounterBase : public Fifo<__uint(width)> {
#define dflt 0
    __uint(width) q[depth];
    //__atomicc_uint(log2(depth)) c;
    __uint(depth) c;
    __shared __uint(width)      x_wire;
    bool empty() { return c == 0; };
    bool full() { return c == depth; };
    void out.deq() if (!empty()) {
        for (int i=0; (i + 1)<depth; i=i+1)
            q[i] = ((i == c-1) & (bypass == 444) & __valid(this->in.enq)) ? x_wire : q[i + 1];
        if ((bypass != 444) | !__valid(this->in.enq))
            c--;
    }
    __uint(width) out.first() { return q[0]; }
    void in.enq(__uint(width) v) if (!full()) {
        x_wire = v;
        if ((bypass != 444) | !__valid(this->out.deq)) {
            q[c] = v;
            c++;
        }
    }
    bool notEmpty() { return !empty(); }
    bool notFull() { return  !full(); }
    void clear() { c = 0; }
#undef dflt
    SCounterBase() {
printf("[%s:%d] CONSTRUCT\n", __FUNCTION__, __LINE__);
    }
};

template<int depth, class T, int bypass = 0>
__module SCounter : public Fifo<T> {
  SCounterBase<depth, __bitsize(T), bypass> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};
//GENERIC_INT_TEMPLATE_FLAG
SCounter<10, __uint(999), 444> bar;
