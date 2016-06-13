#include "precision.generated.h"
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
void l_class_OC_IVectorIndication__heard(void *thisarg, bool heard_meth, bool heard_v) {
        l_class_OC_IVectorIndication * thisp = (l_class_OC_IVectorIndication *)thisarg;
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
void l_class_OC_IVectorRequest__say(void *thisarg, bool say_meth, bool say_v) {
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
void l_class_OC_Fifo1_OC_0__deq(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__deq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_0__enq(void *thisarg, l_struct_OC_ValueType enq_v) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->element = enq_v;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__enq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return (thisp->full) ^ 1;
}
l_struct_OC_ValueType l_class_OC_Fifo1_OC_0__first(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->element;
}
bool l_class_OC_Fifo1_OC_0__first__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_0::run()
{
    commit();
}
void l_class_OC_Fifo1_OC_0::commit()
{
    if (full_valid) full = full_shadow;
    full_valid = 0;
}
void l_class_OC_IVector__respond(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValueType temp;
        temp.a = thisp->fifo.out.first().a;
        temp.b = thisp->fifo.out.first().b;
        thisp->gcounter = (thisp->gcounter) + 1;
        thisp->fifo.out.deq();
        thisp->ind->heard(temp.a, temp.b);
}
bool l_class_OC_IVector__respond__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return ((thisp->fifo.out.first__RDY()) & (thisp->fifo.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_class_OC_IVector__say(void *thisarg, bool say_meth, bool say_v) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        l_struct_OC_ValueType temp;
        temp.a = say_meth;
        temp.b = say_v;
        thisp->fifo.in.enq(temp);
}
bool l_class_OC_IVector__say__RDY(void *thisarg) {
        l_class_OC_IVector * thisp = (l_class_OC_IVector *)thisarg;
        return thisp->fifo.in.enq__RDY();
}
void l_class_OC_IVector::run()
{
    if (respond__RDY()) respond();
    fifo.run();
    commit();
}
void l_class_OC_IVector::commit()
{
    if (fcounter_valid) fcounter = fcounter_shadow;
    fcounter_valid = 0;
    fifo.commit();
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
