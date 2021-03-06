/* Copyright (c) 2020 The Connectal Project
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
#ifndef __OUT2IN_H__
#define __OUT2IN_H__
#include "atomicc.h"
template <class T>
class Out2InIfc {
    PipeOut<T> *in;
    PipeIn<T> *out;
};

template <int width>
class Out2InBase __implements Out2InIfc<__uint(width)>;

template <class T>
class Out2In __implements Out2InIfc<T> {
    Out2InBase<__bitsize(T)> base;
    __connect base.in = this->in;
    __connect base.out = this->out;
};

template <int width>
class Out2InLastIfc {
    PipeOutLast<width> *in;
    PipeInLast<width> *out;
};

template <int width>
class Out2InLast __implements Out2InLastIfc<width>;
#endif  // __OUT2IN_H__
