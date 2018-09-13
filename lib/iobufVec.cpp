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

//template<int iovecWidth>
__module IobufVec {
    IobufVecPins/*<iovecWidth>*/ _;
    IOBUF iobufs[iovecWidth];
    __rule iobufs {
        int j;
        for (j = 0; j < iovecWidth; j += 1)
            iobufs[j]._.T = _.T;
        for (int i = 0; i < iovecWidth; i = i + 1) {
            iobufs[i]._.IO = __bitsubstr(_.IO, i, 1);
            iobufs[i]._.I = __bitsubstr(_.I, i, 1);
            iobufs[i]._.O = __bitsubstr(_.O, i, 1);
        }
    }
};
#if 0
__module IobufVec2 {
    IobufVecPins/*<iovecWidth>*/ _;
    IOBUF iobufs[iovecWidth];
    void callME(int i) {
        iobufs[i]._.T = _.T;
        iobufs[i]._.IO = __bitsubstr(_.IO, i, 1);
        iobufs[i]._.I = __bitsubstr(_.I, i, 1);
        iobufs[i]._.O = __bitsubstr(_.O, i, 1);
    }
    __rule iobufs {
extern void generateMe(int init, int limit, int inc, void (IobufVec2::*cb)(int));
        generateMe(0, iovecWidth, 1, &IobufVec2::callME);
    }
};
#endif

//static IobufVec<GENERIC_INT_TEMPLATE_FLAG> dummy;
