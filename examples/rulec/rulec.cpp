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

//////////////////// Interface definitions for module under test
__interface EchoRequest {
    void say(int meth, int v);
    void say2(int meth, int v, int v2);
};

__interface EchoIndication {
    void heard(int meth, int v);
    void heard2(int meth, int v, int v2);
};

//////////////////// Serialization structures for interfaces
typedef struct {
    int tag;
#define EchoRequest_tag_say 1
#define EchoRequest_tag_say2 2
    union EchoRequest_union {
        struct EchoRequest_say {
            int meth;
            int v;
        } say;
        struct EchoRequest_say2 {
            int meth;
            int v;
            int v2;
        } say2;
    } data;
} EchoRequest_data;
typedef PipeIn<EchoRequest_data> EchoRequestPipe;

typedef struct {
    int tag;
#define EchoIndication_tag_heard 1
#define EchoIndication_tag_heard2 2
    union EchoIndication_union {
        struct EchoIndication_heard {
            int meth;
            int v;
        } heard;
        struct EchoIndication_heard2 {
            int meth;
            int v;
            int v2;
        } heard2;
    } data;
} EchoIndication_data;
typedef PipeIn<EchoIndication_data> EchoIndicationPipe;

//////////////////////////////////////////////// software side classes
__module EchoRequestOutput { // method -> pipe
    EchoRequest                     method;
    EchoRequestPipe                *pipe;
    void method.say(int meth, int v) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data data;
        data.tag = EchoRequest_tag_say;
        data.data.say.meth = meth;
        data.data.say.v = v;
        pipe->enq(data);
    }
    void method.say2(int meth, int v, int v2) {
        printf("entered EchoRequestOutput::say2\n");
        EchoRequest_data data;
        data.tag = EchoRequest_tag_say2;
        data.data.say2.meth = meth;
        data.data.say2.v = v;
        data.data.say2.v2 = v2;
        pipe->enq(data);
    }
};

__module EchoIndicationInput { // pipe -> method
    EchoIndicationPipe               pipe;
    EchoIndication                  *method;
    void pipe.enq(const EchoIndication_data &v) {
        switch (v.tag) {
        case EchoIndication_tag_heard:
            method->heard(v.data.heard.meth, v.data.heard.v);
            break;
        case EchoIndication_tag_heard2:
            method->heard2(v.data.heard2.meth, v.data.heard2.v, v.data.heard2.v2);
            break;
        }
    }
};

//////////////////////////////////////////////// hardware side classes
__module EchoRequestInput { // pipe -> method
    EchoRequestPipe                 pipe;
    EchoRequest                    *method;
    void pipe.enq(const EchoRequest_data &v) {
        switch (v.tag) {
        case EchoRequest_tag_say:
            method->say(v.data.say.meth, v.data.say.v);
            break;
        case EchoRequest_tag_say2:
            method->say2(v.data.say2.meth, v.data.say2.v, v.data.say2.v2);
            break;
        }
    }
};

__module EchoIndicationOutput { // method -> pipe
    EchoIndication                  method;
    EchoIndicationPipe             *pipe;

    void method.heard(int meth, int v) {
        EchoIndication_data data;
        data.tag = EchoIndication_tag_heard;
        data.data.heard.meth = meth;
        data.data.heard.v = v;
        pipe->enq(data);
    }
    void method.heard2(int meth, int v, int v2) {
        EchoIndication_data data;
        data.tag = EchoIndication_tag_heard2;
        data.data.heard2.meth = meth;
        data.data.heard2.v = v;
        data.data.heard2.v2 = v2;
        pipe->enq(data);
    }
};

//////////////////////////////////////////////// module under test
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
    // interface functions for top of layer
    EchoRequest                request;
    EchoIndication            *indication;
    EchoRequestOutput          lERO_test;
    EchoIndicationInput        lEII_test;
    __connect                  request = lERO_test.method;
    __connect                  lEII_test.method = indication; // user indication

    // interface function for bottom of layer
    EchoRequestPipe           *reqPipe;
    EchoIndicationPipe         indPipe;
    __connect                  indPipe = lEII_test.pipe;
    __connect                  lERO_test.pipe = reqPipe;
};

//////////////////////////// this is the stack that will run in the hardware
__module Hardware {
    EchoRequestPipe            request;
    EchoIndicationPipe        *indication;

    // top interface
    EchoRequestInput           lERI;      // request pipe
    EchoIndicationOutput       lEIO;      // indication pipe
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
