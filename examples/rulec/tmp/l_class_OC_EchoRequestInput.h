#ifndef __l_class_OC_EchoRequestInput_H__
#define __l_class_OC_EchoRequestInput_H__
#include "l_class_OC_EchoRequest.h"
#include "l_class_OC_PipeIn.h"
#include "l_struct_OC_EchoRequest_data.h"
class l_class_OC_EchoRequestInput;
extern void l_class_OC_EchoRequestInput__enq(void *thisarg, l_struct_OC_EchoRequest_data enq_v);
extern bool l_class_OC_EchoRequestInput__enq__RDY(void *thisarg);
class l_class_OC_EchoRequestInput {
public:
  l_class_OC_PipeIn pipe;
  l_class_OC_EchoRequest *request;
public:
  void run();
  void commit();
  l_class_OC_EchoRequestInput():
      pipe(this, l_class_OC_EchoRequestInput__enq__RDY, l_class_OC_EchoRequestInput__enq) {
  }
  void setrequest(l_class_OC_EchoRequest *v) { request = v; }
};
#endif  // __l_class_OC_EchoRequestInput_H__
