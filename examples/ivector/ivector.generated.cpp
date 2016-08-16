#include "ivector.generated.h"
void l_class_OC_Fifo1__out$deq(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1__out$deq__RDY(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1__in$enq(void *thisarg, unsigned int in$enq_v) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        thisp->element_shadow = in$enq_v;
        thisp->element_valid = 1;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1__in$enq__RDY(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return (thisp->full) ^ 1;
}
unsigned int l_class_OC_Fifo1__out$first(void *thisarg) {
        l_class_OC_Fifo1 * thisp = (l_class_OC_Fifo1 *)thisarg;
        return thisp->element;
}
bool l_class_OC_Fifo1__out$first__RDY(void *thisarg) {
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
void l_class_OC_Fifo1_OC_3__out$deq(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_3__out$deq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_3__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        thisp->element = in$enq_v;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_3__in$enq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return (thisp->full) ^ 1;
}
l_struct_OC_ValuePair l_class_OC_Fifo1_OC_3__out$first(void *thisarg) {
        l_class_OC_Fifo1_OC_3 * thisp = (l_class_OC_Fifo1_OC_3 *)thisarg;
        return thisp->element;
}
bool l_class_OC_Fifo1_OC_3__out$first__RDY(void *thisarg) {
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
void l_class_OC_FifoPong__out$deq(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        thisp->pong_shadow = (thisp->pong) ^ 1;
        thisp->pong_valid = 1;
        if (thisp->pong)
            thisp->element2.out.deq();
        if ((thisp->pong) ^ 1)
            thisp->element1.out.deq();
}
bool l_class_OC_FifoPong__out$deq__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        return ((thisp->element2.out.deq__RDY()) | ((thisp->pong) ^ 1)) & ((thisp->element1.out.deq__RDY()) | (thisp->pong));
}
void l_class_OC_FifoPong__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        if (thisp->pong)
            thisp->element2.in.enq(in$enq_v);
        if ((thisp->pong) ^ 1)
            thisp->element1.in.enq(in$enq_v);
}
bool l_class_OC_FifoPong__in$enq__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        return ((thisp->element2.in.enq__RDY()) | ((thisp->pong) ^ 1)) & ((thisp->element1.in.enq__RDY()) | (thisp->pong));
}
l_struct_OC_ValuePair l_class_OC_FifoPong__out$first(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        l_struct_OC_ValuePair retval;
        if (thisp->pong) {
            retval.a = thisp->element2.out.first().a;
        }
            if (thisp->pong) {
            retval.b = thisp->element2.out.first().b;
        }
            if (thisp->pong) {
            retval.c = thisp->element2.out.first().c;
        }
            if ((thisp->pong) ^ 1) {
            retval.a = thisp->element1.out.first().a;
        }
            if ((thisp->pong) ^ 1) {
            retval.b = thisp->element1.out.first().b;
        }
            if ((thisp->pong) ^ 1) {
            retval.c = thisp->element1.out.first().c;
        }
            return retval;
}
bool l_class_OC_FifoPong__out$first__RDY(void *thisarg) {
        l_class_OC_FifoPong * thisp = (l_class_OC_FifoPong *)thisarg;
        return ((thisp->element2.out.first__RDY()) | ((thisp->pong) ^ 1)) & ((thisp->element1.out.first__RDY()) | (thisp->pong));
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
void l_class_OC_IVector__respond0(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo0.out.first().a;
        temp.b = thisp->fifo0.out.first().b;
        temp.c = thisp->fifo0.out.first().c;
        thisp->fifo0.out.deq();
        thisp->ind->heard(0, temp.b);
}
bool l_class_OC_IVector__respond0__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo0.out.first__RDY()) & (thisp->fifo0.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond1(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo1.out.first().a;
        temp.b = thisp->fifo1.out.first().b;
        temp.c = thisp->fifo1.out.first().c;
        thisp->fifo1.out.deq();
        thisp->ind->heard(1, temp.b);
}
bool l_class_OC_IVector__respond1__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo1.out.first__RDY()) & (thisp->fifo1.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond2(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo2.out.first().a;
        temp.b = thisp->fifo2.out.first().b;
        temp.c = thisp->fifo2.out.first().c;
        thisp->fifo2.out.deq();
        thisp->ind->heard(2, temp.b);
}
bool l_class_OC_IVector__respond2__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo2.out.first__RDY()) & (thisp->fifo2.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond3(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo3.out.first().a;
        temp.b = thisp->fifo3.out.first().b;
        temp.c = thisp->fifo3.out.first().c;
        thisp->fifo3.out.deq();
        thisp->ind->heard(3, temp.b);
}
bool l_class_OC_IVector__respond3__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo3.out.first__RDY()) & (thisp->fifo3.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond4(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo4.out.first().a;
        temp.b = thisp->fifo4.out.first().b;
        temp.c = thisp->fifo4.out.first().c;
        thisp->fifo4.out.deq();
        thisp->ind->heard(4, temp.b);
}
bool l_class_OC_IVector__respond4__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo4.out.first__RDY()) & (thisp->fifo4.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond5(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo5.out.first().a;
        temp.b = thisp->fifo5.out.first().b;
        temp.c = thisp->fifo5.out.first().c;
        thisp->fifo5.out.deq();
        thisp->ind->heard(5, temp.b);
}
bool l_class_OC_IVector__respond5__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo5.out.first__RDY()) & (thisp->fifo5.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond6(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo6.out.first().a;
        temp.b = thisp->fifo6.out.first().b;
        temp.c = thisp->fifo6.out.first().c;
        thisp->fifo6.out.deq();
        thisp->ind->heard(6, temp.b);
}
bool l_class_OC_IVector__respond6__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo6.out.first__RDY()) & (thisp->fifo6.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond7(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo7.out.first().a;
        temp.b = thisp->fifo7.out.first().b;
        temp.c = thisp->fifo7.out.first().c;
        thisp->fifo7.out.deq();
        thisp->ind->heard(7, temp.b);
}
bool l_class_OC_IVector__respond7__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo7.out.first__RDY()) & (thisp->fifo7.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond8(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo8.out.first().a;
        temp.b = thisp->fifo8.out.first().b;
        temp.c = thisp->fifo8.out.first().c;
        thisp->fifo8.out.deq();
        thisp->ind->heard(8, temp.b);
}
bool l_class_OC_IVector__respond8__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo8.out.first__RDY()) & (thisp->fifo8.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__respond9(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->fifo9.out.first().a;
        temp.b = thisp->fifo9.out.first().b;
        temp.c = thisp->fifo9.out.first().c;
        thisp->fifo9.out.deq();
        thisp->ind->heard(9, temp.b);
}
bool l_class_OC_IVector__respond9__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo9.out.first__RDY()) & (thisp->fifo9.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__in$say(void *thisarg, unsigned int in$say_meth, unsigned int in$say_v) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.b = in$say_v;
        (in$say_meth == 0 ? &thisp->fifo0:in$say_meth == 1 ? &thisp->fifo1:in$say_meth == 2 ? &thisp->fifo2:in$say_meth == 3 ? &thisp->fifo3:in$say_meth == 4 ? &thisp->fifo4:in$say_meth == 5 ? &thisp->fifo5:in$say_meth == 6 ? &thisp->fifo6:in$say_meth == 7 ? &thisp->fifo7:in$say_meth == 8 ? &thisp->fifo8:&thisp->fifo9)->in.enq(temp);
}
bool l_class_OC_IVector__in$say__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return (((((((((thisp->fifo0.in.enq__RDY()) & (thisp->fifo1.in.enq__RDY())) & (thisp->fifo2.in.enq__RDY())) & (thisp->fifo3.in.enq__RDY())) & (thisp->fifo4.in.enq__RDY())) & (thisp->fifo5.in.enq__RDY())) & (thisp->fifo6.in.enq__RDY())) & (thisp->fifo7.in.enq__RDY())) & (thisp->fifo8.in.enq__RDY())) & (thisp->fifo9.in.enq__RDY());
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
