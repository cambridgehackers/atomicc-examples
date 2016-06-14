#include "lpm.generated.h"
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
void l_class_OC_LpmRequest__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_LpmRequest * thisp = (l_class_OC_LpmRequest *)thisarg;
}
bool l_class_OC_LpmRequest__say__READY(void *thisarg) {
        l_class_OC_LpmRequest * thisp = (l_class_OC_LpmRequest *)thisarg;
        return 1;
}
void l_class_OC_LpmRequest::run()
{
    commit();
}
void l_class_OC_LpmRequest::commit()
{
}
void l_class_OC_LpmMemory__memdelay(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        thisp->delayCount_shadow = (thisp->delayCount) - 1;
        thisp->delayCount_valid = 1;
}
bool l_class_OC_LpmMemory__memdelay__RDY(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        return (thisp->delayCount) > 1;
}
void l_class_OC_LpmMemory__req(void *thisarg, unsigned int req_v_2e_coerce0, unsigned int req_v_2e_coerce1, unsigned int req_v_2e_coerce2) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        l_struct_OC_ValuePair v;
        v.a = req_v_2e_coerce0;
        v.b = req_v_2e_coerce1;
        v.c = req_v_2e_coerce2;
        thisp->delayCount_shadow = 4;
        thisp->delayCount_valid = 1;
        thisp->saved = v;
}
bool l_class_OC_LpmMemory__req__RDY(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        return (thisp->delayCount) == 0;
}
void l_class_OC_LpmMemory__resAccept(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        thisp->delayCount_shadow = 0;
        thisp->delayCount_valid = 1;
}
bool l_class_OC_LpmMemory__resAccept__RDY(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        return (thisp->delayCount) == 1;
}
l_struct_OC_ValuePair l_class_OC_LpmMemory__resValue(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        return thisp->saved;
}
bool l_class_OC_LpmMemory__resValue__RDY(void *thisarg) {
        l_class_OC_LpmMemory * thisp = (l_class_OC_LpmMemory *)thisarg;
        return (thisp->delayCount) == 1;
}
void l_class_OC_LpmMemory::run()
{
    if (memdelay__RDY()) memdelay();
    commit();
}
void l_class_OC_LpmMemory::commit()
{
    if (delayCount_valid) delayCount = delayCount_shadow;
    delayCount_valid = 0;
}
void l_class_OC_Fifo1_OC_0__out$deq(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__out$deq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_0__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->element = in$enq_v;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__in$enq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return (thisp->full) ^ 1;
}
l_struct_OC_ValuePair l_class_OC_Fifo1_OC_0__out$first(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->element;
}
bool l_class_OC_Fifo1_OC_0__out$first__RDY(void *thisarg) {
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
void l_class_OC_Fifo2__out$deq(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        thisp->rindex_shadow = ((thisp->rindex) + 1) % 2;
        thisp->rindex_valid = 1;
}
bool l_class_OC_Fifo2__out$deq__RDY(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return (thisp->rindex) != (thisp->windex);
}
void l_class_OC_Fifo2__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        *((thisp->windex) == 0 ? &thisp->element0:&thisp->element1) = in$enq_v;
        thisp->windex_shadow = ((thisp->windex) + 1) % 2;
        thisp->windex_valid = 1;
}
bool l_class_OC_Fifo2__in$enq__RDY(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return (((thisp->windex) + 1) % 2) != (thisp->rindex);
}
l_struct_OC_ValuePair l_class_OC_Fifo2__out$first(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return *((thisp->rindex) == 0 ? &thisp->element0:&thisp->element1);
}
bool l_class_OC_Fifo2__out$first__RDY(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return (thisp->rindex) != (thisp->windex);
}
void l_class_OC_Fifo2::run()
{
    commit();
}
void l_class_OC_Fifo2::commit()
{
    if (rindex_valid) rindex = rindex_shadow;
    rindex_valid = 0;
    if (windex_valid) windex = windex_shadow;
    windex_valid = 0;
}
void l_class_OC_Lpm__enter(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->inQ.out.first().a;
        temp.b = thisp->inQ.out.first().b;
        temp.c = thisp->inQ.out.first().c;
        thisp->inQ.out.deq();
        thisp->fifo.in.enq(temp);
        thisp->mem.req(temp.a, temp.b, temp.c);
}
bool l_class_OC_Lpm__enter__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        return (((thisp->inQ.out.first__RDY()) & (thisp->inQ.out.deq__RDY())) & (thisp->fifo.in.enq__RDY())) & (thisp->mem.req__RDY());
}
void l_class_OC_Lpm__exit(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        l_struct_OC_ValuePair mtemp;
        temp.a = thisp->fifo.out.first().a;
        temp.b = thisp->fifo.out.first().b;
        temp.c = thisp->fifo.out.first().c;
        mtemp.a = thisp->mem.resValue().a;
        mtemp.b = thisp->mem.resValue().b;
        mtemp.c = thisp->mem.resValue().c;
        thisp->mem.resAccept();
        thisp->fifo.out.deq();
        thisp->outQ.in.enq(temp);
}
bool l_class_OC_Lpm__exit__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        return ((((thisp->fifo.out.first__RDY()) & (thisp->mem.resValue__RDY())) & (thisp->mem.resAccept__RDY())) & (thisp->fifo.out.deq__RDY())) & (thisp->outQ.in.enq__RDY());
}
void l_class_OC_Lpm__recirc(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        l_struct_OC_ValuePair mtemp;
        temp.a = thisp->fifo.out.first().a;
        temp.b = thisp->fifo.out.first().b;
        temp.c = thisp->fifo.out.first().c;
        mtemp.a = thisp->mem.resValue().a;
        mtemp.b = thisp->mem.resValue().b;
        mtemp.c = thisp->mem.resValue().c;
        thisp->mem.resAccept();
        thisp->fifo.out.deq();
        thisp->fifo.in.enq(temp);
        thisp->mem.req(temp.a, temp.b, temp.c);
}
bool l_class_OC_Lpm__recirc__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        return (((((thisp->fifo.out.first__RDY()) & (thisp->mem.resValue__RDY())) & (thisp->mem.resAccept__RDY())) & (thisp->fifo.out.deq__RDY())) & (thisp->fifo.in.enq__RDY())) & (thisp->mem.req__RDY());
}
void l_class_OC_Lpm__respond(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = thisp->outQ.out.first().a;
        temp.b = thisp->outQ.out.first().b;
        temp.c = thisp->outQ.out.first().c;
        thisp->outQ.out.deq();
        thisp->indication->heard(temp.a, temp.b);
}
bool l_class_OC_Lpm__respond__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        return ((thisp->outQ.out.first__RDY()) & (thisp->outQ.out.deq__RDY())) & (thisp->indication->heard__READY());
}
void l_class_OC_Lpm__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = say_meth;
        temp.b = say_v;
        thisp->inQ.in.enq(temp);
}
bool l_class_OC_Lpm__say__READY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        return thisp->inQ.in.enq__RDY();
}
void l_class_OC_Lpm::run()
{
    if (enter__RDY()) enter();
    if (exit__RDY()) exit();
    if (recirc__RDY()) recirc();
    if (respond__RDY()) respond();
    inQ.run();
    fifo.run();
    outQ.run();
    mem.run();
    commit();
}
void l_class_OC_Lpm::commit()
{
    if (doneCount_valid) doneCount = doneCount_shadow;
    doneCount_valid = 0;
    inQ.commit();
    fifo.commit();
    outQ.commit();
    mem.commit();
}
void l_class_OC_foo__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
}
bool l_class_OC_foo__indication$heard__READY(void *thisarg) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
        return 1;
}
void l_class_OC_foo::run()
{
    commit();
}
void l_class_OC_foo::commit()
{
}
void l_class_OC_LpmTest::run()
{
    lpm.run();
    commit();
}
void l_class_OC_LpmTest::commit()
{
    lpm.commit();
}
