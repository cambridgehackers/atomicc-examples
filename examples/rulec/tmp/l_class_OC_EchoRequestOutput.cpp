#include "l_class_OC_EchoRequestOutput.h"
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
