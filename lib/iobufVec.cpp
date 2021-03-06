/* Copyright (c) 2018 The Connectal Project
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
#include "iobufVec.h"
#include "VIOBUF.h"

template<int iovecWidth>
class IobufVec __implements IobufVecPins<iovecWidth> {
    IOBUF iobufs[iovecWidth];
    __rule iobufs {
        for (int i = 0; i < iovecWidth; i = i + 1) {
            iobufs[i].T = this->T;
            iobufs[i].IO = __bitsubstr(this->IO, i, 1);
            iobufs[i].I = __bitsubstr(this->I, i, 1);
            iobufs[i].O = __bitsubstr(this->O, i, 1);
        }
    }
};

static IobufVec<GENERIC_INT_TEMPLATE_FLAG> dummy;
