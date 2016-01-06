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
#include <atomicc.h>
#include <fifo.h>

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

static FifoPong<int> bozouseless;
class IVectorIndication {
public:
    INDICATION(heard, (int v), { return true; });
    IVectorIndication() {
        EXPORTREQUEST(IVectorIndication::heard);
    }
};

class IVectorRequest {
public:
    METHOD(say, (int v), {return true; }){}
    IVectorRequest() {
        EXPORTREQUEST(IVectorRequest::say);
    }
};

class IVector : public Module, IVectorRequest {
    Fifo<int> *fifo;
    IVectorIndication *ind;
    int pipetemp;
public:
    METHOD(say, (int v), {return true; }) {
        fifo->in.enq(v);
    }
    IVector(IVectorIndication *ind) : fifo(new FifoPong<int>()), ind(ind) {
        printf("IVector: this %p size 0x%lx fifo %p csize 0x%lx\n", this, sizeof(*this), fifo, sizeof(IVector));
        EXPORTREQUEST(IVector::say);
        RULE(IVector,respond, { 
	    //module->response = PIPELINE(module->fifo->first(), module->pipetemp);
	    this->fifo->out.deq();
	    this->ind->heard(this->fifo->out.first());
            });
    };
    ~IVector() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void IVectorIndication::heard(int v)
{
    printf("Heard an ivector: %d\n", v);
    stop_main_program = 1;
}

class IVectorTest {
public:
    IVector *ivector;
    int x;
public:
    IVectorTest(): ivector(new IVector(new IVectorIndication())), x(7) {
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
    ivectorTest.ivector->say(22);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

