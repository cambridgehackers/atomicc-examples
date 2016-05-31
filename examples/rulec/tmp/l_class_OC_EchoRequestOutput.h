#ifndef __l_class_OC_EchoRequestOutput_H__
#define __l_class_OC_EchoRequestOutput_H__
#include "l_class_OC_EchoRequest.h"
#include "l_class_OC_PipeIn.h"
class l_class_OC_EchoRequestOutput;
extern void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern void l_class_OC_EchoRequestOutput__say2(void *thisarg, unsigned int say2_meth, unsigned int say2_v, unsigned int say2_v2);
extern bool l_class_OC_EchoRequestOutput__say2__RDY(void *thisarg);
extern bool l_class_OC_EchoRequestOutput__say__RDY(void *thisarg);
class l_class_OC_EchoRequestOutput {
public:
  l_class_OC_EchoRequest request;
  l_class_OC_PipeIn *pipe;
public:
  void run();
  void commit();
  l_class_OC_EchoRequestOutput():
      request(this, l_class_OC_EchoRequestOutput__say__RDY, l_class_OC_EchoRequestOutput__say, l_class_OC_EchoRequestOutput__say2__RDY, l_class_OC_EchoRequestOutput__say2) {
  }
  void setpipe(l_class_OC_PipeIn *v) { pipe = v; }
};
#endif  // __l_class_OC_EchoRequestOutput_H__
