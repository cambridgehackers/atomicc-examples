// Copyright (c) 2019 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#include <atomicc.h>
#include "funnel.h"
template<int funnelWidth, int dataWidth>
__module FunnelHalfBase {
public:
    PipeIn<__uint(dataWidth)> input[funnelWidth];
    PipeIn<__uint(dataWidth)> *output[funnelWidth/2];
    int i, k;
    FunnelHalfBase() {
#if 0
        for (int jj = 0; jj < 3; jj = jj+1) {
            __rule foo {
                 i = jj + k;
            }
        }
#endif
    }

    for (int j = 0; j < funnelWidth / 2; j = j+1) {
        void input.enq[j * 2 + 1](__uint(dataWidth) v) {
i = v;
            //output->enq[j](v);
        };
#if 0
        void input.enq[j * 2](__uint(dataWidth) v) if (!__valid(input[j * 2 + 1].enq)) {
            output->enq[j](v);
        };
#endif
    };
};

static FunnelHalfBase<10, 32> dummy;

#if 0
template<int funnelWidth, int dataWidth>
__module FunnelBase {
    for (int j = 0; j < __clog2(funnelWidth); j = j+1) begin
        pipeFunnelHalf<funnelWidth / 2 ** j, dataWidth> level;
        level[j].input = (j == 0) ? input : level[j - 1].output;
    end;
    output = level[__clog2(funnelWidth) - 1].output;
};

static FunnelBase<GENERIC_INT_TEMPLATE_FLAG> dummy;
#endif
