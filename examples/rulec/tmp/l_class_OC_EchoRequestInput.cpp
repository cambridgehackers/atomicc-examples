#include "l_class_OC_EchoRequestInput.h"
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
