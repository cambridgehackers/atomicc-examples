#include "l_class_OC_foo.h"
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
