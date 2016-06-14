#include "fifo.generated.h"
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
