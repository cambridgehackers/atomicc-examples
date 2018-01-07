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

// Serialization structures
typedef struct {
    int tag;
#define EchoRequest_tag_say 1
#define EchoRequest_tag_say2 2
    struct EchoRequest_union {
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
    struct EchoIndication_union {
        struct EchoIndication_heard {
            int meth;
            int v;
        } heard;
    } data;
} EchoIndication_data;

// Interface classes
__interface EchoRequest {
    void say(int meth, int v);
    void say2(int meth, int v);
};

__interface EchoIndication {
    void heard(int meth, int v);
};

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
__module EchoRequestOutput { // method -> pipe
    EchoRequest request;
    EchoRequestPipe *pipe;
    void sayactual(int meth, int v) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
    void say2actual(int meth, int v) {
        printf("entered EchoRequestOutput::say2\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say2;
        ind.data.say2.meth = meth;
        ind.data.say2.v = v;
        pipe->enq(ind);
    }
    EchoRequestOutput() {
        request.say = sayactual;
        request.say2 = say2actual;
    }
};

__module EchoRequestInput { // pipe -> method
    EchoRequestPipe pipe;
    EchoRequest *request;
    void enqactualreq(EchoRequest_data v) {
        printf("entered EchoRequestInput::enq tag %d\n", v.tag);
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        case EchoRequest_tag_say2:
            request->say2(v.data.say2.meth, v.data.say2.v);
            break;
        }
    }
    EchoRequestInput() {
        pipe.enq = enqactualreq;
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
__module EchoIndicationOutput { // method -> pipe
    EchoIndication indication;
    EchoIndicationPipe *pipe;
    EchoIndication_data ind0;
    EchoIndication_data ind1;
    int ind_busy;
    int even;
    void heardactual(int meth, int v) if (!ind_busy) {
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
    EchoIndicationOutput() {
       indication.heard = heardactual;
        __rule output_rulee if (((ind_busy != 0) & (even != 0)) != 0) {
printf("output_rulee: EchoIndicationOutput tag %d\n", ind0.tag);
             ind_busy = 0;
             pipe->enq(ind0);
           };
        __rule output_ruleo if (((ind_busy != 0) & (even == 0)) != 0) {
printf("output_ruleo: EchoIndicationOutput tag %d\n", ind1.tag);
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
    void enqactualind(const EchoIndication_data v) if(!busy_delay) {
printf("%s: EchoIndicationInput tag %d\n", __FUNCTION__, v.tag);
        switch (v.tag) {
        case EchoIndication_tag_heard:
            meth_delay = v.data.heard.meth;
            v_delay = v.data.heard.v;
            busy_delay = 1;
            break;
        }
    }
    EchoIndicationInput() {
        pipe.enq = enqactualind;
        __rule input_rule if (busy_delay != 0) {
printf("input_rule: EchoIndicationInput\n");
             busy_delay = 0;
             indication->heard(meth_delay, v_delay);
           };
    }
};

__module Echo {
    EchoRequest request;
    int busy;
    int meth_temp;
    int v_temp;
    int busy_delay;
    int meth_delay;
    int v_delay;
    int x;
    int y;
    EchoIndication *indication;
    void sayactual(int meth, int v) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        meth_temp = meth;
        v_temp = v;
        busy = 1;
    }
    void say2actual(int meth, int v) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        meth_temp = meth;
        v_temp = v;
        busy = 1;
    }
public:
    void y2x(void) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        x = y;
    }
    void y2xnull(void) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        //x = y;
    }
    void x2y(void) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        y = x;
    }
    Echo() {
        request.say = sayactual;
        request.say2 = say2actual;
        __rule delay_rule if ((busy != 0 & busy_delay == 0) != 0) {
printf("delay_rule: Echo\n");
             busy = 0;
             busy_delay = 1;
             meth_delay = meth_temp;
             v_delay = v_temp;
           };
        __rule respond_rule if (busy_delay != 0) {
printf("respond_rule: Echo\n");
             busy_delay = 0;
             indication->heard(meth_delay, v_delay);
           };
    }
};

class foo { // method -> pipe
    EchoIndication indication;
    void heardactual(int meth, int v) {
        printf("Heard an echo: %d %d\n", meth, v);
            //stop_main_program = 1;
    }
public:
    foo() {
        indication.heard = heardactual;
    }
};
foo zConnectresp;

__module Connect {
    EchoIndicationOutput lEIO;
    EchoRequestInput lERI;
    Echo lEcho;

    EchoRequestOutput lERO_test;
    EchoIndicationInput lEII_test;
    Connect() {
#if 0
        connectInterface((void **)&lERI.request, &lEcho.request, 0);
        connectInterface((void **)&lEIO.pipe, &lEII_test.pipe, 0);
        connectInterface((void **)&lEcho.indication, &lEIO.indication, 0);
        connectInterface((void **)&lERO_test.pipe, &lERI.pipe, 0);
        connectInterface((void **)&lEII_test.indication, &zConnectresp.indication, 0); // user indication
#else
        lERI.request = &lEcho.request;
    //void say(int meth, int v);
    //void say2(int meth, int v);
        lEIO.pipe = &lEII_test.pipe;
        lEcho.indication = &lEIO.indication;
        lERO_test.pipe = &lERI.pipe;
        lEII_test.indication = &zConnectresp.indication; // user indication
#endif

        __rule swap_rule {
printf("swap_rule:Connect\n");
             lEcho.x2y();
             lEcho.y2x();
           };
        __rule swap2_rule {
printf("swap2_rule:Connect\n");
             lEcho.y2xnull();
           };
    };
};

Connect connectTest;
