#include "l_class_OC_EchoIndicationOutput.h"
void l_class_OC_EchoIndicationOutput__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        if ((thisp->even) != 0) {
            thisp->ind1.tag = 1;
        }
            if ((thisp->even) != 0) {
            thisp->ind1.data.heard.meth = heard_meth;
        }
            if ((thisp->even) != 0) {
            thisp->ind1.data.heard.v = heard_v;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.tag = 1;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.data.heard.meth = heard_meth;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.data.heard.v = heard_v;
        }
            thisp->ind_busy_shadow = 1;
        thisp->ind_busy_valid = 1;
        thisp->even_shadow = ((thisp->even) != 0) ^ 1;
        thisp->even_valid = 1;
        printf("[%s:%d]EchoIndicationOutput even %d\n", ("heard"), 160, thisp->even);
}
bool l_class_OC_EchoIndicationOutput__heard__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        return ((thisp->ind_busy) != 0) ^ 1;
}
void l_class_OC_EchoIndicationOutput__output_rulee(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        thisp->ind_busy_shadow = 0;
        thisp->ind_busy_valid = 1;
        printf("[output_rulee:%d]EchoIndicationOutput tag %d\n", 177, thisp->ind0.tag);
        thisp->pipe->enq(thisp->ind0);
}
bool l_class_OC_EchoIndicationOutput__output_rulee__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->pipe->enq__RDY();
        return ((((thisp->ind_busy) != 0) & ((thisp->even) != 0)) != 0) & tmp__1;
}
void l_class_OC_EchoIndicationOutput__output_ruleo(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        thisp->ind_busy_shadow = 0;
        thisp->ind_busy_valid = 1;
        printf("[output_ruleo:%d]EchoIndicationOutput tag %d\n", 182, thisp->ind1.tag);
        thisp->pipe->enq(thisp->ind1);
}
bool l_class_OC_EchoIndicationOutput__output_ruleo__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->pipe->enq__RDY();
        return ((((thisp->ind_busy) != 0) & ((thisp->even) == 0)) != 0) & tmp__1;
}
void l_class_OC_EchoIndicationOutput::run()
{
    if (output_rulee__RDY()) output_rulee();
    if (output_ruleo__RDY()) output_ruleo();
    commit();
}
void l_class_OC_EchoIndicationOutput::commit()
{
    if (ind_busy_valid) ind_busy = ind_busy_shadow;
    ind_busy_valid = 0;
    if (even_valid) even = even_shadow;
    even_valid = 0;
}
