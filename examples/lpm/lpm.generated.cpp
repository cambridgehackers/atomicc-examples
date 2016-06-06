#include "lpm.generated.h"
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
        l_struct_OC_ValuePair retval;
        retval = thisp->saved;
        return retval;
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
void l_class_OC_Fifo1_OC_0__deq(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->full_shadow = 0;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__deq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return thisp->full;
}
void l_class_OC_Fifo1_OC_0__enq(void *thisarg, l_struct_OC_ValuePair enq_v) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        thisp->element = enq_v;
        thisp->full_shadow = 1;
        thisp->full_valid = 1;
}
bool l_class_OC_Fifo1_OC_0__enq__RDY(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        return (thisp->full) ^ 1;
}
l_struct_OC_ValuePair l_class_OC_Fifo1_OC_0__first(void *thisarg) {
        l_class_OC_Fifo1_OC_0 * thisp = (l_class_OC_Fifo1_OC_0 *)thisarg;
        l_struct_OC_ValuePair retval;
        retval = thisp->element;
        return retval;
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
void l_class_OC_Fifo2__deq(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        thisp->rindex_shadow = ((thisp->rindex) + 1) % 2;
        thisp->rindex_valid = 1;
}
bool l_class_OC_Fifo2__deq__RDY(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return (thisp->rindex) != (thisp->windex);
}
void l_class_OC_Fifo2__enq(void *thisarg, l_struct_OC_ValuePair enq_v) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        *((thisp->windex) == 0 ? &thisp->element0:&thisp->element1) = enq_v;
        thisp->windex_shadow = ((thisp->windex) + 1) % 2;
        thisp->windex_valid = 1;
}
bool l_class_OC_Fifo2__enq__RDY(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        return (((thisp->windex) + 1) % 2) != (thisp->rindex);
}
l_struct_OC_ValuePair l_class_OC_Fifo2__first(void *thisarg) {
        l_class_OC_Fifo2 * thisp = (l_class_OC_Fifo2 *)thisarg;
        l_struct_OC_ValuePair retval;
        retval = *((thisp->rindex) == 0 ? &thisp->element0:&thisp->element1);
        return retval;
}
bool l_class_OC_Fifo2__first__RDY(void *thisarg) {
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
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->inQ.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        printf("enter: (%d, %d)\n", temp.a, temp.b);
        thisp->inQ.out.deq();
        thisp->fifo.in.enq(temp);
        thisp->mem.req(temp.a, temp.b, temp.c);
}
bool l_class_OC_Lpm__enter__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        bool tmp__4;
        tmp__1 = thisp->inQ.out.first__RDY();
        tmp__2 = thisp->inQ.out.deq__RDY();
        tmp__3 = thisp->fifo.in.enq__RDY();
        tmp__4 = thisp->mem.req__RDY();
        return ((tmp__1 & tmp__2) & tmp__3) & tmp__4;
}
void l_class_OC_Lpm__exit(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair call1;
        l_struct_OC_ValuePair mtemp;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        call1 = thisp->mem.resValue();
        mtemp.a = call1.a;
        mtemp.b = call1.b;
        mtemp.c = call1.c;
        thisp->mem.resAccept();
        thisp->fifo.out.deq();
        printf("exit: (%d, %d)\n", temp.a, temp.b);
        thisp->outQ.in.enq(temp);
}
bool l_class_OC_Lpm__exit__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        bool tmp__4;
        bool tmp__5;
        tmp__1 = thisp->fifo.out.first__RDY();
        tmp__2 = thisp->mem.resValue__RDY();
        tmp__3 = thisp->mem.resAccept__RDY();
        tmp__4 = thisp->fifo.out.deq__RDY();
        tmp__5 = thisp->outQ.in.enq__RDY();
        return (((tmp__1 & tmp__2) & tmp__3) & tmp__4) & tmp__5;
}
void l_class_OC_Lpm__recirc(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair call1;
        l_struct_OC_ValuePair mtemp;
        l_struct_OC_ValuePair temp;
        call = thisp->fifo.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        call1 = thisp->mem.resValue();
        mtemp.a = call1.a;
        mtemp.b = call1.b;
        mtemp.c = call1.c;
        thisp->mem.resAccept();
        thisp->fifo.out.deq();
        printf("recirc: (%d, %d)\n", temp.a, temp.b);
        thisp->fifo.in.enq(temp);
        thisp->mem.req(temp.a, temp.b, temp.c);
}
bool l_class_OC_Lpm__recirc__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        bool tmp__4;
        bool tmp__5;
        bool tmp__6;
        tmp__1 = thisp->fifo.out.first__RDY();
        tmp__2 = thisp->mem.resValue__RDY();
        tmp__3 = thisp->mem.resAccept__RDY();
        tmp__4 = thisp->fifo.out.deq__RDY();
        tmp__5 = thisp->fifo.in.enq__RDY();
        tmp__6 = thisp->mem.req__RDY();
        return ((((tmp__1 & tmp__2) & tmp__3) & tmp__4) & tmp__5) & tmp__6;
}
void l_class_OC_Lpm__respond(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair call;
        l_struct_OC_ValuePair temp;
        call = thisp->outQ.out.first();
        temp.a = call.a;
        temp.b = call.b;
        temp.c = call.c;
        thisp->outQ.out.deq();
        printf("respond: (%d, %d)\n", temp.a, temp.b);
        thisp->indication->heard(temp.a, temp.b);
}
bool l_class_OC_Lpm__respond__RDY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->outQ.out.first__RDY();
        tmp__2 = thisp->outQ.out.deq__RDY();
        tmp__3 = thisp->indication->heard__READY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_Lpm__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        l_struct_OC_ValuePair temp;
        temp.a = say_meth;
        temp.b = say_v;
        printf("[%s:%d] (%d, %d)\n", ("say"), 98, say_meth, say_v);
        thisp->inQ.in.enq(temp);
}
bool l_class_OC_Lpm__say__READY(void *thisarg) {
        l_class_OC_Lpm * thisp = (l_class_OC_Lpm *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->inQ.in.enq__RDY();
        return tmp__1;
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
void l_class_OC_foo__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
        printf("Heard an lpm: %d %d\n", heard_meth, heard_v);
}
bool l_class_OC_foo__heard__READY(void *thisarg) {
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
