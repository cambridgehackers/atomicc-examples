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
/* Test program for example from:
 *     http://csg.csail.mit.edu/pubs/memos/Memo-500/memo500.pdf
 *     (Originally from: http://csg.csail.mit.edu/pubs/memos/Memo-473/memo473.pdf )
 */
//#include <fifo.cpp>
#include <fifo.h>

#define MAX_COUNT 2
template<class T>
__module Fifo2 : public Fifo<T> {
    T *element;
    int rindex;
    int windex;
    void enqactual2(const T v) if ( notFull()) {
        element[windex] = v;
        windex = (windex + 1) % MAX_COUNT;
    }
    void deqactual2(void) if (notEmpty()) {
        rindex = (rindex + 1) % MAX_COUNT;
    }
    T firstactual2(void) if (notEmpty()) { return element[rindex]; }
    bool notEmpty() const { return rindex != windex; }
    bool notFull() const { return ((windex + 1) % MAX_COUNT) != rindex; }
public:
    Fifo2(): rindex(0), windex(0) {
        this->in.enq = enqactual2;
        this->out.deq = deqactual2;
        this->out.first = firstactual2;
        element = new T[MAX_COUNT];
        printf("Fifo2: addr %p size 0x%lx\n", this, sizeof(*this));
    }
};

typedef struct {
    int a;
    int b;
    int c; // for c++ , need to generate std::copy [20];
} ValuePair;

__interface LpmIndication {
    void VMETHODDECL(void); // READY/VALID signalling marker
    void heard(int meth, int v);
};

__interface LpmRequest {
    void VMETHODDECL(void); // READY/VALID signalling marker
    void say(int meth, int v);
};

__interface LpmMem {
    void req(ValuePair v);
    void resAccept(void);
    ValuePair resValue(void);
};

__module LpmMemory {
    int delayCount;
    ValuePair saved;
    void reqactual(ValuePair v) if (delayCount == 0) { delayCount = 4; saved = v; }
    void resAcceptactual(void) if (delayCount == 1) { delayCount = 0;}
    ValuePair resValueactual(void) if (delayCount == 1) { return saved; }
public:
    LpmMem ifc;
    LpmMemory() {
        ifc.req = reqactual;
        ifc.resAccept = resAcceptactual;
        ifc.resValue = resValueactual;
        __rule memdelay_rule if (delayCount > 1) { delayCount = delayCount - 1; };
    }
};

__module Lpm {
    Fifo1<ValuePair> inQ;
    Fifo2<ValuePair> fifo;
    Fifo1<ValuePair> outQ;
    LpmMemory        mem;
    int doneCount;
    void sayactual(int meth, int v) if (true) {
printf("[%s:%d] (%d, %d)\n", __FUNCTION__, __LINE__, meth, v);
        ValuePair temp;
        temp.a = meth;
        temp.b = v;
        inQ.in.enq(temp);
    }
    bool done() {
        doneCount++;
        return !(doneCount % 5);
    }
public:
    LpmIndication *ind;
    LpmRequest request;
    Lpm() {
        request.say = sayactual;
        printf("Lpm: this %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(Lpm));
            __rule recirc if(true) {
                ValuePair temp = fifo.out.first();
                ValuePair mtemp = mem.ifc.resValue();
                mem.ifc.resAccept();
	        fifo.out.deq();
printf("recirc: (%d, %d)\n", temp.a, temp.b);
	        fifo.in.enq(temp);
	        mem.ifc.req(temp);
                };
            __rule exit_rule if(true) {
                ValuePair temp = fifo.out.first();
                ValuePair mtemp = mem.ifc.resValue();
                mem.ifc.resAccept();
	        fifo.out.deq();
printf("exit: (%d, %d)\n", temp.a, temp.b);
	        outQ.in.enq(temp);
                };
            __rule enter if(true) {
                ValuePair temp = inQ.out.first();
printf("enter: (%d, %d)\n", temp.a, temp.b);
	        inQ.out.deq();
	        fifo.in.enq(temp);
	        mem.ifc.req(temp);
                };
            __rule respond if(true) {
                ValuePair temp = outQ.out.first();
	        outQ.out.deq();
printf("respond: (%d, %d)\n", temp.a, temp.b);
	        ind->heard(temp.a, temp.b);
                };
            atomiccSchedulePriority("recirc", "enter;exit", 0);
    };
    ~Lpm() {}
};

__module foo { // method -> pipe
    void heardactual(int meth, int v) if (true) {
        printf("Heard an lpm: %d %d\n", meth, v);
            //stop_main_program = 1;
    }
public:
    LpmIndication indication;
    foo() {
        indication.heard = heardactual;
    }
};
class foo zConnectresp;


class LpmTest {
public:
    Lpm *lpm;
public:
    LpmTest(): lpm(new Lpm()) {
        lpm->ind = &zConnectresp.indication; // user indication
        printf("LpmTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(LpmTest));
    }
    ~LpmTest() {}
};

LpmTest lpmTest;
#if 0
int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!lpmTest.lpm->request.say__RDY())
        ;
    lpmTest.lpm->request.say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}
#endif
