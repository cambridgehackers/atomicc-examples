#ifndef __ivector_GENERATED__H__
#define __ivector_GENERATED__H__
typedef struct {
}l_struct_OC___block_descriptor;
class l_ainterface_OC_PipeIn {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, unsigned int );
public:
  void enq(unsigned int v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_ainterface_OC_PipeIn(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_ainterface_OC_PipeOut {
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
  l_ainterface_OC_PipeOut(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1;
extern void l_class_OC_Fifo1__out$deq(void *thisarg);
extern bool l_class_OC_Fifo1__out$deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1__in$enq(void *thisarg, unsigned int in$enq_v);
extern bool l_class_OC_Fifo1__in$enq__RDY(void *thisarg);
extern unsigned int l_class_OC_Fifo1__out$first(void *thisarg);
extern bool l_class_OC_Fifo1__out$first__RDY(void *thisarg);
class l_class_OC_Fifo1 {
public:
  l_ainterface_OC_PipeIn in;
  l_ainterface_OC_PipeOut out;
  unsigned int element, element_shadow; bool element_valid;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1():
      in(this, l_class_OC_Fifo1__in$enq__RDY, l_class_OC_Fifo1__in$enq),
      out(this, l_class_OC_Fifo1__out$deq__RDY, l_class_OC_Fifo1__out$deq, l_class_OC_Fifo1__out$first__RDY, l_class_OC_Fifo1__out$first) {
  }
};
typedef struct {
  unsigned int a;
  unsigned int b;
  unsigned int c;
}l_struct_OC_ValuePair;
class l_ainterface_OC_PipeIn_OC_1 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_ValuePair );
public:
  void enq(l_struct_OC_ValuePair v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_ainterface_OC_PipeIn_OC_1(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_ainterface_OC_PipeOut_OC_2 {
public:
  void *p;
  bool  (*deq__RDYp) (void *);
  void  (*deqp) (void *);
  bool  (*first__RDYp) (void *);
  l_struct_OC_ValuePair  (*firstp) (void *);
public:
  void deq(void) { deqp(p); }
  bool deq__RDY(void) { return deq__RDYp(p); }
  l_struct_OC_ValuePair first(void) { return firstp(p); }
  bool first__RDY(void) { return first__RDYp(p); }
  l_ainterface_OC_PipeOut_OC_2(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1_OC_3;
extern void l_class_OC_Fifo1_OC_3__out$deq(void *thisarg);
extern bool l_class_OC_Fifo1_OC_3__out$deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1_OC_3__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v);
extern bool l_class_OC_Fifo1_OC_3__in$enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo1_OC_3__out$first(void *thisarg);
extern bool l_class_OC_Fifo1_OC_3__out$first__RDY(void *thisarg);
class l_class_OC_Fifo1_OC_3 {
public:
  l_ainterface_OC_PipeIn_OC_1 in;
  l_ainterface_OC_PipeOut_OC_2 out;
  l_struct_OC_ValuePair element;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1_OC_3():
      in(this, l_class_OC_Fifo1_OC_3__in$enq__RDY, l_class_OC_Fifo1_OC_3__in$enq),
      out(this, l_class_OC_Fifo1_OC_3__out$deq__RDY, l_class_OC_Fifo1_OC_3__out$deq, l_class_OC_Fifo1_OC_3__out$first__RDY, l_class_OC_Fifo1_OC_3__out$first) {
  }
};
class l_class_OC_FifoPong;
extern void l_class_OC_FifoPong__out$deq(void *thisarg);
extern bool l_class_OC_FifoPong__out$deq__RDY(void *thisarg);
extern void l_class_OC_FifoPong__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v);
extern bool l_class_OC_FifoPong__in$enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_FifoPong__out$first(void *thisarg);
extern bool l_class_OC_FifoPong__out$first__RDY(void *thisarg);
class l_class_OC_FifoPong {
public:
  l_ainterface_OC_PipeIn_OC_1 in;
  l_ainterface_OC_PipeOut_OC_2 out;
  l_class_OC_Fifo1_OC_3 element1;
  l_class_OC_Fifo1_OC_3 element2;
  bool pong, pong_shadow; bool pong_valid;
public:
  void run();
  void commit();
  l_class_OC_FifoPong():
      in(this, l_class_OC_FifoPong__in$enq__RDY, l_class_OC_FifoPong__in$enq),
      out(this, l_class_OC_FifoPong__out$deq__RDY, l_class_OC_FifoPong__out$deq, l_class_OC_FifoPong__out$first__RDY, l_class_OC_FifoPong__out$first) {
  }
};
class l_class_OC_IVectorIndication;
extern void l_class_OC_IVectorIndication__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_class_OC_IVectorIndication__heard__RDY(void *thisarg);
class l_class_OC_IVectorIndication {
public:
public:
  void run();
  void commit();
  void heard(unsigned int heard_meth, unsigned int heard_v) { l_class_OC_IVectorIndication__heard(this, heard_meth, heard_v); }
  bool heard__RDY(void) { return l_class_OC_IVectorIndication__heard__RDY(this); }
};
class l_ainterface_OC_IVectorRequest {
public:
  void *p;
  bool  (*say__RDYp) (void *);
  void  (*sayp) (void *, unsigned int , unsigned int );
public:
  void say(unsigned int meth, unsigned int v) { sayp(p, meth, v); }
  bool say__RDY(void) { return say__RDYp(p); }
  l_ainterface_OC_IVectorRequest(decltype(p) ap, decltype(say__RDYp) asay__RDYp, decltype(sayp) asayp) {
    p = ap;
    say__RDYp = asay__RDYp;
    sayp = asayp;
  }
};
class l_class_OC_IVector;
extern void l_class_OC_IVector__respond0(void *thisarg);
extern bool l_class_OC_IVector__respond0__RDY(void *thisarg);
extern void l_class_OC_IVector__respond1(void *thisarg);
extern bool l_class_OC_IVector__respond1__RDY(void *thisarg);
extern void l_class_OC_IVector__respond2(void *thisarg);
extern bool l_class_OC_IVector__respond2__RDY(void *thisarg);
extern void l_class_OC_IVector__respond3(void *thisarg);
extern bool l_class_OC_IVector__respond3__RDY(void *thisarg);
extern void l_class_OC_IVector__respond4(void *thisarg);
extern bool l_class_OC_IVector__respond4__RDY(void *thisarg);
extern void l_class_OC_IVector__respond5(void *thisarg);
extern bool l_class_OC_IVector__respond5__RDY(void *thisarg);
extern void l_class_OC_IVector__respond6(void *thisarg);
extern bool l_class_OC_IVector__respond6__RDY(void *thisarg);
extern void l_class_OC_IVector__respond7(void *thisarg);
extern bool l_class_OC_IVector__respond7__RDY(void *thisarg);
extern void l_class_OC_IVector__respond8(void *thisarg);
extern bool l_class_OC_IVector__respond8__RDY(void *thisarg);
extern void l_class_OC_IVector__respond9(void *thisarg);
extern bool l_class_OC_IVector__respond9__RDY(void *thisarg);
extern void l_class_OC_IVector__in$say(void *thisarg, unsigned int in$say_meth, unsigned int in$say_v);
extern bool l_class_OC_IVector__in$say__RDY(void *thisarg);
class l_class_OC_IVector {
public:
  l_class_OC_FifoPong fifo0;
  l_class_OC_FifoPong fifo1;
  l_class_OC_FifoPong fifo2;
  l_class_OC_FifoPong fifo3;
  l_class_OC_FifoPong fifo4;
  l_class_OC_FifoPong fifo5;
  l_class_OC_FifoPong fifo6;
  l_class_OC_FifoPong fifo7;
  l_class_OC_FifoPong fifo8;
  l_class_OC_FifoPong fifo9;
  l_class_OC_FifoPong fifo10;
  l_class_OC_IVectorIndication *ind;
  unsigned int vsize, vsize_shadow; bool vsize_valid;
  l_ainterface_OC_IVectorRequest in;
public:
  void run();
  void commit();
  l_class_OC_IVector():
      in(this, l_class_OC_IVector__in$say__RDY, l_class_OC_IVector__in$say) {
  }
  void respond0(void) { l_class_OC_IVector__respond0(this); }
  bool respond0__RDY(void) { return l_class_OC_IVector__respond0__RDY(this); }
  void respond1(void) { l_class_OC_IVector__respond1(this); }
  bool respond1__RDY(void) { return l_class_OC_IVector__respond1__RDY(this); }
  void respond2(void) { l_class_OC_IVector__respond2(this); }
  bool respond2__RDY(void) { return l_class_OC_IVector__respond2__RDY(this); }
  void respond3(void) { l_class_OC_IVector__respond3(this); }
  bool respond3__RDY(void) { return l_class_OC_IVector__respond3__RDY(this); }
  void respond4(void) { l_class_OC_IVector__respond4(this); }
  bool respond4__RDY(void) { return l_class_OC_IVector__respond4__RDY(this); }
  void respond5(void) { l_class_OC_IVector__respond5(this); }
  bool respond5__RDY(void) { return l_class_OC_IVector__respond5__RDY(this); }
  void respond6(void) { l_class_OC_IVector__respond6(this); }
  bool respond6__RDY(void) { return l_class_OC_IVector__respond6__RDY(this); }
  void respond7(void) { l_class_OC_IVector__respond7(this); }
  bool respond7__RDY(void) { return l_class_OC_IVector__respond7__RDY(this); }
  void respond8(void) { l_class_OC_IVector__respond8(this); }
  bool respond8__RDY(void) { return l_class_OC_IVector__respond8__RDY(this); }
  void respond9(void) { l_class_OC_IVector__respond9(this); }
  bool respond9__RDY(void) { return l_class_OC_IVector__respond9__RDY(this); }
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
#endif  // __ivector_GENERATED__H__
