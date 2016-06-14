#ifndef __before1_GENERATED__H__
#define __before1_GENERATED__H__
typedef struct {
  unsigned int a;
  unsigned int b;
}l_struct_OC_ValueType;
typedef struct {
  unsigned int meth;
  unsigned int v;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say;
typedef struct {
  unsigned int meth;
  unsigned int v;
  unsigned int v2;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say2;
typedef struct {
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say say;
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say2 say2;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union;
typedef struct {
  unsigned int tag;
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union data;
}l_struct_OC_EchoRequest_data;
typedef struct {
  unsigned int meth;
  unsigned int v;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard;
typedef struct {
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard heard;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union;
typedef struct {
  unsigned int tag;
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union data;
}l_struct_OC_EchoIndication_data;
class l_class_OC_EchoRequest {
public:
  void *p;
  bool  (*say__RDYp) (void *);
  void  (*sayp) (void *, unsigned int , unsigned int );
  bool  (*say2__RDYp) (void *);
  void  (*say2p) (void *, unsigned int , unsigned int );
public:
  void say(unsigned int meth, unsigned int v) { sayp(p, meth, v); }
  void say2(unsigned int meth, unsigned int v) { say2p(p, meth, v); }
  bool say2__RDY(void) { return say2__RDYp(p); }
  bool say__RDY(void) { return say__RDYp(p); }
  l_class_OC_EchoRequest(decltype(p) ap, decltype(say__RDYp) asay__RDYp, decltype(sayp) asayp, decltype(say2__RDYp) asay2__RDYp, decltype(say2p) asay2p) {
    p = ap;
    say__RDYp = asay__RDYp;
    sayp = asayp;
    say2__RDYp = asay2__RDYp;
    say2p = asay2p;
  }
};
class l_class_OC_PipeIn {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_EchoRequest_data );
public:
  void enq(l_struct_OC_EchoRequest_data v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_class_OC_PipeIn(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_class_OC_EchoRequestOutput;
extern void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v);
extern void l_class_OC_EchoRequestOutput__say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v);
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
class l_class_OC_EchoRequestInput;
extern void l_class_OC_EchoRequestInput__enq(void *thisarg, l_struct_OC_EchoRequest_data pipe$enq_v);
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
class l_class_OC_EchoIndication {
public:
  void *p;
  bool  (*heard__RDYp) (void *);
  void  (*heardp) (void *, unsigned int , unsigned int );
public:
  void heard(unsigned int meth, unsigned int v) { heardp(p, meth, v); }
  bool heard__RDY(void) { return heard__RDYp(p); }
  l_class_OC_EchoIndication(decltype(p) ap, decltype(heard__RDYp) aheard__RDYp, decltype(heardp) aheardp) {
    p = ap;
    heard__RDYp = aheard__RDYp;
    heardp = aheardp;
  }
};
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
class l_class_OC_EchoIndicationOutput;
extern void l_class_OC_EchoIndicationOutput__heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v);
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
class l_class_OC_EchoIndicationInput;
extern void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data pipe$enq_v);
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
class l_class_OC_Echo;
extern void l_class_OC_Echo__delay_rule(void *thisarg);
extern bool l_class_OC_Echo__delay_rule__RDY(void *thisarg);
extern void l_class_OC_Echo__respond_rule(void *thisarg);
extern bool l_class_OC_Echo__respond_rule__RDY(void *thisarg);
extern void l_class_OC_Echo__say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v);
extern void l_class_OC_Echo__say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v);
extern bool l_class_OC_Echo__say2__RDY(void *thisarg);
extern bool l_class_OC_Echo__say__RDY(void *thisarg);
extern void l_class_OC_Echo__x2y(void *thisarg);
extern bool l_class_OC_Echo__x2y__RDY(void *thisarg);
extern void l_class_OC_Echo__y2x(void *thisarg);
extern bool l_class_OC_Echo__y2x__RDY(void *thisarg);
extern void l_class_OC_Echo__y2xnull(void *thisarg);
extern bool l_class_OC_Echo__y2xnull__RDY(void *thisarg);
class l_class_OC_Echo {
public:
  l_class_OC_EchoRequest request;
  unsigned int busy, busy_shadow; bool busy_valid;
  unsigned int meth_temp, meth_temp_shadow; bool meth_temp_valid;
  unsigned int v_temp, v_temp_shadow; bool v_temp_valid;
  unsigned int busy_delay, busy_delay_shadow; bool busy_delay_valid;
  unsigned int meth_delay, meth_delay_shadow; bool meth_delay_valid;
  unsigned int v_delay, v_delay_shadow; bool v_delay_valid;
  unsigned int x, x_shadow; bool x_valid;
  unsigned int y, y_shadow; bool y_valid;
  l_class_OC_EchoIndication *indication;
public:
  void run();
  void commit();
  l_class_OC_Echo():
      request(this, l_class_OC_Echo__say__RDY, l_class_OC_Echo__say, l_class_OC_Echo__say2__RDY, l_class_OC_Echo__say2) {
  }
  void delay_rule(void) { l_class_OC_Echo__delay_rule(this); }
  bool delay_rule__RDY(void) { return l_class_OC_Echo__delay_rule__RDY(this); }
  void respond_rule(void) { l_class_OC_Echo__respond_rule(this); }
  bool respond_rule__RDY(void) { return l_class_OC_Echo__respond_rule__RDY(this); }
  void x2y(void) { l_class_OC_Echo__x2y(this); }
  bool x2y__RDY(void) { return l_class_OC_Echo__x2y__RDY(this); }
  void y2x(void) { l_class_OC_Echo__y2x(this); }
  bool y2x__RDY(void) { return l_class_OC_Echo__y2x__RDY(this); }
  void y2xnull(void) { l_class_OC_Echo__y2xnull(this); }
  bool y2xnull__RDY(void) { return l_class_OC_Echo__y2xnull__RDY(this); }
  void setindication(l_class_OC_EchoIndication *v) { indication = v; }
};
class l_class_OC_foo;
extern void l_class_OC_foo__heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v);
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
class l_class_OC_Connect;
extern void l_class_OC_Connect__swap2_rule(void *thisarg);
extern bool l_class_OC_Connect__swap2_rule__RDY(void *thisarg);
extern void l_class_OC_Connect__swap_rule(void *thisarg);
extern bool l_class_OC_Connect__swap_rule__RDY(void *thisarg);
class l_class_OC_Connect {
public:
  l_class_OC_EchoIndicationOutput lEIO;
  l_class_OC_EchoRequestInput lERI;
  l_class_OC_Echo lEcho;
  l_class_OC_EchoRequestOutput lERO_test;
  l_class_OC_EchoIndicationInput lEII_test;
public:
  void run();
  void commit();
  l_class_OC_Connect() {
    lERO_test.pipe = &lERI.pipe;
    lEcho.indication = &lEIO.indication;
    lEIO.pipe = &lEII_test.pipe;
    lERI.request = &lEcho.request;
  }
  void swap2_rule(void) { l_class_OC_Connect__swap2_rule(this); }
  bool swap2_rule__RDY(void) { return l_class_OC_Connect__swap2_rule__RDY(this); }
  void swap_rule(void) { l_class_OC_Connect__swap_rule(this); }
  bool swap_rule__RDY(void) { return l_class_OC_Connect__swap_rule__RDY(this); }
};
typedef struct {
}l_struct_OC___block_descriptor;
#endif  // __before1_GENERATED__H__
