#include "ivector.generated.h"
void l_class_OC_Fifo1__deq(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1__deq__RDY(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1__enq(void *thisarg, unsigned int enq_v) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        thisp->element_shadow = enq_v;
        thisp->element_valid = 1;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1__enq__RDY(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return (thisp->full) ^ 1;
}
unsigned int l_class_OC_Fifo1__first(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return thisp->element;
}
bool l_class_OC_Fifo1__first__RDY(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1::run()
{
    commit();
}
void l_class_OC_Fifo1::commit()
{
    if (element_valid) element = element_shadow;
    element_valid = 0;
    if (full_valid) full = full_shadow;
    full_valid = 0;
}
void l_class_OC_Fifo1_OC_3__deq(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_3__deq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_3__enq(void *thisarg, l_struct_OC_ValuePair enq_v) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        thisp->element = enq_v;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_3__enq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return (thisp->full) ^ 1;
}
l_struct_OC_ValuePair l_class_OC_Fifo1_OC_3__first(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        l_struct_OC_ValuePair retval;
        retval = thisp->element;
        return retval;
}
bool l_class_OC_Fifo1_OC_3__first__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_3::run()
{
    commit();
}
void l_class_OC_Fifo1_OC_3::commit()
{
    if (full_valid) full = full_shadow;
    full_valid = 0;
}
void l_class_OC_FifoPong__deq(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        thisp->pong_shadow = (thisp->pong) ^ 1;
        thisp->pong_valid = 1;
        if (thisp->pong)
            thisp->element2.out.deq();
        if ((thisp->pong) ^ 1)
            thisp->element1.out.deq();
}
bool l_class_OC_FifoPong__deq__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        bool tmp__1;
        bool tmp__2;
        tmp__1 = thisp->element2.out.deq__RDY();
        tmp__2 = thisp->element1.out.deq__RDY();
        return (tmp__1 | ((thisp->pong) ^ 1)) & (tmp__2 | (thisp->pong));
}
void l_class_OC_FifoPong__enq(void *thisarg, l_struct_OC_ValuePair enq_v) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        if (thisp->pong)
            thisp->element2.in.enq(enq_v);
        if ((thisp->pong) ^ 1)
            thisp->element1.in.enq(enq_v);
}
bool l_class_OC_FifoPong__enq__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        bool tmp__1;
        bool tmp__2;
        tmp__1 = thisp->element2.in.enq__RDY();
        tmp__2 = thisp->element1.in.enq__RDY();
        return (tmp__1 | ((thisp->pong) ^ 1)) & (tmp__2 | (thisp->pong));
}
l_struct_OC_ValuePair l_class_OC_FifoPong__first(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair call3;
        l_struct_OC_ValuePair retval;
        if (thisp->pong) {
            call = thisp->element2.out.first();
        }
            if (thisp->pong) {
            retval.a = call.a;
        }
            if (thisp->pong) {
            retval.b = call.b;
        }
            if (thisp->pong) {
            retval.c = call.c;
        }
            if ((thisp->pong) ^ 1) {
            call3 = thisp->element1.out.first();
        }
            if ((thisp->pong) ^ 1) {
            retval.a = call3.a;
        }
            if ((thisp->pong) ^ 1) {
            retval.b = call3.b;
        }
            if ((thisp->pong) ^ 1) {
            retval.c = call3.c;
        }
            return retval;
}
bool l_class_OC_FifoPong__first__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        bool tmp__1;
        bool tmp__2;
        tmp__1 = thisp->element2.out.first__RDY();
        tmp__2 = thisp->element1.out.first__RDY();
        return (tmp__1 | ((thisp->pong) ^ 1)) & (tmp__2 | (thisp->pong));
}
void l_class_OC_FifoPong::run()
{
    element1.run();
    element2.run();
    commit();
}
void l_class_OC_FifoPong::commit()
{
    if (pong_valid) pong = pong_shadow;
    pong_valid = 0;
    element1.commit();
    element2.commit();
}
void l_class_OC_IVectorIndication__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v) {
        l_class_OC_IVectorIndication * thisp = (l_class_OC_IVectorIndication *)thisarg;
        testCount = testCount + (-1);
        if ((testCount + (-1)) <= 0) {
            stop_main_program = 1;
        }
            printf("Heard an ivector: %d %d tcount %d\n", heard_meth, heard_v, testCount);
}
bool l_class_OC_IVectorIndication__heard__RDY(void *thisarg) {
        l_class_OC_IVectorIndication * thisp = (l_class_OC_IVectorIndication *)thisarg;
        return 1;
}
void l_class_OC_IVectorIndication::run()
{
    commit();
}
void l_class_OC_IVectorIndication::commit()
{
}
void l_class_OC_IVectorRequest__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_IVectorRequest * thisp = (l_class_OC_IVectorRequest *)thisarg;
}
bool l_class_OC_IVectorRequest__say__RDY(void *thisarg) {
        l_class_OC_IVectorRequest * thisp = (l_class_OC_IVectorRequest *)thisarg;
        return 1;
}
void l_class_OC_IVectorRequest::run()
{
    commit();
}
void l_class_OC_IVectorRequest::commit()
{
}
void l_class_OC_IVector__respond0(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo0.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo0.out.deq();
        thisp->ind->heard(0, temp.b);
}
bool l_class_OC_IVector__respond0__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo0.out.first__RDY();
        tmp__2 = thisp->fifo0.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond1(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo1.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo1.out.deq();
        thisp->ind->heard(1, temp.b);
}
bool l_class_OC_IVector__respond1__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo1.out.first__RDY();
        tmp__2 = thisp->fifo1.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond2(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo2.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo2.out.deq();
        thisp->ind->heard(2, temp.b);
}
bool l_class_OC_IVector__respond2__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo2.out.first__RDY();
        tmp__2 = thisp->fifo2.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond3(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo3.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo3.out.deq();
        thisp->ind->heard(3, temp.b);
}
bool l_class_OC_IVector__respond3__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo3.out.first__RDY();
        tmp__2 = thisp->fifo3.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond4(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo4.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo4.out.deq();
        thisp->ind->heard(4, temp.b);
}
bool l_class_OC_IVector__respond4__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo4.out.first__RDY();
        tmp__2 = thisp->fifo4.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond5(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo5.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo5.out.deq();
        thisp->ind->heard(5, temp.b);
}
bool l_class_OC_IVector__respond5__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo5.out.first__RDY();
        tmp__2 = thisp->fifo5.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond6(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo6.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo6.out.deq();
        thisp->ind->heard(6, temp.b);
}
bool l_class_OC_IVector__respond6__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo6.out.first__RDY();
        tmp__2 = thisp->fifo6.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond7(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo7.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo7.out.deq();
        thisp->ind->heard(7, temp.b);
}
bool l_class_OC_IVector__respond7__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo7.out.first__RDY();
        tmp__2 = thisp->fifo7.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond8(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo8.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo8.out.deq();
        thisp->ind->heard(8, temp.b);
}
bool l_class_OC_IVector__respond8__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo8.out.first__RDY();
        tmp__2 = thisp->fifo8.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__respond9(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo9.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->fifo9.out.deq();
        thisp->ind->heard(9, temp.b);
}
bool l_class_OC_IVector__respond9__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo9.out.first__RDY();
        tmp__2 = thisp->fifo9.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_IVector__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.b = say_v;
        (say_meth == 0 ? &thisp->fifo0:say_meth == 1 ? &thisp->fifo1:say_meth == 2 ? &thisp->fifo2:say_meth == 3 ? &thisp->fifo3:say_meth == 4 ? &thisp->fifo4:say_meth == 5 ? &thisp->fifo5:say_meth == 6 ? &thisp->fifo6:say_meth == 7 ? &thisp->fifo7:say_meth == 8 ? &thisp->fifo8:&thisp->fifo9)->in.enq(temp);
}
bool l_class_OC_IVector__say__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        bool tmp__1;
        bool tmp__10;
        bool tmp__2;
        bool tmp__3;
        bool tmp__4;
        bool tmp__5;
        bool tmp__6;
        bool tmp__7;
        bool tmp__8;
        bool tmp__9;
        tmp__1 = thisp->fifo0.in.enq__RDY();
        tmp__2 = thisp->fifo1.in.enq__RDY();
        tmp__3 = thisp->fifo2.in.enq__RDY();
        tmp__4 = thisp->fifo3.in.enq__RDY();
        tmp__5 = thisp->fifo4.in.enq__RDY();
        tmp__6 = thisp->fifo5.in.enq__RDY();
        tmp__7 = thisp->fifo6.in.enq__RDY();
        tmp__8 = thisp->fifo7.in.enq__RDY();
        tmp__9 = thisp->fifo8.in.enq__RDY();
        tmp__10 = thisp->fifo9.in.enq__RDY();
        return ((((((((tmp__1 & tmp__2) & tmp__3) & tmp__4) & tmp__5) & tmp__6) & tmp__7) & tmp__8) & tmp__9) & tmp__10;
}
void l_class_OC_IVector::run()
{
    if (respond0__RDY()) respond0();
    if (respond1__RDY()) respond1();
    if (respond2__RDY()) respond2();
    if (respond3__RDY()) respond3();
    if (respond4__RDY()) respond4();
    if (respond5__RDY()) respond5();
    if (respond6__RDY()) respond6();
    if (respond7__RDY()) respond7();
    if (respond8__RDY()) respond8();
    if (respond9__RDY()) respond9();
    fifo0.run();
    fifo1.run();
    fifo2.run();
    fifo3.run();
    fifo4.run();
    fifo5.run();
    fifo6.run();
    fifo7.run();
    fifo8.run();
    fifo9.run();
    fifo10.run();
    commit();
}
void l_class_OC_IVector::commit()
{
    if (vsize_valid) vsize = vsize_shadow;
    vsize_valid = 0;
    fifo0.commit();
    fifo1.commit();
    fifo2.commit();
    fifo3.commit();
    fifo4.commit();
    fifo5.commit();
    fifo6.commit();
    fifo7.commit();
    fifo8.commit();
    fifo9.commit();
    fifo10.commit();
}
void l_class_OC_IVectorTest::run()
{
    ivector.run();
    commit();
}
void l_class_OC_IVectorTest::commit()
{
    ivector.commit();
}
