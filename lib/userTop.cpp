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
#include "adapter.h"
#include "userTop.h"

#define IfcNames_EchoIndicationH2S 5

class UserTop __implements UserTopIfc {
    AdapterToBus<__bitsize(NOCData), BusTypeWidth> radapter_0;
    AdapterFromBus<BusTypeWidth, NOCDataH> wadapter_0;
    l_top       ctop;
    __connect wadapter_0.in = write;
    __connect read = radapter_0.out;
#if 0
    __connect ctop.request = wadapter_0.out;
    __connect ctop.indication = radapter_0.in;
#else
    __implements wadapter_0.out wad;
    __implements ctop.indication indication;
    void wad.enq(NOCDataH v) {
        printf("reqConnect.enq v %x length %x\n", v.data, v.length);
        ctop.request.enq(v);
    }
    void indication.enq(NOCDataH v) {
        printf("indConnect.enq v %x length %x\n", v.data, v.length);
        radapter_0.in.enq(v.data, v.length);
    }
#endif
};
