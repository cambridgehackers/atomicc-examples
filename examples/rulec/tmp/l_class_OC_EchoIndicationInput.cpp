#include "l_class_OC_EchoIndicationInput.h"
void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data enq_v) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        if ((enq_v.tag) == 1) {
            thisp->meth_delay_shadow = enq_v.data.heard.meth;
        thisp->meth_delay_valid = 1;
        }
            if ((enq_v.tag) == 1) {
            thisp->v_delay_shadow = enq_v.data.heard.v;
        thisp->v_delay_valid = 1;
        }
            if ((enq_v.tag) == 1) {
            thisp->busy_delay_shadow = 1;
        thisp->busy_delay_valid = 1;
        }
            printf("[%s:%d]EchoIndicationInput tag %d\n", ("enq"), 197, enq_v.tag);
}
bool l_class_OC_EchoIndicationInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        return ((thisp->busy_delay) != 0) ^ 1;
}
void l_class_OC_EchoIndicationInput__input_rule(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        thisp->busy_delay_shadow = 0;
        thisp->busy_delay_valid = 1;
        printf("[input_rule:%d]EchoIndicationInput\n", 209);
        thisp->indication->heard(thisp->meth_delay, thisp->v_delay);
}
bool l_class_OC_EchoIndicationInput__input_rule__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->indication->heard__RDY();
        return ((thisp->busy_delay) != 0) & tmp__1;
}
void l_class_OC_EchoIndicationInput::run()
{
    if (input_rule__RDY()) input_rule();
    commit();
}
void l_class_OC_EchoIndicationInput::commit()
{
    if (busy_delay_valid) busy_delay = busy_delay_shadow;
    busy_delay_valid = 0;
    if (meth_delay_valid) meth_delay = meth_delay_shadow;
    meth_delay_valid = 0;
    if (v_delay_valid) v_delay = v_delay_shadow;
    v_delay_valid = 0;
}
