#ifndef __l_class_OC_PipeIn_OC_0_H__
#define __l_class_OC_PipeIn_OC_0_H__
#include "l_struct_OC_EchoIndication_data.h"
class l_class_OC_PipeIn_OC_0 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_EchoIndication_data );
public:
  void enq(l_struct_OC_EchoIndication_data v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_class_OC_PipeIn_OC_0(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
#endif  // __l_class_OC_PipeIn_OC_0_H__
