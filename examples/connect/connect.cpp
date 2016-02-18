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
#include <fifo.cpp>
#include <math.h>
//#include "memserver.h"

class MemreadIndication: InterfaceClass {
    void *p;
    GUARDPTR heard__RDYp;
    void (*heardp)(void *p, int meth, int v);
 public:
    METHOD(heard, (int meth, int v), {return true; } ) { heardp(p, meth, v); }
    MemreadIndication(): p(NULL), heard__RDYp(NULL), heardp(NULL) { }
    void init(const char *name, void *ap, unsigned long aheard__RDYp, unsigned long aheardp) {
        p = ap;
        ASSIGNIFCPTR(heard);
    }
};

typedef struct {
    int tag;
#define MemreadIndication_tag_heard 1
    union MemreadIndication_union {
        struct MemreadIndication_heard {
            int meth;
            int v;
        } heard;
    } data;
} MemreadIndication_data;

typedef PipeIn<MemreadIndication_data> MemreadIndicationPipe;

class MemreadIndicationOutput {
public:
    MemreadIndicationPipe *pipe;
    MemreadIndication indication;
    METHOD(heard, (int meth, int v), { return true; }) {
        MemreadIndication_data ind;
        ind.tag = MemreadIndication_tag_heard;
        ind.data.heard.meth = meth;
        ind.data.heard.v = v;
        pipe->enq(ind);
    }
    MemreadIndicationOutput() {
        indication.init("indication", this, IFC(MemreadIndicationOutput, heard));
    }
};

class MemreadRequest: InterfaceClass {
    void *p;
    GUARDPTR say__RDYp;
    void (*sayp)(void *p, int meth, int v);
 public:
    METHOD(say, (int meth, int v), {return true; } ) { sayp(p, meth, v); }
    MemreadRequest(): p(NULL), say__RDYp(NULL), sayp(NULL) { }
    void init(const char *name, void *ap, unsigned long asay__RDYp, unsigned long asayp) {
        p = ap;
        ASSIGNIFCPTR(say);
    }
};

typedef struct {
    int tag;
#define MemreadRequest_tag_say 1
    struct MemreadRequest_union {
        struct MemreadRequest_say {
            int meth;
            int v;
        } say;
    } data;
} MemreadRequest_data;

class MemreadRequestInput {
public:
    MemreadRequest *request;
    PipeIn<MemreadRequest_data> pipe;
    METHOD(enq, (const MemreadRequest_data &v), {return true; }) {
        switch (v.tag) {
        case MemreadRequest_tag_say:
            request->say(v.data.say.meth, v.data.say.v);
            break;
        }
    }
    MemreadRequestInput(MemreadRequest *req) {
        request = req;
        pipe.init("pipe", this, IFC(MemreadRequestInput, enq));
    }
};

class Memread {
public:
    MemreadRequest request;
    MemreadIndication *indication;
    //MemReadClient *readers;
    //MemreadRequest request;
    METHOD(say, (int meth, int v), { return true; }) {
        indication->heard(meth, v);
    }
    Memread(MemreadIndication *ind) {
        indication = ind;
        request.init("request", this, IFC(Memread, say));
        //readers = new MemReadClient[NumReadClients];
    }
};

class CnocTop {
    MemreadIndicationOutput lMemreadIndicationOutput;
    MemreadRequestInput lMemreadRequestInput;
    Memread lMemread;
public:
    /*NumberOfRequests,NumberOfIndications,PhysAddrWidth,DataBusWidth,`PinType,NumberOfMasters*/
    //MemReadClient *readers;
    CnocTop() :
        lMemreadRequestInput(&lMemread.request),
        lMemread(&lMemreadIndicationOutput.indication)
        {
        //readers = lMemread.readers;
    //let lMemreadIndicationOutputNoc <- mkPortalMsgIndication(extend(pack(IfcNames_MemreadIndicationH2S)), lMemreadIndicationOutput.portalIfc.indications, lMemreadIndicationOutput.portalIfc.messageSize);
    //let lMemreadRequestInputNoc <- mkPortalMsgRequest(extend(pack(IfcNames_MemreadRequestS2H)), lMemreadRequestInput.portalIfc.requests);
    //Vector#(NumReadClients,MemReadClient#(DataBusWidth)) nullReaders = replicate(null_mem_read_client());
    //interface requests = cons(lMemreadRequestInputNoc,nil);
    //interface indications = cons(lMemreadIndicationOutputNoc,nil);
    //interface readers = take((nullReaders));
    }
};
//#include "xsimtop.h"

typedef FixedPoint<6> myint6;
typedef FixedPoint<4> myint4;

typedef struct {
    myint6 a;
    myint4 b;
} ValueType;

class ConnectIndication {
public:
    INDICATION(heard, (myint6 meth, myint4 v), { return true; });
    ConnectIndication() {
        EXPORTREQUEST(ConnectIndication::heard);
    }
};

class ConnectRequest {
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }){}
    ConnectRequest() {
        EXPORTREQUEST(ConnectRequest::say);
    }
};

ValueType grumpy;

class Connect : public Module, ConnectRequest {
    Fifo1<ValueType> fifo;
    FixedPoint<23>   fcounter;
    FixedPointV      counter;    // the precision of these members is set by the constructor
    FixedPointV      gcounter;
    ConnectIndication *ind;
    CnocTop          top;
    //XsimTop          lXsimTop;
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }) {
        ValueType temp;
        temp.a = meth;
        temp.b = v;
        fifo.in.enq(temp);
    }
    Connect(ConnectIndication *ind) : ind(ind), counter(lrint(log(4))), gcounter(grumpy.a.size + grumpy.b.size)
        //, lXsimTop(0, 0, 0)
    {
        EXPORTREQUEST(Connect::say);
        RULE(Connect, "respond", {
            ValueType temp = this->fifo.out.first();
            this->fifo.out.deq();
            this->ind->heard(temp.a, temp.b);
            fixedSet((void *)&this->gcounter, fixedGet((void *)&this->gcounter) + 1);
            });
    };
    ~Connect() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void ConnectIndication::heard(myint6 meth, myint4 v)
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

