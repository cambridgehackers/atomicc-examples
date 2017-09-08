#ifndef __rulec_GENERATED__H__
#define __rulec_GENERATED__H__
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
class l_ainterface_OC_EchoRequest {
public:
  void *p;
  bool  (*say__RDYp) (void *);
  void  (*sayp) (void *, unsigned int , unsigned int );
  bool  (*say2__RDYp) (void *);
  void  (*say2p) (void *, unsigned int , unsigned int , unsigned int );
public:
  void say(unsigned int meth, unsigned int v) { sayp(p, meth, v); }
  void say2(unsigned int meth, unsigned int v, unsigned int v2) { say2p(p, meth, v, v2); }
  bool say2__RDY(void) { return say2__RDYp(p); }
  bool say__RDY(void) { return say__RDYp(p); }
  l_ainterface_OC_EchoRequest(decltype(p) ap, decltype(say__RDYp) asay__RDYp, decltype(sayp) asayp, decltype(say2__RDYp) asay2__RDYp, decltype(say2p) asay2p) {
    p = ap;
    say__RDYp = asay__RDYp;
    sayp = asayp;
    say2__RDYp = asay2__RDYp;
    say2p = asay2p;
  }
};
class l_ainterface_OC_PipeIn {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_EchoRequest_data );
public:
  void enq(l_struct_OC_EchoRequest_data v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_ainterface_OC_PipeIn(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_module_OC_EchoRequestOutput;
extern void l_module_OC_EchoRequestOutput__request$say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v);
extern void l_module_OC_EchoRequestOutput__request$say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v, unsigned int request$say2_v2);
extern bool l_module_OC_EchoRequestOutput__request$say2__RDY(void *thisarg);
extern bool l_module_OC_EchoRequestOutput__request$say__RDY(void *thisarg);
class l_module_OC_EchoRequestOutput {
public:
  l_ainterface_OC_EchoRequest request;
  l_ainterface_OC_PipeIn *pipe;
public:
  void run();
  void commit();
  l_module_OC_EchoRequestOutput():
      request(this, l_module_OC_EchoRequestOutput__request$say__RDY, l_module_OC_EchoRequestOutput__request$say, l_module_OC_EchoRequestOutput__request$say2__RDY, l_module_OC_EchoRequestOutput__request$say2) {
  }
  void setpipe(l_ainterface_OC_PipeIn *v) { pipe = v; }
};
class l_module_OC_EchoRequestInput;
extern void l_module_OC_EchoRequestInput__pipe$enq(void *thisarg, l_struct_OC_EchoRequest_data pipe$enq_v);
extern bool l_module_OC_EchoRequestInput__pipe$enq__RDY(void *thisarg);
class l_module_OC_EchoRequestInput {
public:
  l_ainterface_OC_PipeIn pipe;
  l_ainterface_OC_EchoRequest *request;
public:
  void run();
  void commit();
  l_module_OC_EchoRequestInput():
      pipe(this, l_module_OC_EchoRequestInput__pipe$enq__RDY, l_module_OC_EchoRequestInput__pipe$enq) {
  }
  void setrequest(l_ainterface_OC_EchoRequest *v) { request = v; }
};
class l_ainterface_OC_EchoIndication {
public:
  void *p;
  bool  (*heard__RDYp) (void *);
  void  (*heardp) (void *, unsigned int , unsigned int );
public:
  void heard(unsigned int meth, unsigned int v) { heardp(p, meth, v); }
  bool heard__RDY(void) { return heard__RDYp(p); }
  l_ainterface_OC_EchoIndication(decltype(p) ap, decltype(heard__RDYp) aheard__RDYp, decltype(heardp) aheardp) {
    p = ap;
    heard__RDYp = aheard__RDYp;
    heardp = aheardp;
  }
};
class l_ainterface_OC_PipeIn_OC_0 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_EchoIndication_data );
public:
  void enq(l_struct_OC_EchoIndication_data v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_ainterface_OC_PipeIn_OC_0(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_module_OC_EchoIndicationOutput;
extern void l_module_OC_EchoIndicationOutput__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v);
extern bool l_module_OC_EchoIndicationOutput__indication$heard__RDY(void *thisarg);
extern void l_module_OC_EchoIndicationOutput__output_rulee(void *thisarg);
extern bool l_module_OC_EchoIndicationOutput__output_rulee__RDY(void *thisarg);
extern void l_module_OC_EchoIndicationOutput__output_ruleo(void *thisarg);
extern bool l_module_OC_EchoIndicationOutput__output_ruleo__RDY(void *thisarg);
class l_module_OC_EchoIndicationOutput {
public:
  l_ainterface_OC_EchoIndication indication;
  l_ainterface_OC_PipeIn_OC_0 *pipe;
  l_struct_OC_EchoIndication_data ind0;
  l_struct_OC_EchoIndication_data ind1;
  unsigned int ind_busy, ind_busy_shadow; bool ind_busy_valid;
  unsigned int even, even_shadow; bool even_valid;
public:
  void run();
  void commit();
  l_module_OC_EchoIndicationOutput():
      indication(this, l_module_OC_EchoIndicationOutput__indication$heard__RDY, l_module_OC_EchoIndicationOutput__indication$heard) {
  }
  void output_rulee(void) { l_module_OC_EchoIndicationOutput__output_rulee(this); }
  bool output_rulee__RDY(void) { return l_module_OC_EchoIndicationOutput__output_rulee__RDY(this); }
  void output_ruleo(void) { l_module_OC_EchoIndicationOutput__output_ruleo(this); }
  bool output_ruleo__RDY(void) { return l_module_OC_EchoIndicationOutput__output_ruleo__RDY(this); }
  void setpipe(l_ainterface_OC_PipeIn_OC_0 *v) { pipe = v; }
};
class l_module_OC_EchoIndicationInput;
extern void l_module_OC_EchoIndicationInput__pipe$enq(void *thisarg, l_struct_OC_EchoIndication_data pipe$enq_v);
extern bool l_module_OC_EchoIndicationInput__pipe$enq__RDY(void *thisarg);
extern void l_module_OC_EchoIndicationInput__input_rule(void *thisarg);
extern bool l_module_OC_EchoIndicationInput__input_rule__RDY(void *thisarg);
class l_module_OC_EchoIndicationInput {
public:
  l_ainterface_OC_PipeIn_OC_0 pipe;
  l_ainterface_OC_EchoIndication *indication;
  unsigned int busy_delay, busy_delay_shadow; bool busy_delay_valid;
  unsigned int meth_delay, meth_delay_shadow; bool meth_delay_valid;
  unsigned int v_delay, v_delay_shadow; bool v_delay_valid;
public:
  void run();
  void commit();
  l_module_OC_EchoIndicationInput():
      pipe(this, l_module_OC_EchoIndicationInput__pipe$enq__RDY, l_module_OC_EchoIndicationInput__pipe$enq) {
  }
  void input_rule(void) { l_module_OC_EchoIndicationInput__input_rule(this); }
  bool input_rule__RDY(void) { return l_module_OC_EchoIndicationInput__input_rule__RDY(this); }
  void setindication(l_ainterface_OC_EchoIndication *v) { indication = v; }
};
class l_module_OC_Echo;
extern void l_module_OC_Echo__delay_rule(void *thisarg);
extern bool l_module_OC_Echo__delay_rule__RDY(void *thisarg);
extern void l_module_OC_Echo__respond_rule(void *thisarg);
extern bool l_module_OC_Echo__respond_rule__RDY(void *thisarg);
extern void l_module_OC_Echo__request$say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v);
extern void l_module_OC_Echo__request$say2(void *thisarg, unsigned int request$say2_meth, unsigned int request$say2_v, unsigned int request$say2_v2);
extern bool l_module_OC_Echo__request$say2__RDY(void *thisarg);
extern bool l_module_OC_Echo__request$say__RDY(void *thisarg);
class l_module_OC_Echo {
public:
  l_ainterface_OC_EchoRequest request;
  unsigned int busy, busy_shadow; bool busy_valid;
  unsigned int meth_temp, meth_temp_shadow; bool meth_temp_valid;
  unsigned int v_temp, v_temp_shadow; bool v_temp_valid;
  unsigned int busy_delay, busy_delay_shadow; bool busy_delay_valid;
  unsigned int meth_delay, meth_delay_shadow; bool meth_delay_valid;
  unsigned int v_delay, v_delay_shadow; bool v_delay_valid;
  l_ainterface_OC_EchoIndication *indication;
public:
  void run();
  void commit();
  l_module_OC_Echo():
      request(this, l_module_OC_Echo__request$say__RDY, l_module_OC_Echo__request$say, l_module_OC_Echo__request$say2__RDY, l_module_OC_Echo__request$say2) {
  }
  void delay_rule(void) { l_module_OC_Echo__delay_rule(this); }
  bool delay_rule__RDY(void) { return l_module_OC_Echo__delay_rule__RDY(this); }
  void respond_rule(void) { l_module_OC_Echo__respond_rule(this); }
  bool respond_rule__RDY(void) { return l_module_OC_Echo__respond_rule__RDY(this); }
  void setindication(l_ainterface_OC_EchoIndication *v) { indication = v; }
};
class l_module_OC_foo;
extern void l_module_OC_foo__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v);
extern bool l_module_OC_foo__indication$heard__RDY(void *thisarg);
class l_module_OC_foo {
public:
  l_ainterface_OC_EchoIndication indication;
public:
  void run();
  void commit();
  l_module_OC_foo():
      indication(this, l_module_OC_foo__indication$heard__RDY, l_module_OC_foo__indication$heard) {
  }
};
class l_module_OC_Connect;
class l_module_OC_Connect {
public:
  l_module_OC_EchoIndicationOutput lEIO;
  l_module_OC_EchoRequestInput lERI;
  l_module_OC_Echo lEcho;
  l_module_OC_EchoRequestOutput lERO_test;
  l_module_OC_EchoIndicationInput lEII_test;
public:
  void run();
  void commit();
  l_module_OC_Connect() {
    lERO_test.pipe = &lERI.pipe;
    lEcho.indication = &lEIO.indication;
    lEIO.pipe = &lEII_test.pipe;
    lERI.request = &lEcho.request;
  }
};
typedef struct {
}l_struct_OC___block_descriptor;
#endif  // __rulec_GENERATED__H__
