/* Copyright (c) 2016 The Connectal Project
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
#include <atomicc.h>

__interface EchoRequest {
    void say(int meth, int v);
    void say2(int meth, int v, int v2);
};

__interface EchoIndication {
    void heard(int meth, int v);
    void heard2(int meth, int v, int v2);
};

__module Echo {
    EchoRequest                     request;
    EchoIndication                 *indication;
    int busy;
    int meth_temp;
    int v_temp;
    int v2_temp;
    int busy_delay;
    int meth_delay;
    int v_delay;
    int v2_delay;
    int v_type;
    void request.say(int meth, int v) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        meth_temp = meth;
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(int meth, int v, int v2) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        meth_temp = meth;
        v_temp = v;
        v2_temp = v2;
        busy = 1;
        v_type = 2;
    }
    Echo() {
        __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
printf("[delay_rule:%d]Echo\n", __LINE__);
             busy = 0;
             busy_delay = 1;
             meth_delay = meth_temp;
             v_delay = v_temp;
             v2_delay = v2_temp;
           };
        __rule respond_rule if(busy_delay != 0) {
printf("[respond_rule:%d]Echo\n", __LINE__);
             busy_delay = 0;
             if (v_type == 1)
             indication->heard(meth_delay, v_delay);
             else
             indication->heard2(meth_delay, v_delay, v2_delay);
           };
    }
};

//////////////////////////// this is the stack that will run on the processor
__module Software {
    M2P<EchoRequest>           lERO_test;
    P2M<EchoIndication>        lEII_test;

    // interface functions for top of layer
    EchoRequest                request;
    EchoIndication            *indication;
    __connect                  request = lERO_test.method;
    __connect                  lEII_test.method = indication; // user indication

    // interface function for bottom of layer
    PipeIn<M2P<EchoRequest>::Data>   *reqPipe;
    PipeIn<P2M<EchoIndication>::Data> indPipe;
    __connect                  indPipe = lEII_test.pipe;
    __connect                  lERO_test.pipe = reqPipe;
};

//////////////////////////// this is the stack that will run in the hardware
__module Hardware {
    P2M<EchoRequest>                 lERI;      // request pipe
    M2P<EchoIndication>              lEIO;      // indication pipe

    // top interface
    PipeIn<P2M<EchoRequest>::Data>   request;
    PipeIn<M2P<EchoIndication>::Data> *indication;
    __connect                  request = lERI.pipe;
    __connect                  lEIO.pipe = indication;

    // Module under test
    Echo                       lEcho;
    __connect lERI.method = lEcho.request;
    __connect lEcho.indication = lEIO.method;
};

//////////////////////////// this is a test bench mockup to connect s/w and h/w
//                           (just to check compilation)
__module Connect {
    __software EchoRequest    request;
    __software EchoIndication *indication;
    Software                   sw;
    Hardware                   hw;
    // expose top interfaces
    __connect                  sw.indication = indication;
    __connect                  request = sw.request;

    // connect h/w stack and s/w stack interfaces
    __connect                  hw.indication = sw.indPipe;
    __connect                  sw.reqPipe = hw.request;
};

Connect connectTest;

// hack for clang
P2M<EchoRequest>::Data foo1;
P2M<EchoIndication>::Data foo2;
M2P<EchoRequest>::Data foo3;
M2P<EchoIndication>::Data foo4;
