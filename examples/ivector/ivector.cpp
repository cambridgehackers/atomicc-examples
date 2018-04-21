/* Copyright (c) 2014 The Connectal Project
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
//#include <fifo.cpp>
#include <fifo.h>

typedef struct {
    int a;
    int b;
    int c; // needs std::copy in c++ [20];
} ValuePair;

#define UTYPE ValuePair
//#define UTYPE int

template<class T>
__module FifoPong : public Fifo<T> {
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
    void in.enq(const T v) {
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
    FifoPong(): pong(false) {
        //printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
};

static FifoPong<UTYPE> bozouseless;
__interface IVectorIndication {
    void heard(int meth, int v);
};
__emodule IVectorInd{
    IVectorIndication ind;
    void ind.heard(int meth, int v) {}
};

__interface IVectorRequest {
    void say(int meth, int v);
};

__module IVector {
    Fifo<UTYPE> *fifo;
    IVectorIndication *out;
    int vsize;
    IVectorRequest in;
    void in.say(int meth, int v) {
        UTYPE temp;
        temp.b = v;
#if 0 // this is what it should expand to
        if (meth == 0)
        fifo[0].in.enq(temp);
        else if (meth == 1)
        fifo[1].in.enq(temp);
        else if (meth == 2)
        fifo[2].in.enq(temp);
        else if (meth == 3)
        fifo[3].in.enq(temp);
        else if (meth == 4)
        fifo[4].in.enq(temp);
        else if (meth == 5)
        fifo[5].in.enq(temp);
        else if (meth == 6)
        fifo[6].in.enq(temp);
        else if (meth == 7)
        fifo[7].in.enq(temp);
        else if (meth == 8)
        fifo[8].in.enq(temp);
        else if (meth == 9)
        fifo[9].in.enq(temp);
#elif 1
        fifo[meth].in.enq(temp);
#elif 1
        ((meth == 0) ? fifo[0] :
         (meth == 1) ? fifo[1] :
         (meth == 2) ? fifo[2] :
         (meth == 3) ? fifo[3] :
         (meth == 4) ? fifo[4] :
         (meth == 5) ? fifo[5] :
         (meth == 6) ? fifo[6] :
         (meth == 7) ? fifo[7] :
         (meth == 8) ? fifo[8] :
                       fifo[9] ).in.enq(temp);
#else
         Fifo<UTYPE> *tfifo;
         switch(meth) {
         case 0: tfifo = &fifo[0]; break;
         case 1: tfifo = &fifo[1]; break;
         case 2: tfifo = &fifo[2]; break;
         case 3: tfifo = &fifo[3]; break;
         case 4: tfifo = &fifo[4]; break;
         case 5: tfifo = &fifo[5]; break;
         case 6: tfifo = &fifo[6]; break;
         case 7: tfifo = &fifo[7]; break;
         case 8: tfifo = &fifo[8]; break;
         default: tfifo = &fifo[9];
         }
         tfifo->in.enq(temp);
#endif
    }
    IVector(IVectorInd *aind, int size) : out(&aind->ind), vsize(size) {
        //for (int i = 0; i < vsize; i++)
            //fifo[i] = new FifoPong<UTYPE>();
        fifo = (Fifo<ValuePair> *)new FifoPong<UTYPE>[vsize];
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx vsize %d\n", this, sizeof(*this), fifo, sizeof(IVector), vsize);
        for (int i = 0; i < vsize; i++) {
            __rule respond_rule {
                UTYPE temp = fifo[i].out.first();
	        fifo[i].out.deq();
	        out->heard(i, temp.b);
                };
        }
    };
    ~IVector() {}
};

class IVectorTest {
public:
    IVector *ivector;
    IVectorTest(): ivector(new IVector(new IVectorInd(), 10)) {
        printf("IVectorTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(IVectorTest));
    }
    ~IVectorTest() {}
};

IVectorTest ivectorTest;
