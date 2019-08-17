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
//#include <tr1/type_traits>
#include <atomicc.h>
#include "funnel.h"
template<int funnelWidth, int dataWidth>
__module FunnelHalfBase {
public:
    typedef PipeInBin<dataWidth> PipeData;
    PipeData input[funnelWidth];
    typedef PipeData OutFunnel[funnelWidth/2];
    OutFunnel *output;

    for (int j = 0; j < funnelWidth / 2; j = j+1) {
        void input.enq[j * 2 + 1](__uint(dataWidth) v) {
            (*output)[j].enq(v);
        };
        void input.enq[j * 2](__uint(dataWidth) v) if (!__valid(input[j * 2 + 1].enq)) {
            (*output)[j].enq(v);
        };
    };
};

static FunnelHalfBase<8, 32> dummy;

template<int funnelWidth, int dataWidth>
__module FunnelBase {
    typedef FunnelHalfBase<funnelWidth, dataWidth> Stack;
    Stack level[__clog2(funnelWidth)];
    decltype(level[0].input) input = level[0].input;
    typename Stack::PipeData *output = level[__clog2(funnelWidth) - 1].output[0];
    //typename std::tr1::remove_reference<decltype(level[0].output[0])>::type *output = level[__clog2(funnelWidth) - 1].output[0];
    //decltype((*level[0].output)[0]) *output = level[__clog2(funnelWidth) - 1].output[0];
    __rule connRule {
    for (int j = 1; j < __clog2(funnelWidth); j = j+1) {
        for (int i = 0; i < funnelWidth; i = i + 1) {
            //level[j].input[i] = level[j - 1].output[i];
            (*level[j - 1].output)[i] = level[j].input[i];
        }
    }
    }
};

static FunnelBase<8, 32> dummy2;
