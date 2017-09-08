#include "echo.generated.h"
void l_class_OC_EchoRequest__say(void *thisarg, unsigned int say_v) {
        l_class_OC_EchoRequest * thisp = (l_class_OC_EchoRequest *)thisarg;
}
bool l_class_OC_EchoRequest__say__RDY(void *thisarg) {
        l_class_OC_EchoRequest * thisp = (l_class_OC_EchoRequest *)thisarg;
        return 1;
}
void l_class_OC_EchoRequest::run()
{
    commit();
}
void l_class_OC_EchoRequest::commit()
{
}
void l_module_OC_Echo__respond_rule(void *thisarg) {
        l_module_OC_Echo * thisp = (l_module_OC_Echo *)thisarg;
        unsigned int temp;
        temp = thisp->fifo.out.first();
        thisp->fifo.out.deq();
        thisp->ind->heard(temp);
}
bool l_module_OC_Echo__respond_rule__RDY(void *thisarg) {
        l_module_OC_Echo * thisp = (l_module_OC_Echo *)thisarg;
        return ((thisp->fifo.out.first__RDY()) & (thisp->fifo.out.deq__RDY())) & (thisp->ind->heard__RDY());
}
void l_module_OC_Echo__say(void *thisarg, unsigned int say_v) {
        l_module_OC_Echo * thisp = (l_module_OC_Echo *)thisarg;
        thisp->fifo.in.enq(say_v);
}
bool l_module_OC_Echo__say__RDY(void *thisarg) {
        l_module_OC_Echo * thisp = (l_module_OC_Echo *)thisarg;
        return thisp->fifo.in.enq__RDY();
}
void l_module_OC_Echo::run()
{
    if (respond_rule__RDY()) respond_rule();
    fifo.run();
    commit();
}
void l_module_OC_Echo::commit()
{
    if (pipetemp_valid) pipetemp = pipetemp_shadow;
    pipetemp_valid = 0;
    fifo.commit();
}
void l_class_OC_EchoTest::run()
{
    echo.run();
    commit();
}
void l_class_OC_EchoTest::commit()
{
    if (x_valid) x = x_shadow;
    x_valid = 0;
    echo.commit();
}
