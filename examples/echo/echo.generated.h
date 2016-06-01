#ifndef __echo_GENERATED__H__
#define __echo_GENERATED__H__
class l_class_OC_EchoIndication;
extern void l_class_OC_EchoIndication__heard(void *thisarg, unsigned int heard_v);
extern bool l_class_OC_EchoIndication__heard__RDY(void *thisarg);
class l_class_OC_EchoIndication {
public:
public:
  void run();
  void commit();
  void heard(unsigned int heard_v) { l_class_OC_EchoIndication__heard(this, heard_v); }
  bool heard__RDY(void) { return l_class_OC_EchoIndication__heard__RDY(this); }
};
class l_class_OC_EchoRequest;
extern void l_class_OC_EchoRequest__say(void *thisarg, unsigned int say_v);
extern bool l_class_OC_EchoRequest__say__RDY(void *thisarg);
class l_class_OC_EchoRequest {
public:
public:
  void run();
  void commit();
  void say(unsigned int say_v) { l_class_OC_EchoRequest__say(this, say_v); }
  bool say__RDY(void) { return l_class_OC_EchoRequest__say__RDY(this); }
};
class l_class_OC_Echo;
extern void l_class_OC_Echo__respond_rule(void *thisarg);
extern bool l_class_OC_Echo__respond_rule__RDY(void *thisarg);
extern void l_class_OC_Echo__say(void *thisarg, unsigned int say_v);
extern bool l_class_OC_Echo__say__RDY(void *thisarg);
class l_class_OC_Echo {
public:
  l_class_OC_Fifo1 fifo;
  l_class_OC_EchoIndication *ind;
  unsigned int pipetemp, pipetemp_shadow; bool pipetemp_valid;
public:
  void run();
  void commit();
  void respond_rule(void) { l_class_OC_Echo__respond_rule(this); }
  bool respond_rule__RDY(void) { return l_class_OC_Echo__respond_rule__RDY(this); }
  void say(unsigned int say_v) { l_class_OC_Echo__say(this, say_v); }
  bool say__RDY(void) { return l_class_OC_Echo__say__RDY(this); }
  void setind(l_class_OC_EchoIndication *v) { ind = v; }
};
class l_class_OC_EchoTest;
class l_class_OC_EchoTest {
public:
  l_class_OC_Echo echo;
  unsigned int x, x_shadow; bool x_valid;
public:
  void run();
  void commit();
};
typedef struct {
public:
}l_struct_OC___block_descriptor;
#endif  // __echo_GENERATED__H__
