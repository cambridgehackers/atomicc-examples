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

#define UTYPE ValuePair
//#define UTYPE int

template<class T>
class FifoPong : public Fifo<T>, public Module
{
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
public:
    PipeIn<T> in;
    PipeOut<T> out;
    METHOD(enq, (T v), { return true; }) {
        if (pong)
            element2.in.enq(v);
        else
            element1.in.enq(v);
    }
    METHOD(deq, (void), { return true; }) {
        if (pong)
            element2.out.deq();
        else
            element1.out.deq();
        pong = !pong;
    }
    GVALUE(first, T, { return true; }) { return pong ? element2.out.first() : element1.out.first(); }
    FifoPong(): Fifo<T>(), pong(false), FIFOBASECONSTRUCTOR(FifoPong<T>) {
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
};

static FifoPong<UTYPE> bozouseless;
class IVectorIndication {
public:
    INDICATION(heard, (int meth, int v), { return true; });
    IVectorIndication() {
        EXPORTREQUEST(IVectorIndication::heard);
    }
};

class IVectorRequest {
public:
    METHOD(say, (int meth, int v), {return true; }){}
    IVectorRequest() {
        EXPORTREQUEST(IVectorRequest::say);
    }
};

class IVector : public Module, IVectorRequest {
    Fifo<UTYPE> *fifo;
    IVectorIndication *ind;
    int vsize;
public:
    METHOD(say, (int meth, int v), {return true; }) {
        UTYPE temp;
        temp.a = meth;
        temp.b = v;
        fifo[1].in.enq(temp);
    }
    IVector(IVectorIndication *ind, int size) : ind(ind), vsize(size) {
        //for (int i = 0; i < vsize; i++)
            //fifo[i] = new FifoPong<UTYPE>();
        fifo = new FifoPong<UTYPE>[vsize];
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx vsize %d\n", this, sizeof(*this), fifo, sizeof(IVector), vsize);
        EXPORTREQUEST(IVector::say);
        for (int i = vsize -1; i >= 0; i--) {
            RULE(IVector,("respond" + utostr(i)).c_str(), {
                UTYPE temp = this->fifo[i].out.first();
	        this->fifo[i].out.deq();
	        this->ind->heard(temp.a, temp.b);
                });
        }
    };
    ~IVector() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void IVectorIndication::heard(int meth, int v)
{
    printf("Heard an ivector: %d %d\n", meth, v);
    stop_main_program = 1;
}

class IVectorTest {
public:
    IVector *ivector;
public:
    IVectorTest(): ivector(new IVector(new IVectorIndication(), 10)) {
        printf("IVectorTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(IVectorTest));
    }
    ~IVectorTest() {}
};

IVectorTest ivectorTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!ivectorTest.ivector->say__RDY())
        ;
    ivectorTest.ivector->say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

