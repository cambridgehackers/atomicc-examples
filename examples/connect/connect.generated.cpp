#include "connect.generated.h"
void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_EchoRequestOutput * thisp = (l_class_OC_EchoRequestOutput *)thisarg;
        l_struct_OC_EchoRequest_data ind;
        ind.tag = 1;
        ind.data.say.meth = say_meth;
        ind.data.say.v = say_v;
        printf("entered EchoRequestOutput::say\n");
        thisp->pipe->enq(ind);
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
        printf("entered EchoRequestInput::enq\n");
        if ((enq_v.tag) == 1)
            thisp->request->say(enq_v.data.say.meth, enq_v.data.say.v);
}
bool l_class_OC_EchoRequestInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoRequestInput * thisp = (l_class_OC_EchoRequestInput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->request->say__RDY();
        return tmp__1;
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
        l_struct_OC_EchoIndication_data ind;
        ind.tag = 1;
        ind.data.heard.meth = heard_meth;
        ind.data.heard.v = heard_v;
        thisp->pipe->enq(ind);
}
bool l_class_OC_EchoIndicationOutput__heard__RDY(void *thisarg) {
        l_class_OC_EchoIndicationOutput * thisp = (l_class_OC_EchoIndicationOutput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->pipe->enq__RDY();
        return tmp__1;
}
void l_class_OC_EchoIndicationOutput::run()
{
    commit();
}
void l_class_OC_EchoIndicationOutput::commit()
{
}
void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data enq_v) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        if ((enq_v.tag) == 1)
            thisp->indication->heard(enq_v.data.heard.meth, enq_v.data.heard.v);
}
bool l_class_OC_EchoIndicationInput__enq__RDY(void *thisarg) {
        l_class_OC_EchoIndicationInput * thisp = (l_class_OC_EchoIndicationInput *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->indication->heard__RDY();
        return tmp__1;
}
void l_class_OC_EchoIndicationInput::run()
{
    commit();
}
void l_class_OC_EchoIndicationInput::commit()
{
}
void l_class_OC_Echo__say(void *thisarg, unsigned int say_meth, unsigned int say_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->indication->heard(say_meth, say_v);
}
bool l_class_OC_Echo__say__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->indication->heard__RDY();
        return tmp__1;
}
void l_class_OC_Echo::run()
{
    commit();
}
void l_class_OC_Echo::commit()
{
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
