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

typedef struct {
    int a;
    int b;
} ValueType;

__interface EchoRequest {
    void say(int meth, int v);
    void say2(int meth, int v, int v2);
};

__interface EchoIndication {
    void heard(int meth, int v);
    void heard2(int meth, int v, int v2);
};

// Serialization structures
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

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
__module EchoRequestOutput { // method -> pipe
    EchoRequest request;
    EchoRequestPipe *pipe;
    void request.say(int meth, int v) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
    void request.say2(int meth, int v, int v2) {
        printf("entered EchoRequestOutput::say2\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say2;
        ind.data.say2.meth = meth;
        ind.data.say2.v = v;
        ind.data.say2.v2 = v2;
        pipe->enq(ind);
    }
};

__module EchoRequestInput { // pipe -> method
    EchoRequestPipe pipe;
    EchoRequest *request;
    void pipe.enq(const EchoRequest_data &v) {
        printf("entered EchoRequestInput::enq tag %d\n", v.tag);
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        case EchoRequest_tag_say2:
            request->say2(v.data.say2.meth, v.data.say2.v, v.data.say2.v2);
            break;
        }
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
EchoIndicationPipe unusedEIP;
__module EchoIndicationOutput { // method -> pipe
    EchoIndication indication;
    EchoIndicationPipe *pipe;
    EchoIndication_data ind0;
    EchoIndication_data ind1;
    int ind_busy;
    int even;
    void indication.heard(int meth, int v) if(!ind_busy) {
printf("[%s:%d]EchoIndicationOutput even %d\n", __FUNCTION__, __LINE__, even);
        if (even) {
        ind1.tag = EchoIndication_tag_heard;
        ind1.data.heard.meth = meth;
        ind1.data.heard.v = v;
        }
        else {
        ind0.tag = EchoIndication_tag_heard;
        ind0.data.heard.meth = meth;
        ind0.data.heard.v = v;
        }
        ind_busy = 1;
        even = !even;
    }
    void indication.heard2(int meth, int v, int v2) if(!ind_busy) {
printf("[%s:%d]EchoIndicationOutput even %d\n", __FUNCTION__, __LINE__, even);
        ind0.tag = EchoIndication_tag_heard2;
        ind0.data.heard2.meth = meth;
        ind0.data.heard2.v = v;
        ind0.data.heard2.v2 = v2;
        ind_busy = 1;
    }
    EchoIndicationOutput() {
        __rule output_rulee if(((ind_busy != 0) & (even != 0)) != 0) {
printf("[output_rulee:%d]EchoIndicationOutput tag %d\n", __LINE__, ind0.tag);
             ind_busy = 0;
             pipe->enq(ind0);
           };
        __rule output_ruleo if(((ind_busy != 0) & (even == 0)) != 0) {
printf("[output_ruleo:%d]EchoIndicationOutput tag %d\n", __LINE__, ind1.tag);
             ind_busy = 0;
             pipe->enq(ind1);
           };
    }
};

__module EchoIndicationInput { // pipe -> method
    EchoIndicationPipe pipe;
    EchoIndication *indication;
    int busy_delay;
    int meth_delay;
    int v_delay;
    int v2_delay;
    int v_type;
    void pipe.enq(const EchoIndication_data &v) if(!busy_delay) {
printf("[%s:%d]EchoIndicationInput tag %d\n", __FUNCTION__, __LINE__, v.tag);
        switch (v.tag) {
        case EchoIndication_tag_heard:
            meth_delay = v.data.heard.meth;
            v_delay = v.data.heard.v;
            busy_delay = 1;
            v_type = 1;
            break;
        case EchoIndication_tag_heard2:
            meth_delay = v.data.heard2.meth;
            v_delay = v.data.heard2.v;
            v2_delay = v.data.heard2.v2;
            busy_delay = 1;
            v_type = 2;
            break;
        }
    }
    EchoIndicationInput() {
        __rule input_rule if(busy_delay != 0) {
printf("[input_rule:%d]EchoIndicationInput\n", __LINE__);
             busy_delay = 0;
             if (v_type == 1)
             indication->heard(meth_delay, v_delay);
             else
             indication->heard2(meth_delay, v_delay, v2_delay);
           };
    }
};

__module Echo {
    EchoRequest request;
    int busy;
    int meth_temp;
    int v_temp;
    int v2_temp;
    int busy_delay;
    int meth_delay;
    int v_delay;
    int v2_delay;
    int v_type;
    EchoIndication *indication;
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

__module Connect {
    __software EchoRequest request;
    __software EchoIndication *indication;
    EchoIndicationOutput lEIO;
    EchoRequestInput lERI;
    Echo lEcho;

    EchoRequestOutput lERO_test;
    EchoIndicationInput lEII_test;
    void request.say(int meth, int v) {
        lERO_test.request.say(meth, v);
    }
    void request.say2(int meth, int v, int v2) {
        lERO_test.request.say2(meth, v, v2);
    }
    __connect lERI.request = lEcho.request;
    __connect lEIO.pipe = lEII_test.pipe;
    __connect lEcho.indication = lEIO.indication;
    __connect lERO_test.pipe = lERI.pipe;
    __connect lEII_test.indication = indication; // user indication
};

Connect connectTest;
