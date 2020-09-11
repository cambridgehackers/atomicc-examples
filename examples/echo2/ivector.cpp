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
#include "fifo.h"
#include "mux.h"

typedef struct {
    int a;
    int b;
    int c[20];
} ValuePair;

class IVectorRequest {
    void say(ValuePair v);
};

class IVectorIndication {
    void heard(ValuePair v);
};

class IVectorIFC {
    IVectorRequest     request;
    IVectorIndication *indication;
};

template<class T>
class FifoPong __implements Fifo<T> {
    Fifo1<T> element1;
    Fifo1<T> element2;
    bool pong;
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
    FifoPong(): pong(false) {
        printf("FifoPong: addr %p size 0x%lx\n", this, sizeof(*this));
    };
};

class IVector __implements IVectorIFC {
    Fifo<ValuePair> *fifo;
    void request.say(ValuePair v) {
        fifo->in.enq(v);
    }
    IVector() : fifo(new FifoPong<ValuePair>()) {
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(IVector));
        __rule respond { 
	    //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	    fifo->out.deq();
	    indication->heard(fifo->out.first());
            };
    };
};

class IVectorTest {
public:
    IVector *ivector;
    IVectorTest(): ivector(new IVector()) {
        printf("IVectorTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(IVectorTest));
    }
};

IVectorTest ivectorTest;
