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
#include <fifo.cpp>

typedef struct {
    int a;
    int b;
    int c; // needs std::copy in c++ [20];
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
    METHOD(enq, (const T &v), { return true; }) {
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
    FifoPong(): FIFOBASECONSTRUCTOR(FifoPong<T>), pong(false) {
        //printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
};

static FifoPong<UTYPE> bozouseless;
#if 0
__interface IVectorIndication {
    void heard(int meth, int v);
};
#else
class IVectorIndication : public ModuleExternal {
public:
    INDICATION(heard, (int meth, int v), { return true; });
    IVectorIndication() {}
};
#endif

__interface IVectorRequest {
    void say(int meth, int v);
};

class IVector : public Module {
    Fifo<UTYPE> *fifo;
    IVectorIndication *ind;
    int vsize;
public:
    IVectorRequest in;
    METHOD(say, (int meth, int v), {return true; }) {
        UTYPE temp;
        temp.b = v;
#if 1
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
    IVector(IVectorIndication *aind, int size) : ind(aind), vsize(size) {
        in.init("in", this, IFC(IVector, say));
        //for (int i = 0; i < vsize; i++)
            //fifo[i] = new FifoPong<UTYPE>();
        fifo = new FifoPong<UTYPE>[vsize];
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx vsize %d\n", this, sizeof(*this), fifo, sizeof(IVector), vsize);
        for (int i = 0; i < vsize; i++) {
            RULE(IVector,("respond" + utostr(i)).c_str(), true, {
                UTYPE temp = fifo[i].out.first();
	        fifo[i].out.deq();
	        ind->heard(i, temp.b);
                });
        }
    };
    ~IVector() {}
};

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
