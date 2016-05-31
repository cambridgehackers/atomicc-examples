#ifndef __l_class_OC_foo_H__
#define __l_class_OC_foo_H__
#include "l_class_OC_EchoIndication.h"
class l_class_OC_foo;
extern void l_class_OC_foo__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_class_OC_foo__heard__RDY(void *thisarg);
class l_class_OC_foo {
public:
  l_class_OC_EchoIndication indication;
public:
  void run();
  void commit();
  l_class_OC_foo():
      indication(this, l_class_OC_foo__heard__RDY, l_class_OC_foo__heard) {
  }
};
#endif  // __l_class_OC_foo_H__
