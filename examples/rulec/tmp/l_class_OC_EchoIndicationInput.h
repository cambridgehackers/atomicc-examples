#ifndef __l_class_OC_EchoIndicationInput_H__
#define __l_class_OC_EchoIndicationInput_H__
#include "l_class_OC_EchoIndication.h"
#include "l_class_OC_PipeIn_OC_0.h"
#include "l_struct_OC_EchoIndication_data.h"
class l_class_OC_EchoIndicationInput;
extern void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data enq_v);
extern bool l_class_OC_EchoIndicationInput__enq__RDY(void *thisarg);
extern void l_class_OC_EchoIndicationInput__input_rule(void *thisarg);
extern bool l_class_OC_EchoIndicationInput__input_rule__RDY(void *thisarg);
class l_class_OC_EchoIndicationInput {
public:
  l_class_OC_PipeIn_OC_0 pipe;
  l_class_OC_EchoIndication *indication;
  unsigned int busy_delay, busy_delay_shadow; bool busy_delay_valid;
  unsigned int meth_delay, meth_delay_shadow; bool meth_delay_valid;
  unsigned int v_delay, v_delay_shadow; bool v_delay_valid;
public:
  void run();
  void commit();
  l_class_OC_EchoIndicationInput():
      pipe(this, l_class_OC_EchoIndicationInput__enq__RDY, l_class_OC_EchoIndicationInput__enq) {
  }
  void input_rule(void) { l_class_OC_EchoIndicationInput__input_rule(this); }
  bool input_rule__RDY(void) { return l_class_OC_EchoIndicationInput__input_rule__RDY(this); }
  void setindication(l_class_OC_EchoIndication *v) { indication = v; }
};
#endif  // __l_class_OC_EchoIndicationInput_H__
