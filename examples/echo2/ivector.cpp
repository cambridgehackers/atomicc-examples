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

#define USE_STRUCT
#ifdef USE_STRUCT
#define UTYPE ValuePair
#else
#define UTYPE int
#endif

template<class T>
__module FifoPong : public Fifo<T> {
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
public:
    //PipeIn<T> in;
    //PipeOut<T> out;
    void in.enq(T v) {
        if (pong)
            element2.in.enq(v);
        else
            element1.in.enq(v);
    }
    void out.deq(void) {
        if (pong)
            element2.out.deq();
        else
            element1.out.deq();
        pong = !pong;
    }
    T out.first(void) { return pong ? element2.out.first() : element1.out.first(); }
    FifoPong(): Fifo<T>(), pong(false)//, FIFOBASECONSTRUCTOR(FifoPong<T>) 
{
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
};

static FifoPong<UTYPE> bozouseless;
__interface IndIF {
    void heard(UTYPE v);
};
__module IVectorIndication {
    IndIF ind;
    void ind.heard(UTYPE v);
};

__interface IVectorRequest {
    void say(UTYPE v) {}
};

__module IVector {
    IVectorRequest request;
    Fifo<UTYPE> *fifo;
    IndIF *ind;
    void request.say(UTYPE v) {
        fifo->in.enq(v);
    }
    IVector(IVectorIndication *ind) : fifo(new FifoPong<UTYPE>()), ind(&ind->ind) {
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(IVector));
        __rule respond { 
	    //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	    this->fifo->out.deq();
	    this->ind->heard(this->fifo->out.first());
            };
    };
    //~IVector() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void IVectorIndication::ind.heard(UTYPE v)
{
    printf("Heard an ivector: %d %d\n", v
#ifdef USE_STRUCT
.a, v.b
#else
, 0
#endif
);
    //stop_main_program = 1;
}

class IVectorTest {
public:
    IVector *ivector;
    IVectorTest(): ivector(new IVector(new IVectorIndication())) {
        printf("IVectorTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(IVectorTest));
    }
    //~IVectorTest() {}
};

IVectorTest ivectorTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!ivectorTest.ivector->request.say__RDY())
        ;
    ivectorTest.ivector->request.say(UTYPE{22
#ifdef USE_STRUCT
, 44
#endif
});
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

