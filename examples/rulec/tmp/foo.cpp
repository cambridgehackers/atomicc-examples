#include "foo.h"
void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 1;
        ind.data.say.meth = say_meth;
        ind.data.say.v = say_v;
        printf("entered EchoRequestOutput::say\n");
        thisp->pipe->enq(ind);
}
void l_class_OC_EchoRequestOutput__say2(void *thisarg, unsigned int say2_meth, unsigned int say2_v, unsigned int say2_v2) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 2;
        ind.data.say2.meth = say2_meth;
        ind.data.say2.v = say2_v;
        ind.data.say2.v2 = say2_v2;
        printf("entered EchoRequestOutput::say2\n");
        thisp->pipe->enq(ind);
}
bool l_class_OC_EchoRequestOutput__say2__RDY(void *thisarg) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->pipe->enq__RDY();
        return tmp__1;
}
bool l_class_OC_EchoRequestOutput__say__RDY(void *thisarg) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->pipe->enq__RDY();
        return tmp__1;
}
void l_class_OC_EchoRequestOutput::run()
{
    commit();
}
void l_class_OC_EchoRequestOutput::commit()
{
}
void l_class_OC_EchoRequestInput__enq(void *thisarg, l_struct_OC_EchoRequest_data enq_v) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        printf("entered EchoRequestInput::enq tag %d\n", enq_v.tag);
        if ((enq_v.tag) == 1)
            thisp->request->say(enq_v.data.say.meth, enq_v.data.say.v);
        if ((enq_v.tag) == 2)
            thisp->request->say2(enq_v.data.say2.meth, enq_v.data.say2.v, enq_v.data.say2.v2);
}
bool l_class_OC_EchoRequestInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        bool tmp__1;
        bool tmp__2;
        tmp__1 = thisp->request->say__RDY();
        tmp__2 = thisp->request->say2__RDY();
        return tmp__1 & tmp__2;
}
void l_class_OC_EchoRequestInput::run()
{
    commit();
}
void l_class_OC_EchoRequestInput::commit()
{
}
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
void l_class_OC_Echo__delay_rule(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->busy_shadow = 0;
        thisp->busy_valid = 1;
        thisp->busy_delay_shadow = 1;
        thisp->busy_delay_valid = 1;
        thisp->meth_delay_shadow = thisp->meth_temp;
        thisp->meth_delay_valid = 1;
        thisp->v_delay_shadow = thisp->v_temp;
        thisp->v_delay_valid = 1;
        printf("[delay_rule:%d]Echo\n", 241);
}
bool l_class_OC_Echo__delay_rule__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return (((thisp->busy) != 0) & ((thisp->busy_delay) == 0)) != 0;
}
void l_class_OC_Echo__respond_rule(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->busy_delay_shadow = 0;
        thisp->busy_delay_valid = 1;
        printf("[respond_rule:%d]Echo\n", 248);
        thisp->indication->heard(thisp->meth_delay, thisp->v_delay);
}
bool l_class_OC_Echo__respond_rule__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->indication->heard__RDY();
        return ((thisp->busy_delay) != 0) & tmp__1;
}
void l_class_OC_Echo__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->meth_temp_shadow = say_meth;
        thisp->meth_temp_valid = 1;
        thisp->v_temp_shadow = say_v;
        thisp->v_temp_valid = 1;
        thisp->busy_shadow = 1;
        thisp->busy_valid = 1;
        printf("[%s:%d]Echo\n", ("say"), 227);
}
void l_class_OC_Echo__say2(void *thisarg, unsigned int say2_meth, unsigned int say2_v, unsigned int say2_v2) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->meth_temp_shadow = say2_meth;
        thisp->meth_temp_valid = 1;
        thisp->v_temp_shadow = say2_v;
        thisp->v_temp_valid = 1;
        thisp->busy_shadow = 1;
        thisp->busy_valid = 1;
        printf("[%s:%d]Echo\n", ("say2"), 233);
}
bool l_class_OC_Echo__say2__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return ((thisp->busy) != 0) ^ 1;
}
bool l_class_OC_Echo__say__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return ((thisp->busy) != 0) ^ 1;
}
void l_class_OC_Echo::run()
{
    if (delay_rule__RDY()) delay_rule();
    if (respond_rule__RDY()) respond_rule();
    commit();
}
void l_class_OC_Echo::commit()
{
    if (busy_valid) busy = busy_shadow;
    busy_valid = 0;
    if (meth_temp_valid) meth_temp = meth_temp_shadow;
    meth_temp_valid = 0;
    if (v_temp_valid) v_temp = v_temp_shadow;
    v_temp_valid = 0;
    if (busy_delay_valid) busy_delay = busy_delay_shadow;
    busy_delay_valid = 0;
    if (meth_delay_valid) meth_delay = meth_delay_shadow;
    meth_delay_valid = 0;
    if (v_delay_valid) v_delay = v_delay_shadow;
    v_delay_valid = 0;
}
void l_class_OC_foo__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
        printf("Heard an echo: %d %d\n", heard_meth, heard_v);
}
bool l_class_OC_foo__heard__RDY(void *thisarg) {
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
void l_class_OC_Connect::run()
{
    lEIO.run();
    lERI.run();
    lEcho.run();
    lERO_test.run();
    lEII_test.run();
    commit();
}
void l_class_OC_Connect::commit()
{
    lEIO.commit();
    lERI.commit();
    lEcho.commit();
    lERO_test.commit();
    lEII_test.commit();
}
