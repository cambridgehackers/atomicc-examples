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
__emodule PulseWire {
    PulseWireIf _;
};

template<int width, class T>
__module SizedDFIFOF : public Fifo<T> {
#define dflt 0
    T q[width];
    //__atomicc_uint(log2(width)) c;
    __uint(width) c;
    __shared T      x_wire;
    PulseWire enqueueing, dequeueing;
    bool empty() { return c == 0; };
    bool full() { return c == width; };
    __rule incCtr if (enqueueing._.value() && !dequeueing._.value()) {
        c++;
        q[c] = x_wire;
    }
    __rule decCtr if (dequeueing._.value() && !enqueueing._.value()) {
        for (int i=0; i<width; i=i+1)
            q[i] = (i==(width - 1) ? dflt : q[i + 1]);
        c--;
    }
    __rule both if (dequeueing._.value() && enqueueing._.value()) {
        for (int i=0; i<width; i=i+1)
            if (c != i + 1)
                q[i] = (i==(width - 1) ? dflt : q[i + 1]);
        q[c-1] = x_wire;
    }
    void out.deq() if (!empty()) { dequeueing._.send(); }
    T out.first() { return q[0]; }
    void in.enq(T x) if (!full()) {
        enqueueing._.send();
        x_wire = x;
    }
    bool notEmpty() { return !empty(); }
    bool notFull() { return  !full(); }
    void clear() { c = 0; }
#undef dflt
    SizedDFIFOF() {
printf("[%s:%d] CONSTRUCT\n", __FUNCTION__, __LINE__);
    }
};

SizedDFIFOF<GENERIC_INT_TEMPLATE_FLAG, __uint(GENERIC_INT_TEMPLATE_FLAG)> bar;
