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
class AB {
public:
    int meth(int A, int B) { return 0; }
//};
typedef int (AB::*FOO) (int A, int B);
typedef int (*FOOF) (int A, int B);
//class CD {
    FOO vitem;
    FOOF vv;
    void BBBB(void) {
        vv = reinterpret_cast<FOOF>(reinterpret_cast<__int128>(&AB::meth));
        //vitem = &AB::meth;
        }
};
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
__interface EchoRequest {
    void say(int meth, int v);
};
EchoRequest unusedER;

__interface EchoIndication {
    void heard(int meth, int v);
};
EchoIndication unusedEI;

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
EchoRequestPipe unusedERP;
__module EchoRequestOutput { // method -> pipe
public:
    EchoRequest request;
    EchoRequestPipe *pipe;
    void say(int meth, int v) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
    void init() {
        //request.say = ^ (int meth, int v) { say(meth, v); }; //__vectorcall
        //(&request)->say = &EchoRequestOutput::say;
    }
};

__module EchoRequestInput { // pipe -> method
public:
    EchoRequestPipe pipe;
    EchoRequest *request;
    void enq(const EchoRequest_data &v) {
        printf("entered EchoRequestInput::enq\n");
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
EchoIndicationPipe unusedEIP;
__module EchoIndicationOutput { // method -> pipe
public:
    EchoIndication indication;
    EchoIndicationPipe *pipe;
    void heard(int meth, int v) {
        EchoIndication_data ind;
        ind.tag = EchoIndication_tag_heard;
        ind.data.heard.meth = meth;
        ind.data.heard.v = v;
        pipe->enq(ind);
    }
};

__module EchoIndicationInput { // pipe -> method
public:
    EchoIndicationPipe pipe;
    EchoIndication *indication;
    void enq(const EchoIndication_data &v) {
        switch (v.tag) {
        case EchoIndication_tag_heard:
            indication->heard(v.data.heard.meth, v.data.heard.v);
            break;
        }
    }
};

__module Echo {
public:
    EchoRequest request;
    EchoIndication *indication;
    void say(int meth, int v) {
        indication->heard(meth, v);
    }
};

__module foo { // method -> pipe
public:
    EchoIndication indication;
    void heard(int meth, int v) {
        printf("Heard an echo: %d %d\n", meth, v);
            //stop_main_program = 1;
    }
};
class foo zConnectresp;

__module Connect {
public:
    EchoIndicationOutput lEIO;
    EchoRequestInput lERI;
    Echo lEcho;

    EchoRequestOutput lERO_test;
    EchoIndicationInput lEII_test;
    Connect() {
        //lERI.init(&lEcho.request);
        //lEIO.init(&lEII_test.pipe);
        //lEcho.init(&lEIO.indication);

        //lERO_test.init(&lERI.pipe);
        //lEII_test.init(&zConnectresp);
        connectInterface(this, (void **)&lERI.request, &lEcho.request);
        connectInterface(this, (void **)&lEIO.pipe, &lEII_test.pipe);
        connectInterface(this, (void **)&lEcho.indication, &lEIO.indication);
        connectInterface(this, (void **)&lERO_test.pipe, &lERI.pipe);

        //lERI.init();
        //lEIO.init();
        //lEcho.init();
        lERO_test.init();

        lEII_test.indication = &zConnectresp.indication; // user indication
        //lEII_test.init();

    };
};

Connect connectTest;
AB sss;
void jca()
{
sss.BBBB();
}
