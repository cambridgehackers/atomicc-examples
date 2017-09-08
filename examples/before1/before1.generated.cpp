#include "before1.generated.h"
void l_class_OC_EchoIndicationInput__pipe$enq(void *thisarg, l_struct_OC_EchoIndication_data pipe$enq_v) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        if ((pipe$enq_v.tag) == 1) {
            thisp->meth_delay_shadow = pipe$enq_v.data.heard.meth;
        thisp->meth_delay_valid = 1;
        }
            if ((pipe$enq_v.tag) == 1) {
            thisp->v_delay_shadow = pipe$enq_v.data.heard.v;
        thisp->v_delay_valid = 1;
        }
            if ((pipe$enq_v.tag) == 1) {
            thisp->busy_delay_shadow = 1;
        thisp->busy_delay_valid = 1;
        }
    }
bool l_class_OC_EchoIndicationInput__pipe$enq__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        return ((thisp->busy_delay) != 0) ^ 1;
}
void l_class_OC_EchoIndicationInput__input_rule(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        thisp->busy_delay_shadow = 0;
        thisp->busy_delay_valid = 1;
        thisp->indication->heard(thisp->meth_delay, thisp->v_delay);
}
bool l_class_OC_EchoIndicationInput__input_rule__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        return ((thisp->busy_delay) != 0) & (thisp->indication->heard__RDY());
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
}
bool l_class_OC_Echo__delay_rule__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return (((thisp->busy) != 0) & ((thisp->busy_delay) == 0)) != 0;
}
void l_class_OC_Echo__respond_rule(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->busy_delay_shadow = 0;
        thisp->busy_delay_valid = 1;
        thisp->indication->heard(thisp->meth_delay, thisp->v_delay);
}
bool l_class_OC_Echo__respond_rule__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return ((thisp->busy_delay) != 0) & (thisp->indication->heard__RDY());
}
void l_class_OC_Echo__request$say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->meth_temp_shadow = request$say_meth;
        thisp->meth_temp_valid = 1;
        thisp->v_temp_shadow = request$say_v;
        thisp->v_temp_valid = 1;
        thisp->busy_shadow = 1;
        thisp->busy_valid = 1;
}
void l_class_OC_Echo__request$say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->meth_temp_shadow = request$say2_meth;
        thisp->meth_temp_valid = 1;
        thisp->v_temp_shadow = request$say2_v;
        thisp->v_temp_valid = 1;
        thisp->busy_shadow = 1;
        thisp->busy_valid = 1;
}
bool l_class_OC_Echo__request$say2__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return ((thisp->busy) != 0) ^ 1;
}
bool l_class_OC_Echo__request$say__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return ((thisp->busy) != 0) ^ 1;
}
void l_class_OC_Echo__x2y(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->y_shadow = thisp->x;
        thisp->y_valid = 1;
}
bool l_class_OC_Echo__x2y__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return 1;
}
void l_class_OC_Echo__y2x(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->x_shadow = thisp->y;
        thisp->x_valid = 1;
}
bool l_class_OC_Echo__y2x__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return 1;
}
void l_class_OC_Echo__y2xnull(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
}
bool l_class_OC_Echo__y2xnull__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return 1;
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
    if (x_valid) x = x_shadow;
    x_valid = 0;
    if (y_valid) y = y_shadow;
    y_valid = 0;
}
void l_class_OC_foo__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
}
bool l_class_OC_foo__indication$heard__RDY(void *thisarg) {
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
void l_class_OC_EchoIndicationOutput__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        if ((thisp->even) != 0) {
            thisp->ind1.tag = 1;
        }
            if ((thisp->even) != 0) {
            thisp->ind1.data.heard.meth = indication$heard_meth;
        }
            if ((thisp->even) != 0) {
            thisp->ind1.data.heard.v = indication$heard_v;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.tag = 1;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.data.heard.meth = indication$heard_meth;
        }
            if (((thisp->even) != 0) ^ 1) {
            thisp->ind0.data.heard.v = indication$heard_v;
        }
            thisp->ind_busy_shadow = 1;
        thisp->ind_busy_valid = 1;
        thisp->even_shadow = ((thisp->even) != 0) ^ 1;
        thisp->even_valid = 1;
}
bool l_class_OC_EchoIndicationOutput__indication$heard__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        return ((thisp->ind_busy) != 0) ^ 1;
}
void l_class_OC_EchoIndicationOutput__output_rulee(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        thisp->ind_busy_shadow = 0;
        thisp->ind_busy_valid = 1;
        thisp->pipe->enq(thisp->ind0);
}
bool l_class_OC_EchoIndicationOutput__output_rulee__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        return ((((thisp->ind_busy) != 0) & ((thisp->even) != 0)) != 0) & (thisp->pipe->enq__RDY());
}
void l_class_OC_EchoIndicationOutput__output_ruleo(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        thisp->ind_busy_shadow = 0;
        thisp->ind_busy_valid = 1;
        thisp->pipe->enq(thisp->ind1);
}
bool l_class_OC_EchoIndicationOutput__output_ruleo__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        return ((((thisp->ind_busy) != 0) & ((thisp->even) == 0)) != 0) & (thisp->pipe->enq__RDY());
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
void l_class_OC_EchoRequestInput__pipe$enq(void *thisarg, l_struct_OC_EchoRequest_data pipe$enq_v) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        if ((pipe$enq_v.tag) == 1)
            thisp->request->say(pipe$enq_v.data.say.meth, pipe$enq_v.data.say.v);
        if ((pipe$enq_v.tag) == 2)
            thisp->request->say2(pipe$enq_v.data.say2.meth, pipe$enq_v.data.say2.v);
}
bool l_class_OC_EchoRequestInput__pipe$enq__RDY(void *thisarg) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        return (thisp->request->say__RDY()) & (thisp->request->say2__RDY());
}
void l_class_OC_EchoRequestInput::run()
{
    commit();
}
void l_class_OC_EchoRequestInput::commit()
{
}
void l_class_OC_EchoRequestOutput__request$say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 1;
        ind.data.say.meth = request$say_meth;
        ind.data.say.v = request$say_v;
        thisp->pipe->enq(ind);
}
void l_class_OC_EchoRequestOutput__request$say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 2;
        ind.data.say2.meth = request$say2_meth;
        ind.data.say2.v = request$say2_v;
        thisp->pipe->enq(ind);
}
bool l_class_OC_EchoRequestOutput__request$say2__RDY(void *thisarg) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        return thisp->pipe->enq__RDY();
}
bool l_class_OC_EchoRequestOutput__request$say__RDY(void *thisarg) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        return thisp->pipe->enq__RDY();
}
void l_class_OC_EchoRequestOutput::run()
{
    commit();
}
void l_class_OC_EchoRequestOutput::commit()
{
}
void l_class_OC_Connect__swap2_rule(void *thisarg) {
        l_class_OC_Connect * thisp = (l_class_OC_Connect *)thisarg;
        thisp->lEcho.y2xnull();
}
bool l_class_OC_Connect__swap2_rule__RDY(void *thisarg) {
        l_class_OC_Connect * thisp = (l_class_OC_Connect *)thisarg;
        return thisp->lEcho.y2xnull__RDY();
}
void l_class_OC_Connect__swap_rule(void *thisarg) {
        l_class_OC_Connect * thisp = (l_class_OC_Connect *)thisarg;
        thisp->lEcho.x2y();
        thisp->lEcho.y2x();
}
bool l_class_OC_Connect__swap_rule__RDY(void *thisarg) {
        l_class_OC_Connect * thisp = (l_class_OC_Connect *)thisarg;
        return (thisp->lEcho.x2y__RDY()) & (thisp->lEcho.y2x__RDY());
}
void l_class_OC_Connect::run()
{
    if (swap2_rule__RDY()) swap2_rule();
    if (swap_rule__RDY()) swap_rule();
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
