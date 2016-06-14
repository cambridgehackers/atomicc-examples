#include "connect.generated.h"
void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 1;
        ind.data.say.meth = request$say_meth;
        ind.data.say.v = request$say_v;
        thisp->pipe->enq(ind);
}
bool l_class_OC_EchoRequestOutput__say__RDY(void *thisarg) {
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
void l_class_OC_EchoRequestInput__enq(void *thisarg, l_struct_OC_EchoRequest_data pipe$enq_v) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        if ((pipe$enq_v.tag) == 1)
            thisp->request->say(pipe$enq_v.data.say.meth, pipe$enq_v.data.say.v);
}
bool l_class_OC_EchoRequestInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        return thisp->request->say__RDY();
}
void l_class_OC_EchoRequestInput::run()
{
    commit();
}
void l_class_OC_EchoRequestInput::commit()
{
}
void l_class_OC_EchoIndicationOutput__heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        l_struct_OC_EchoIndication_data ind;
        ind.tag = 1;
        ind.data.heard.meth = indication$heard_meth;
        ind.data.heard.v = indication$heard_v;
        thisp->pipe->enq(ind);
}
bool l_class_OC_EchoIndicationOutput__heard__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        return thisp->pipe->enq__RDY();
}
void l_class_OC_EchoIndicationOutput::run()
{
    commit();
}
void l_class_OC_EchoIndicationOutput::commit()
{
}
void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data pipe$enq_v) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        if ((pipe$enq_v.tag) == 1)
            thisp->indication->heard(pipe$enq_v.data.heard.meth, pipe$enq_v.data.heard.v);
}
bool l_class_OC_EchoIndicationInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        return thisp->indication->heard__RDY();
}
void l_class_OC_EchoIndicationInput::run()
{
    commit();
}
void l_class_OC_EchoIndicationInput::commit()
{
}
void l_class_OC_Echo__say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->indication->heard(request$say_meth, request$say_v);
}
bool l_class_OC_Echo__say__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        return thisp->indication->heard__RDY();
}
void l_class_OC_Echo::run()
{
    commit();
}
void l_class_OC_Echo::commit()
{
}
void l_class_OC_foo__heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v) {
        l_class_OC_foo * thisp = (l_class_OC_foo *)thisarg;
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
