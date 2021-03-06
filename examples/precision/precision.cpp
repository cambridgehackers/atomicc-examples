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
#include <math.h>
#include "atomicc.h"
#include "fifo.h"
#include "mux.h"

typedef __uint(6) myint6;
typedef __uint(4) myint4;
typedef __uint(14 / 7 + 3 * 2) myint23;

typedef struct {
    myint6 a;
    myint4 b;
} ValueType;

class IVectorIndication {
    void heard(myint6 meth, myint4 v);
};
class IVectorInd __implements IVectorIndication;

class IVectorRequest {
    void say(myint6 meth, myint4 v);
};

ValueType grumpy;

class IVectorIFC {
    IVectorRequest request;
    IVectorIndication *ind;
};

class IVector __implements IVectorIFC {
    Fifo1<ValueType> fifo;
    myint23          fcounter;
    static int       intcWidth;
    typedef __uint(intcWidth) Myintc;
    Myintc      counter;    // the precision of these members is set by the constructor
    Myintc      gcounter;
    void request.say(myint6 meth, myint4 v) if(true) {
        ValueType temp;
        temp.a = meth;
        temp.b = v;
        fifo.in.enq(temp);
    }
    IVector(IVectorInd *aind) {
        ind = aind;
        __rule respond {
            ValueType temp = fifo.out.first();
            fifo.out.deq();
            ind->heard(temp.a, temp.b);
            //fixedSet((void *)&gcounter, fixedGet((void *)&gcounter) + 1);
            };
    };
    ~IVector() {}
};
int IVector::intcWidth = 3;

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

//void IVectorInd::ind.heard(myint6 meth, myint4 v)
//{
    ////printf("Heard an ivector: %d %d\n", meth, v);
    //printf("Heard an ivector: %d %d\n", 0, 0);
//}

class IVectorTest {
public:
    IVector *ivector;
    IVectorTest(): ivector(new IVector(new IVectorInd())) {
        printf("IVectorTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(IVectorTest));
    }
    ~IVectorTest() {}
};

IVectorTest ivectorTest;
