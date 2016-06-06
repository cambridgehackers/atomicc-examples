#ifndef __connect_GENERATED__H__
#define __connect_GENERATED__H__
typedef struct {
public:
  unsigned int a;
  unsigned int b;
}l_struct_OC_ValueType;
typedef struct {
public:
  unsigned int meth;
  unsigned int v;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say;
typedef struct {
public:
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say say;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union;
typedef struct {
public:
  unsigned int tag;
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union data;
}l_struct_OC_EchoRequest_data;
typedef struct {
public:
  unsigned int meth;
  unsigned int v;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard;
typedef struct {
public:
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard heard;
}l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union;
typedef struct {
public:
  unsigned int tag;
  l_struct_OC__IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union data;
}l_struct_OC_EchoIndication_data;
class l_class_OC_EchoRequest {
public:
  void *p;
  bool  (*say__RDYp) (void *);
  void  (*sayp) (void *, unsigned int , unsigned int );
public:
  void say(unsigned int meth, unsigned int v) { sayp(p, meth, v); }
  bool say__RDY(void) { return say__RDYp(p); }
  l_class_OC_EchoRequest(decltype(p) ap, decltype(say__RDYp) asay__RDYp, decltype(sayp) asayp) {
    p = ap;
    say__RDYp = asay__RDYp;
    sayp = asayp;
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
extern void l_class_OC_EchoRequestOutput__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_EchoRequestOutput__say__RDY(void *thisarg);
class l_class_OC_EchoRequestOutput {
public:
  l_class_OC_EchoRequest request;
  l_class_OC_PipeIn *pipe;
public:
  void run();
  void commit();
  l_class_OC_EchoRequestOutput():
      request(this, l_class_OC_EchoRequestOutput__say__RDY, l_class_OC_EchoRequestOutput__say) {
  }
  void setpipe(l_class_OC_PipeIn *v) { pipe = v; }
};
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
extern void l_class_OC_EchoIndicationOutput__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_class_OC_EchoIndicationOutput__heard__RDY(void *thisarg);
class l_class_OC_EchoIndicationOutput {
public:
  l_class_OC_EchoIndication indication;
  l_class_OC_PipeIn_OC_0 *pipe;
public:
  void run();
  void commit();
  l_class_OC_EchoIndicationOutput():
      indication(this, l_class_OC_EchoIndicationOutput__heard__RDY, l_class_OC_EchoIndicationOutput__heard) {
  }
  void setpipe(l_class_OC_PipeIn_OC_0 *v) { pipe = v; }
};
class l_class_OC_EchoIndicationInput;
extern void l_class_OC_EchoIndicationInput__enq(void *thisarg, l_struct_OC_EchoIndication_data enq_v);
extern bool l_class_OC_EchoIndicationInput__enq__RDY(void *thisarg);
class l_class_OC_EchoIndicationInput {
public:
  l_class_OC_PipeIn_OC_0 pipe;
  l_class_OC_EchoIndication *indication;
public:
  void run();
  void commit();
  l_class_OC_EchoIndicationInput():
      pipe(this, l_class_OC_EchoIndicationInput__enq__RDY, l_class_OC_EchoIndicationInput__enq) {
  }
  void setindication(l_class_OC_EchoIndication *v) { indication = v; }
};
class l_class_OC_Echo;
extern void l_class_OC_Echo__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_Echo__say__RDY(void *thisarg);
class l_class_OC_Echo {
public:
  l_class_OC_EchoRequest request;
  l_class_OC_EchoIndication *indication;
public:
  void run();
  void commit();
  l_class_OC_Echo():
      request(this, l_class_OC_Echo__say__RDY, l_class_OC_Echo__say) {
  }
  void setindication(l_class_OC_EchoIndication *v) { indication = v; }
};
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
class l_class_OC_Connect;
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
};
#endif  // __connect_GENERATED__H__
