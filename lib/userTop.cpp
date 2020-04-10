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
#include "adapter.h"
#include "userTop.h"

#define IfcNames_EchoIndicationH2S 5

class UserTop __implements UserTopIfc {
    AdapterToBus<NOCData, BusType> radapter_0;
    AdapterFromBus<BusType, NOCData> wadapter_0;
    PipeInB<BusType> write = wadapter_0.in;
    PipeInB<BusType> *read = radapter_0.out;

    PipeInH<NOCData> wad;
    void wad.enq(NOCData v, __int(16) length) {
printf("reqConnect.enq v %llx length %lx\n", (long long)__bit_cast<__int(__bitsize(v))>(v), (long)length);
        ctop.request.enq(v);
    }
    PipeInH<NOCData> indication;
    void indication.enq(NOCData v, __int(16) length) {
        __int(__bitsize(v)) vint = __bit_cast<__int(__bitsize(v))>(v);
        __int(16) len = __bitsubstr(vint, 15, 0) - 1;
        __int(16) port = IfcNames_EchoIndicationH2S;
printf("indConnect.enq v %llx len %lx\n", (long long)__bit_cast<__int(__bitsize(v))>(v), (long)len);
        radapter_0.in.enq(//__bit_cast<NOCData>(__bitconcat(__bitsubstr(vint, __bitsize(v) - 1, 16), port)), len);
v, length);
    }

    l_top       ctop;
    __connect ctop.indication = indication;
    __connect wadapter_0.out = wad;
};
