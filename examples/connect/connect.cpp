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
#if 1
#include <fifo.cpp>
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
class EchoRequest: InterfaceClass {
    void *p;
    GUARDPTR say__RDYp;
    void (*sayp)(void *p, int meth, int v);
 public:
    METHOD(say, (int meth, int v), {return true; } ) { sayp(p, meth, v); }
    EchoRequest(): p(NULL), say__RDYp(NULL), sayp(NULL) { }
    void init(const char *name, void *ap, unsigned long asay__RDYp, unsigned long asayp) {
        p = ap;
        ASSIGNIFCPTR(say);
    }
};

class EchoIndication: InterfaceClass {
    void *p;
    GUARDPTR heard__RDYp;
    void (*heardp)(void *p, int meth, int v);
 public:
    METHOD(heard, (int meth, int v), {return true; } ) { heardp(p, meth, v); }
    EchoIndication(): p(NULL), heard__RDYp(NULL), heardp(NULL) { }
    void init(const char *name, void *ap, unsigned long aheard__RDYp, unsigned long aheardp) {
        p = ap;
        ASSIGNIFCPTR(heard);
    }
};

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
class EchoRequestOutput : public Module { // method -> pipe
public:
    EchoRequest indication;
    EchoRequestPipe *pipe;
    METHOD(say, (int meth, int v), { return true; }) {
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
    EchoRequestOutput() {
        indication.init("indication", this, IFC(EchoRequestOutput, say));
    }
};

class EchoRequestInput : public Module { // pipe -> method
public:
    EchoRequestPipe pipe;
    EchoRequest *request;
    METHOD(enq, (const EchoRequest_data &v), {return true; }) {
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
    void init(EchoRequest *req) {
        request = req;
        pipe.init("pipe", this, IFC(EchoRequestInput, enq));
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
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
    EchoIndicationOutput() {
        indication.init("indication", this, IFC(EchoIndicationOutput, heard));
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
    }
};

class ConnectIndication {
public:
    INDICATION(heard, (int meth, int v), { return true; });
    ConnectIndication() {
        EXPORTREQUEST(ConnectIndication::heard);
    }
};

class ConnectRequest {
public:
    METHOD(say, (int meth, int v), {return true; }){}
    ConnectRequest() {
        EXPORTREQUEST(ConnectRequest::say);
    }
};

class Connect : public Module, ConnectRequest {
    Fifo1<ValueType> fifo;
    ConnectIndication *ind;
    EchoIndicationOutput lEchoIndicationOutput;
    EchoRequestInput lEchoRequestInput;
    Echo lEcho;
public:
    METHOD(say, (int meth, int v), {return true; }) {
        ValueType temp;
        temp.a = meth;
        temp.b = v;
        fifo.in.enq(temp);
    }
    Connect(ConnectIndication *ind) : ind(ind) {
        EXPORTREQUEST(Connect::say);
        lEchoRequestInput.init(&lEcho.request);
        lEcho.init(&lEchoIndicationOutput.indication);
        RULE(Connect, "respond", {
            ValueType temp = this->fifo.out.first();
            this->fifo.out.deq();
            this->ind->heard(temp.a, temp.b);
            });
    };
    ~Connect() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void ConnectIndication::heard(int meth, int v)
{
    //printf("Heard an connect: %d %d\n", meth, v);
    printf("Heard an connect: %d %d\n", 0, 0);
    stop_main_program = 1;
}

class ConnectTest {
public:
    Connect *connect;
public:
    ConnectTest(): connect(new Connect(new ConnectIndication())) {
        printf("ConnectTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(ConnectTest));
    }
    ~ConnectTest() {}
};

ConnectTest connectTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!connectTest.connect->say__RDY())
        ;
    connectTest.connect->say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

#endif
