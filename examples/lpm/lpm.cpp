/* Copyright (c) 2014 Quanta Research Cambridge, Inc
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

typedef struct {
    int a;
    int b;
    int c[20];
} ValuePair;

class LpmIndication: InterfaceClass {
    void *p;
    GUARDPTR heard__RDYp;
    void (*heardp)(void *p, int meth, int v);
 public:
    METHOD(heard, (int meth, int v), {return true; } ) { heardp(p, meth, v); }
    void init(const char *name, void *ap, unsigned long aheard__RDYp, unsigned long aheardp) {
        p = ap;
        ASSIGNIFCPTR(heard);
    }
    LpmIndication(): p(NULL), heard__RDYp(NULL), heardp(NULL) { }
};

class LpmRequest {
public:
    METHOD(say, (int meth, int v), {return true; }){}
    LpmRequest() {
        EXPORTREQUEST(LpmRequest::say);
    }
};

class LpmMemory : public Module {
    int delayCount;
    ValuePair saved;
public:
    METHOD(req, (ValuePair v), {return delayCount == 0; }){ delayCount = 4; saved = v; }
    METHOD(resAccept, (void), {return delayCount == 1; }){ delayCount = 0;}
    GVALUE(resValue, ValuePair, {return delayCount == 1; }) { return saved; }
    LpmMemory() {
        RULE(Lpm, "memdelay", delayCount > 1, { delayCount--; });
    }
};

class Lpm : public Module, LpmRequest {
    Fifo1<ValuePair> inQ;
    Fifo1<ValuePair> fifo;
    Fifo1<ValuePair> outQ;
    LpmMemory        mem;
    int doneCount;
public:
    LpmIndication *indication;
    METHOD(say, (int meth, int v), {return true; }) {
printf("[%s:%d] (%d, %d)\n", __FUNCTION__, __LINE__, meth, v);
        ValuePair temp;
        temp.a = meth;
        temp.b = v;
        inQ.in.enq(temp);
    }
    bool done() {
        doneCount++;
printf("[%s:%d] done [%d] = %d\n", __FUNCTION__, __LINE__, doneCount,  !(doneCount % 5));
return 1;
        return !(doneCount % 5);
    }
    Lpm() {
        printf("Lpm: this %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(Lpm));
        EXPORTREQUEST(Lpm::say);
            RULE(Lpm, "recirc", !done(), {
                ValuePair temp = this->fifo.out.first();
                ValuePair mtemp = this->mem.resValue();
                this->mem.resAccept();
	        this->fifo.out.deq();
printf("recirc: (%d, %d)\n", temp.a, temp.b);
	        this->fifo.in.enq(temp);
	        this->mem.req(temp);
                });
            RULE(Lpm, "exit", done(), {
                ValuePair temp = this->fifo.out.first();
                ValuePair mtemp = this->mem.resValue();
                this->mem.resAccept();
	        this->fifo.out.deq();
printf("exit: (%d, %d)\n", temp.a, temp.b);
	        this->outQ.in.enq(temp);
                });
            RULE(Lpm, "enter", true, {
                ValuePair temp = this->inQ.out.first();
printf("enter: (%d, %d)\n", temp.a, temp.b);
	        this->inQ.out.deq();
	        this->fifo.in.enq(temp);
	        this->mem.req(temp);
                });
            RULE(Lpm, "respond", true, {
                ValuePair temp = this->outQ.out.first();
	        this->outQ.out.deq();
printf("respond: (%d, %d)\n", temp.a, temp.b);
	        this->indication->heard(temp.a, temp.b);
                });
    };
    ~Lpm() {}
};

class foo : public Module { // method -> pipe
public:
    LpmIndication indication;
    METHOD(heard, (int meth, int v), { return true; }) {
        printf("Heard an lpm: %d %d\n", meth, v);
            stop_main_program = 1;
    }
    void init() {
        indication.init("indication", this, IFC(foo, heard));
    }
};
class foo zConnectresp;


class LpmTest {
public:
    Lpm *lpm;
public:
    LpmTest(): lpm(new Lpm()) {
        zConnectresp.init();
        lpm->indication = &zConnectresp.indication; // user indication
        printf("LpmTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(LpmTest));
    }
    ~LpmTest() {}
};

LpmTest lpmTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!lpmTest.lpm->say__RDY())
        ;
    lpmTest.lpm->say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

