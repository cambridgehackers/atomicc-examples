// Copyright (c) 2020 The Connectal Project

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
#include "funnel.h"

template<int funnelWidth, int dataWidth>
class FunnelBufferedBase __implements FunnelBaseIfc<funnelWidth, dataWidth> {
    FifoPBase<dataWidth>  buffer [funnelWidth];
    FunnelBase<funnelWidth, dataWidth> base;
    __connect base.out  = this->out;
    __rule init {
        for (int i = 0; i < funnelWidth; i = i + 1) {
            __connect buffer[i].in = this->in[i];
            __connect base.in[i]   = buffer[i].out;
        }
    }
};

FunnelBufferedBase<4, 32> dummy;
