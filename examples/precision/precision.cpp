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
#include <fifo.cpp>
#include <math.h>
//#include <fixed.h>
typedef uint8_t Bit;
template<int32_t precision_bits>
    class FixedPoint: public BitsClass {
        long data;
    public:
        static const int size = precision_bits;
        FixedPoint() {}
        ~FixedPoint() {}
        FixedPoint(long val): data(val) {}
        virtual void fixedPrecMeth(void) {}
        inline FixedPoint & operator=(const FixedPoint & arg) {
            this->data = arg.data;
            return *this;
        }
    };
#if 1
typedef FixedPoint<6> myint6;
typedef FixedPoint<4> myint4;
#else
typedef int myint6;
typedef int myint4;
#endif
class FixedPointV: public BitsClass {
    Bit *data;
public:
    int size;
    FixedPointV(int precision_bits): size(precision_bits) { data = new Bit[size]; }
    FixedPointV(int precision_bits, long val): size(precision_bits) { data = new Bit[size]; }
};

typedef struct {
    myint6 a;
    myint4 b;
} ValueType;

class IVectorIndication {
public:
    INDICATION(heard, (myint6 meth, myint4 v), { return true; });
    IVectorIndication() {
        EXPORTREQUEST(IVectorIndication::heard);
    }
};

class IVectorRequest {
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }){}
    IVectorRequest() {
        EXPORTREQUEST(IVectorRequest::say);
    }
};

ValueType grumpy;
//typedef FixedPoint<lrint(log(4))> logType;
//err_template_arg_not_address_constant
typedef FixedPoint<((4))> logType;
logType foo;

class IVector : public Module, IVectorRequest {
    Fifo1<ValueType> fifo;
    //FixedPointV      counter;
    //FixedPointV      gcounter;
    IVectorIndication *ind;
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }) {
        ValueType temp;
        temp.a = meth;
        temp.b = v;
        fifo.in.enq(temp);
    }
    IVector(IVectorIndication *ind) : ind(ind) //, counter(lrint(log(4))), gcounter(grumpy.a.size + grumpy.b.size)
    {
        EXPORTREQUEST(IVector::say);
        RULE(IVector, "respond", {
            ValueType temp = this->fifo.out.first();
            this->fifo.out.deq();
            this->ind->heard(temp.a, temp.b);
            });
    };
    ~IVector() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void IVectorIndication::heard(myint6 meth, myint4 v)
{
    //printf("Heard an ivector: %d %d\n", meth, v);
    printf("Heard an ivector: %d %d\n", 0, 0);
    stop_main_program = 1;
}

class IVectorTest {
public:
    IVector *ivector;
public:
    IVectorTest(): ivector(new IVector(new IVectorIndication())) {
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

