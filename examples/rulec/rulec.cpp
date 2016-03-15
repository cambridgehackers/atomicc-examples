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
//char fooo[200];
} ValueType;

ValueType haha;
ValueType bozoreturnfunc(int a)
{
    return haha;
}

// Serialization structures
typedef struct {
    int tag;
#define EchoRequest_tag_say 1
    struct EchoRequest_union {
        struct EchoRequest_say {
            int meth;
            int v;
        } say;
    } data;
} EchoRequest_data;
EchoRequest_data unusedERD;

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
EchoIndication_data unusedEID;

// Interface classes
class EchoRequest: InterfaceClass {
    void *p;
    GUARDPTR say__RDYp;
    void (*sayp)(void *p, int meth, int v);
 public:
    METHOD(say, (int meth, int v), {return true; } ) { sayp(p, meth, v); }
    void init(const char *name, void *ap, unsigned long asay__RDYp, unsigned long asayp) {
        p = ap;
        ASSIGNIFCPTR(say);
    }
    EchoRequest(): p(NULL), say__RDYp(NULL), sayp(NULL) {
        //EXPORTREQUEST(EchoRequest::say);
    }
};
EchoRequest unusedER;

class EchoIndication: InterfaceClass {
    void *p;
    GUARDPTR heard__RDYp;
    void (*heardp)(void *p, int meth, int v);
 public:
    METHOD(heard, (int meth, int v), {return true; } ) { heardp(p, meth, v); }
    void init(const char *name, void *ap, unsigned long aheard__RDYp, unsigned long aheardp) {
        p = ap;
        ASSIGNIFCPTR(heard);
    }
    EchoIndication(): p(NULL), heard__RDYp(NULL), heardp(NULL) {
        //EXPORTREQUEST(EchoIndication::heard);
    }
};
EchoIndication unusedEI;

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
EchoRequestPipe unusedERP;
class EchoRequestOutput : public Module { // method -> pipe
public:
    EchoRequest request;
    EchoRequestPipe *pipe;
    METHOD(say, (int meth, int v), { return true; }) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
    void init() {
        request.init("request", this, IFC(EchoRequestOutput, say));
        EXPORTREQUEST(EchoRequestOutput::say);
        EXPORTREQUEST(EchoRequest::say);
    }
};

class EchoRequestInput : public Module { // pipe -> method
public:
    EchoRequestPipe pipe;
    EchoRequest *request;
    METHOD(enq, (const EchoRequest_data &v), {return true; }) {
        printf("entered EchoRequestInput::enq tag %d\n", v.tag);
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
    void init() {
        pipe.init("pipe", this, IFC(EchoRequestInput, enq));
        EXPORTREQUEST(EchoRequestInput::enq);
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
EchoIndicationPipe unusedEIP;
class EchoIndicationOutput : public Module { // method -> pipe
public:
    EchoIndication indication;
    EchoIndicationPipe *pipe;
    EchoIndication_data ind0;
    EchoIndication_data ind1;
    int ind_busy;
    int even;
    METHOD(heard, (int meth, int v), { return !ind_busy; }) {
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
    void init() {
        indication.init("indication", this, IFC(EchoIndicationOutput, heard));
        EXPORTREQUEST(EchoIndicationOutput::heard);
        EXPORTREQUEST(EchoIndication::heard);
        RULE(Echo,"output_rulee", ((this->ind_busy != 0) & (this->even != 0)) != 0, {
printf("[output_rulee:%d]EchoIndicationOutput tag %d\n", __LINE__, this->ind0.tag);
             this->ind_busy = 0;
             this->pipe->enq(this->ind0);
           });
        RULE(Echo,"output_ruleo", ((this->ind_busy != 0) & (this->even == 0)) != 0, {
printf("[output_ruleo:%d]EchoIndicationOutput tag %d\n", __LINE__, this->ind1.tag);
             this->ind_busy = 0;
             this->pipe->enq(this->ind1);
           });
    }
};

class EchoIndicationInput : public Module { // pipe -> method
public:
    EchoIndicationPipe pipe;
    EchoIndication *indication;
    int busy_delay;
    int meth_delay;
    int v_delay;
    METHOD(enq, (const EchoIndication_data &v), {return !busy_delay; }) {
printf("[%s:%d]EchoIndicationInput tag %d\n", __FUNCTION__, __LINE__, v.tag);
        switch (v.tag) {
        case EchoIndication_tag_heard:
            meth_delay = v.data.heard.meth;
            v_delay = v.data.heard.v;
            busy_delay = 1;
            break;
        }
    }
    void init() {
        pipe.init("pipe", this, IFC(EchoIndicationInput, enq));
        EXPORTREQUEST(EchoIndicationInput::enq);
        RULE(Echo,"input_rule", this->busy_delay != 0, {
printf("[input_rule:%d]EchoIndicationInput\n", __LINE__);
             this->busy_delay = 0;
             indication->heard(this->meth_delay, this->v_delay);
           });
    }
};

class Echo : public Module {
public:
    EchoRequest request;
    int busy;
    int meth_temp;
    int v_temp;
    int busy_delay;
    int meth_delay;
    int v_delay;
    EchoIndication *indication;
    METHOD(say, (int meth, int v), { return !busy; }) {
printf("[%s:%d]Echo\n", __FUNCTION__, __LINE__);
        meth_temp = meth;
        v_temp = v;
        busy = 1;
    }
    void init() {
        request.init("request", this, IFC(Echo, say));
        EXPORTREQUEST(Echo::say);
        RULE(Echo,"delay_rule", (this->busy != 0 & this->busy_delay == 0) != 0, {
printf("[delay_rule:%d]Echo\n", __LINE__);
             this->busy = 0;
             this->busy_delay = 1;
             this->meth_delay = this->meth_temp;
             this->v_delay = this->v_temp;
           });
        RULE(Echo,"respond_rule", this->busy_delay != 0, {
printf("[respond_rule:%d]Echo\n", __LINE__);
             this->busy_delay = 0;
             indication->heard(this->meth_delay, this->v_delay);
           });
    }
};

class foo: public EchoIndication {
    void heard(unsigned int heard_meth, unsigned int heard_v) {
        printf("Heard an echo: %d %d\n", heard_meth, heard_v);
            stop_main_program = 1;
    };
    bool heard__RDY(void) { return true;}
};
class foo zConnectresp;

class Connect : public Module {
public:
    EchoIndicationOutput lEIO;
    EchoRequestInput lERI;
    Echo lEcho;

    EchoRequestOutput lERO_test;
    EchoIndicationInput lEII_test;
    Connect() {
        lERI.request = &lEcho.request;
        lEIO.pipe = &lEII_test.pipe;
        lEcho.indication = &lEIO.indication;
        lERO_test.pipe = &lERI.pipe;

        lERI.init();
        lEIO.init();
        lEcho.init();
        lERO_test.init();

        lEII_test.indication = &zConnectresp; // user indication
        lEII_test.init();
    };
};

Connect connectTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    //connectTest.lEII_test.init(&zConnectresp);
    while (!connectTest.lERO_test.say__RDY())
        ;
    connectTest.lERO_test.say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

