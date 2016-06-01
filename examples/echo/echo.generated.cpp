#include "echo.generated.h"
void l_class_OC_EchoIndication::run()
{
    commit();
}
void l_class_OC_EchoIndication::commit()
{
}
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
void l_class_OC_Echo__respond_rule(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        unsigned int call;
        unsigned int temp;
        call = thisp->fifo.out.first();
        temp = call;
        thisp->fifo.out.deq();
        thisp->ind->heard(temp);
}
bool l_class_OC_Echo__respond_rule__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        bool tmp__1;
        bool tmp__2;
        bool tmp__3;
        tmp__1 = thisp->fifo.out.first__RDY();
        tmp__2 = thisp->fifo.out.deq__RDY();
        tmp__3 = thisp->ind->heard__RDY();
        return (tmp__1 & tmp__2) & tmp__3;
}
void l_class_OC_Echo__say(void *thisarg, unsigned int say_v) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        thisp->fifo.in.enq(say_v);
}
bool l_class_OC_Echo__say__RDY(void *thisarg) {
        l_class_OC_Echo * thisp = (l_class_OC_Echo *)thisarg;
        bool tmp__1;
        tmp__1 = thisp->fifo.in.enq__RDY();
        return tmp__1;
}
void l_class_OC_Echo::run()
{
    if (respond_rule__RDY()) respond_rule();
    fifo.run();
    commit();
}
void l_class_OC_Echo::commit()
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
