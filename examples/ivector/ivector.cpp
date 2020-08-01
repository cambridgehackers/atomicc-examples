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
#include "atomicc.h"
#include "fifo.h"
#include "mux.h"

typedef struct {
    int a;
    int b;
    int c; // needs std::copy in c++ [20];
} ValuePair;

#define UTYPE ValuePair
//#define UTYPE int

template<class T>
class FifoPong __implements Fifo<T> {
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
class IVectorIndication {
    void heard(int meth, int v);
};
class IVectorInd __implements IVectorIndication;

class IVectorRequest {
    void say(int meth, int v);
};

class IVectorIFC {
    IVectorRequest in;
    IVectorIndication *out;
};

class IVector __implements IVectorIFC {
    Fifo<UTYPE> *fifo;
    int vsize;
    void in.say(int meth, int v) {
        UTYPE temp;
        temp.b = v;
        fifo[meth].in.enq(temp);
    }
    IVector(IVectorInd *aind, int size) : vsize(size) {
        out = aind;
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
