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
#include "fifo.h"

template<int depth, int width, int bypass>
__module SizedFifoBase : public Fifo<__uint(width)> {
    __uint(width) q[depth];
    __uint(__clog2(depth + 0)) c;
    __shared __uint(width)      x_wire;
    bool empty() { return c == 0; };
    bool full() { return c == depth; };
    void out.deq() if (!empty()) {
        for (int i=0; (i + 1)<depth; i=i+1)
            q[i] = ((i == c-1) & (bypass != 0) & __valid(this->in.enq))
                   ? x_wire : q[i + 1];
        if ((bypass == 0) | !__valid(this->in.enq))
            c--;
    }
    __uint(width) out.first() { return q[0]; }
    void in.enq(__uint(width) v) if (!full()) {
        x_wire = v;
        if ((bypass == 0) | !__valid(this->out.deq)) {
            q[c] = v;
            c++;
        }
    }
    bool notEmpty() { return !empty(); }
    bool notFull() { return  !full(); }
    void clear() { c = 0; }
};

SizedFifoBase<20, 128, 999> bar;
