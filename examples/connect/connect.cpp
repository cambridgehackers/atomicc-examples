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
#include "atomicc.h"
#include "fifo.h"
#include "mux.h"

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
class EchoRequest {
    void say(int meth, int v);
};

class EchoIndication {
    void heard(int meth, int v);
};

typedef PipeIn<EchoRequest_data> EchoRequestPipe;
class EROIfc {
    EchoRequest request;
    EchoRequestPipe *pipe;
};

class EchoRequestOutput __implements EROIfc { // method -> pipe
    void request.say(int meth, int v) {
        printf("entered EchoRequestOutput::say\n");
        EchoRequest_data ind;
        ind.tag = EchoRequest_tag_say;
        ind.data.say.meth = meth;
        ind.data.say.v = v;
        pipe->enq(ind);
    }
};

class ERIIfc {
    EchoRequestPipe pipe;
    EchoRequest *request;
};

class EchoRequestInput __implements ERIIfc { // pipe -> method
    void pipe.enq(EchoRequest_data v) {
        printf("entered EchoRequestInput::enq\n");
        switch (v.tag) {
        case EchoRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
};

typedef PipeIn<EchoIndication_data> EchoIndicationPipe;
class EIOIfc {
    EchoIndication indication;
    EchoIndicationPipe *pipe;
};

class EchoIndicationOutput __implements EIOIfc { // method -> pipe
    void indication.heard(int meth, int v) {
        EchoIndication_data ind;
        ind.tag = EchoIndication_tag_heard;
        ind.data.heard.meth = meth;
        ind.data.heard.v = v;
        pipe->enq(ind);
    }
};

class EIIIfc {
    EchoIndicationPipe pipe;
    EchoIndication *indication;
};

class EchoIndicationInput __implements EIIIfc { // pipe -> method
    void pipe.enq(EchoIndication_data v) {
        switch (v.tag) {
        case EchoIndication_tag_heard:
            indication->heard(v.data.heard.meth, v.data.heard.v);
            break;
        }
    }
};

class EchoIfc {
    EchoRequest request;
    EchoIndication *indication;
};

class Echo __implements EchoIfc {
    void request.say(int meth, int v) {
        indication->heard(meth, v);
    }
};

class ConnectIfc {
    EchoRequest request;
    EchoIndication *indication;
};

class Connect __implements ConnectIfc {
    EchoIndicationOutput lEIO;
    EchoRequestInput lERI;
    Echo lEcho;
    EchoRequestOutput lERO_test;
    EchoIndicationInput lEII_test;

    __connect lERI.request = lEcho.request;
    __connect lEIO.pipe = lEII_test.pipe;
    __connect lEcho.indication = lEIO.indication;
    __connect lERO_test.pipe = lERI.pipe;
    __connect request = lERO_test.request; // user request
    __connect *indication = lEII_test.indication; // user indication
};

Connect connectTest;
