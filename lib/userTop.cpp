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
    __connect write = wadapter_0.in;
    __connect read = radapter_0.out;
    l_top       ctop;
    PipeInH<NOCData> wad __implements wadapter_0.out;
    PipeInH<NOCData> indication __implements ctop.indication;

    void wad.enq(NOCData v, __int(16) length) {
printf("reqConnect.enq v %llx length %lx\n", (long long)__bit_cast<__int(__bitsize(v))>(v), (long)length);
        ctop.request.enq(__bit_cast<NOCDataH>(__bitconcat(__bit_cast<__int(__bitsize(v))>(v), length)));
    }
    void indication.enq(NOCDataH v) {
        __int(16) newlen = __bitsubstr(__bit_cast<__int(__bitsize(v))>(v), __bitsize(v.length) - 1, 0);
        __int(__bitsize(v.data)) vint = 
__bitsubstr(__bit_cast<__int(__bitsize(v))>(v), __bitsize(v) - __bitsize(v.length) - 1, __bitsize(v.length));
//__bit_cast<__int(__bitsize(v.data))>(v.data);
        __int(16) len = __bitsubstr(vint, 15, 0) - 1;
        __int(16) port = IfcNames_EchoIndicationH2S;
printf("indConnect.enq v %llx len %lx\n", (long long)vint, (long)len);
        radapter_0.in.enq(//__bit_cast<NOCData>(__bitconcat(__bitsubstr(vint, __bitsize(v.data) - 1, 16), port)), len);
__bit_cast<NOCData>(
__bitsubstr(__bit_cast<__int(__bitsize(v))>(v), __bitsize(v) - __bitsize(v.length) - 1, __bitsize(v.length))), newlen);
    }
};
