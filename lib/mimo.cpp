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
#include "mimo.h"

template<int widthIn, int widthOut>
class MIMOBase __implements Gear<__uint(widthIn), __uint(widthOut)> {
    __uint(widthOut + widthIn) buffer;
    __uint(__clog2(widthOut + widthIn)+1) c;
    __shared __uint(widthIn) m;
    bool readyOut() { return c >= widthOut; };
    void out.deq() if (readyOut()) {
        //shift down buffer by width of output
        buffer = __bitsubstr(buffer, widthOut + widthIn-1, widthOut);
        if (c <= widthOut)
            c = 0;
        else
            c -= widthOut;
    }
    __uint(widthOut) out.first() if (readyOut()) { return buffer; }
    void in.enq(__uint(widthIn) v) if (!readyOut()) {
        m = v;
        for (int i = 0; i < widthOut; i = i+1)
            if ((widthOut - i) == c)
                *__bitsubstrl(buffer, i + widthIn - 1, i) = m;
        c += widthIn;
    }
};

MIMOBase<32, 128//GENERIC_INT_TEMPLATE_FLAG
> bar;
