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
    typedef PipeIn<__uint(dataWidth)> OutFunnel[funnelWidth/2];
    OutFunnel *output;

    for (int j = 0; j < funnelWidth; j = j+1) {
        void input.enq[j](__uint(dataWidth) v) if ( ((j+1)/2 == j/2) | !__valid(input[j + 1].enq)) {
            (*output)[j / 2].enq(v);
        };
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
