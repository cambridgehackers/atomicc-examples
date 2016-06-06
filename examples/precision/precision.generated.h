#ifndef __precision_GENERATED__H__
#define __precision_GENERATED__H__
class l_class_OC_PipeIn {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, unsigned int );
public:
  void enq(unsigned int v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_class_OC_PipeIn(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_class_OC_PipeOut {
public:
  void *p;
  bool  (*deq__RDYp) (void *);
  void  (*deqp) (void *);
  bool  (*first__RDYp) (void *);
  unsigned int  (*firstp) (void *);
public:
  void deq(void) { deqp(p); }
  bool deq__RDY(void) { return deq__RDYp(p); }
  unsigned int first(void) { return firstp(p); }
  bool first__RDY(void) { return first__RDYp(p); }
  l_class_OC_PipeOut(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1;
extern void l_class_OC_Fifo1__deq(void *thisarg);
extern bool l_class_OC_Fifo1__deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1__enq(void *thisarg, unsigned int enq_v);
extern bool l_class_OC_Fifo1__enq__RDY(void *thisarg);
extern unsigned int l_class_OC_Fifo1__first(void *thisarg);
extern bool l_class_OC_Fifo1__first__RDY(void *thisarg);
class l_class_OC_Fifo1 {
public:
  l_class_OC_PipeIn in;
  l_class_OC_PipeOut out;
  unsigned int element, element_shadow; bool element_valid;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1():
      in(this, l_class_OC_Fifo1__enq__RDY, l_class_OC_Fifo1__enq),
      out(this, l_class_OC_Fifo1__deq__RDY, l_class_OC_Fifo1__deq, l_class_OC_Fifo1__first__RDY, l_class_OC_Fifo1__first) {
  }
};
class l_class_OC_IVectorIndication;
extern void l_class_OC_IVectorIndication__heard(void *thisarg, bool heard_meth, bool heard_v);
extern bool l_class_OC_IVectorIndication__heard__RDY(void *thisarg);
class l_class_OC_IVectorIndication {
public:
public:
  void run();
  void commit();
  void heard(bool heard_meth, bool heard_v) { l_class_OC_IVectorIndication__heard(this, heard_meth, heard_v); }
  bool heard__RDY(void) { return l_class_OC_IVectorIndication__heard__RDY(this); }
};
class l_class_OC_IVectorRequest;
extern void l_class_OC_IVectorRequest__say(void *thisarg, bool say_meth, bool say_v);
extern bool l_class_OC_IVectorRequest__say__RDY(void *thisarg);
class l_class_OC_IVectorRequest {
public:
public:
  void run();
  void commit();
  void say(bool say_meth, bool say_v) { l_class_OC_IVectorRequest__say(this, say_meth, say_v); }
  bool say__RDY(void) { return l_class_OC_IVectorRequest__say__RDY(this); }
};
typedef struct {
public:
  bool a, a_shadow; bool a_valid;
  bool b, b_shadow; bool b_valid;
}l_struct_OC_ValueType;
class l_class_OC_PipeIn_OC_2 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_ValueType );
public:
  void enq(l_struct_OC_ValueType v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_class_OC_PipeIn_OC_2(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_class_OC_PipeOut_OC_3 {
public:
  void *p;
  bool  (*deq__RDYp) (void *);
  void  (*deqp) (void *);
  bool  (*first__RDYp) (void *);
  l_struct_OC_ValueType  (*firstp) (void *);
public:
  void deq(void) { deqp(p); }
  bool deq__RDY(void) { return deq__RDYp(p); }
  l_struct_OC_ValueType first(void) { return firstp(p); }
  bool first__RDY(void) { return first__RDYp(p); }
  l_class_OC_PipeOut_OC_3(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1_OC_0;
extern void l_class_OC_Fifo1_OC_0__deq(void *thisarg);
extern bool l_class_OC_Fifo1_OC_0__deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1_OC_0__enq(void *thisarg, l_struct_OC_ValueType enq_v);
extern bool l_class_OC_Fifo1_OC_0__enq__RDY(void *thisarg);
extern l_struct_OC_ValueType l_class_OC_Fifo1_OC_0__first(void *thisarg);
extern bool l_class_OC_Fifo1_OC_0__first__RDY(void *thisarg);
class l_class_OC_Fifo1_OC_0 {
public:
  l_class_OC_PipeIn_OC_2 in;
  l_class_OC_PipeOut_OC_3 out;
  l_struct_OC_ValueType element;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1_OC_0():
      in(this, l_class_OC_Fifo1_OC_0__enq__RDY, l_class_OC_Fifo1_OC_0__enq),
      out(this, l_class_OC_Fifo1_OC_0__deq__RDY, l_class_OC_Fifo1_OC_0__deq, l_class_OC_Fifo1_OC_0__first__RDY, l_class_OC_Fifo1_OC_0__first) {
  }
};
class l_class_OC_IVector;
extern void l_class_OC_IVector__respond(void *thisarg);
extern bool l_class_OC_IVector__respond__RDY(void *thisarg);
extern void l_class_OC_IVector__say(void *thisarg, bool say_meth, bool say_v);
extern bool l_class_OC_IVector__say__RDY(void *thisarg);
class l_class_OC_IVector {
public:
  l_class_OC_Fifo1_OC_0 fifo;
  BITS fcounter;
  BITS1 counter;
  BITS14 gcounter;
  l_class_OC_IVectorIndication *ind;
public:
  void run();
  void commit();
  void respond(void) { l_class_OC_IVector__respond(this); }
  bool respond__RDY(void) { return l_class_OC_IVector__respond__RDY(this); }
  void say(bool say_meth, bool say_v) { l_class_OC_IVector__say(this, say_meth, say_v); }
  bool say__RDY(void) { return l_class_OC_IVector__say__RDY(this); }
  void setind(l_class_OC_IVectorIndication *v) { ind = v; }
};
class l_class_OC_IVectorTest;
class l_class_OC_IVectorTest {
public:
  l_class_OC_IVector ivector;
public:
  void run();
  void commit();
};
typedef struct {
public:
}l_struct_OC___block_descriptor;
#endif  // __precision_GENERATED__H__
