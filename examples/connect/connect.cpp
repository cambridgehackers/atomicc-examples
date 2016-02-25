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
    void init(EchoRequestPipe *req) {
        pipe = req;
        request.init("request", this, IFC(EchoRequestOutput, say));
        EXPORTREQUEST(EchoRequestOutput::say);
    }
};

class EchoRequestInput : public Module { // pipe -> method
public:
    EchoRequestPipe pipe;
    EchoRequest *request;
    METHOD(enq, (const EchoRequest_data &v), {return true; }) {
        printf("entered EchoRequestInput::enq\n");
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
    void init(EchoRequest *req) {
        request = req;
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
    METHOD(heard, (int meth, int v), { return true; }) {
        EchoIndication_data ind;
        ind.tag = EchoIndication_tag_heard;
        ind.data.heard.meth = meth;
        ind.data.heard.v = v;
        pipe->enq(ind);
    }
    void init(EchoIndicationPipe *ind) {
        pipe = ind;
        indication.init("indication", this, IFC(EchoIndicationOutput, heard));
        EXPORTREQUEST(EchoIndicationOutput::heard);
    }
};

class EchoIndicationInput : public Module { // pipe -> method
public:
    EchoIndicationPipe pipe;
    EchoIndication *request;
    METHOD(enq, (const EchoIndication_data &v), {return true; }) {
        switch (v.tag) {
        case EchoIndication_tag_heard:
            request->heard(v.data.heard.meth, v.data.heard.v);
            break;
        }
    }
    void init(EchoIndication *req) {
        request = req;
        pipe.init("pipe", this, IFC(EchoIndicationInput, enq));
        EXPORTREQUEST(EchoIndicationInput::enq);
    }
};

class Echo : public Module {
public:
    EchoRequest request;
    EchoIndication *indication;
    METHOD(say, (int meth, int v), { return true; }) {
        indication->heard(meth, v);
    }
    void init(EchoIndication *ind) {
        indication = ind;
        request.init("request", this, IFC(Echo, say));
        EXPORTREQUEST(Echo::say);
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
    EchoIndicationOutput lEchoIndicationOutput;
    EchoRequestInput lEchoRequestInput;
    Echo lEcho;

    EchoRequestOutput lEchoRequestOutput_test;
    EchoIndicationInput lEchoIndicationInput_test;
    Connect() {
        lEchoRequestInput.init(&lEcho.request);
        lEchoIndicationOutput.init(&lEchoIndicationInput_test.pipe);
        lEcho.init(&lEchoIndicationOutput.indication);

        lEchoRequestOutput_test.init(&lEchoRequestInput.pipe);
        lEchoIndicationInput_test.init(&zConnectresp);
    };
};

Connect connectTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!connectTest.lEchoRequestOutput_test.say__RDY())
        ;
    connectTest.lEchoRequestOutput_test.say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

