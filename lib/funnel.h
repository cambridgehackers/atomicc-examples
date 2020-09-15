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
#ifndef _FUNNEL_H_
#define _FUNNEL_H_
#include "fifo.h"

template<int funnelWidth, int width>
class FunnelBaseIfc {
    PipeIn<__uint(width)> in[funnelWidth];
    PipeIn<__uint(width)> *out;
};

template<int funnelWidth, int width>
class FunnelBase __implements FunnelBaseIfc<funnelWidth, width>;

template<int funnelWidth, int width>
class FunnelBufferedBase __implements FunnelBaseIfc<funnelWidth, width>;
static FunnelBufferedBase<99, 32> dummyFunnel; // to force at least 1 instantiation of template into IR

template<int funnelWidth, class T>
class FunnelIfc {
    PipeIn<T> in[funnelWidth];
    PipeIn<T> *out;
};

template<int funnelWidth, class T>
class Funnel __implements FunnelIfc<funnelWidth, T> {
    FunnelBase<funnelWidth, __bitsize(T)> base;
    __connect base.in = this->in;
    __connect base.out = this->out;
};

template<int funnelWidth, class T>
class FunnelBuffered __implements FunnelIfc<funnelWidth, T> {
    FunnelBufferedBase<funnelWidth, __bitsize(T)> base;
    __connect base.in = this->in;
    __connect base.out = this->out;
};
#endif // _FUNNEL_H_

