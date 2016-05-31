#ifndef __l_class_OC_EchoIndicationOutput_H__
#define __l_class_OC_EchoIndicationOutput_H__
#include "l_class_OC_EchoIndication.h"
#include "l_class_OC_PipeIn_OC_0.h"
#include "l_struct_OC_EchoIndication_data.h"
class l_class_OC_EchoIndicationOutput;
extern void l_class_OC_EchoIndicationOutput__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_class_OC_EchoIndicationOutput__heard__RDY(void *thisarg);
extern void l_class_OC_EchoIndicationOutput__output_rulee(void *thisarg);
extern bool l_class_OC_EchoIndicationOutput__output_rulee__RDY(void *thisarg);
extern void l_class_OC_EchoIndicationOutput__output_ruleo(void *thisarg);
extern bool l_class_OC_EchoIndicationOutput__output_ruleo__RDY(void *thisarg);
class l_class_OC_EchoIndicationOutput {
public:
  l_class_OC_EchoIndication indication;
  l_class_OC_PipeIn_OC_0 *pipe;
  l_struct_OC_EchoIndication_data ind0;
  l_struct_OC_EchoIndication_data ind1;
  unsigned int ind_busy, ind_busy_shadow; bool ind_busy_valid;
  unsigned int even, even_shadow; bool even_valid;
public:
  void run();
  void commit();
  l_class_OC_EchoIndicationOutput():
      indication(this, l_class_OC_EchoIndicationOutput__heard__RDY, l_class_OC_EchoIndicationOutput__heard) {
  }
  void output_rulee(void) { l_class_OC_EchoIndicationOutput__output_rulee(this); }
  bool output_rulee__RDY(void) { return l_class_OC_EchoIndicationOutput__output_rulee__RDY(this); }
  void output_ruleo(void) { l_class_OC_EchoIndicationOutput__output_ruleo(this); }
  bool output_ruleo__RDY(void) { return l_class_OC_EchoIndicationOutput__output_ruleo__RDY(this); }
  void setpipe(l_class_OC_PipeIn_OC_0 *v) { pipe = v; }
};
#endif  // __l_class_OC_EchoIndicationOutput_H__
