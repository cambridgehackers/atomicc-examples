#ifndef __ivector_GENERATED__H__
#define __ivector_GENERATED__H__
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
typedef struct {
  unsigned int a;
  unsigned int b;
  unsigned int c;
}l_struct_OC_ValuePair;
class l_class_OC_PipeIn_OC_1 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_ValuePair );
public:
  void enq(l_struct_OC_ValuePair v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_class_OC_PipeIn_OC_1(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_class_OC_PipeOut_OC_2 {
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
  l_class_OC_PipeOut_OC_2(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1_OC_3;
extern void l_class_OC_Fifo1_OC_3__deq(void *thisarg);
extern bool l_class_OC_Fifo1_OC_3__deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1_OC_3__enq(void *thisarg, l_struct_OC_ValuePair enq_v);
extern bool l_class_OC_Fifo1_OC_3__enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo1_OC_3__first(void *thisarg);
extern bool l_class_OC_Fifo1_OC_3__first__RDY(void *thisarg);
class l_class_OC_Fifo1_OC_3 {
public:
  l_class_OC_PipeIn_OC_1 in;
  l_class_OC_PipeOut_OC_2 out;
  l_struct_OC_ValuePair element;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1_OC_3():
      in(this, l_class_OC_Fifo1_OC_3__enq__RDY, l_class_OC_Fifo1_OC_3__enq),
      out(this, l_class_OC_Fifo1_OC_3__deq__RDY, l_class_OC_Fifo1_OC_3__deq, l_class_OC_Fifo1_OC_3__first__RDY, l_class_OC_Fifo1_OC_3__first) {
  }
};
class l_class_OC_FifoPong;
extern void l_class_OC_FifoPong__deq(void *thisarg);
extern bool l_class_OC_FifoPong__deq__RDY(void *thisarg);
extern void l_class_OC_FifoPong__enq(void *thisarg, l_struct_OC_ValuePair enq_v);
extern bool l_class_OC_FifoPong__enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_FifoPong__first(void *thisarg);
extern bool l_class_OC_FifoPong__first__RDY(void *thisarg);
class l_class_OC_FifoPong {
public:
  l_class_OC_PipeIn_OC_1 in;
  l_class_OC_PipeOut_OC_2 out;
  l_class_OC_Fifo1_OC_3 element1;
  l_class_OC_Fifo1_OC_3 element2;
  bool pong, pong_shadow; bool pong_valid;
public:
  void run();
  void commit();
  l_class_OC_FifoPong():
      in(this, l_class_OC_FifoPong__enq__RDY, l_class_OC_FifoPong__enq),
      out(this, l_class_OC_FifoPong__deq__RDY, l_class_OC_FifoPong__deq, l_class_OC_FifoPong__first__RDY, l_class_OC_FifoPong__first) {
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
class l_class_OC_IVectorRequest;
extern void l_class_OC_IVectorRequest__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_IVectorRequest__say__RDY(void *thisarg);
class l_class_OC_IVectorRequest {
public:
public:
  void run();
  void commit();
  void say(unsigned int say_meth, unsigned int say_v) { l_class_OC_IVectorRequest__say(this, say_meth, say_v); }
  bool say__RDY(void) { return l_class_OC_IVectorRequest__say__RDY(this); }
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
extern void l_class_OC_IVector__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_IVector__say__RDY(void *thisarg);
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
public:
  void run();
  void commit();
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
  void say(unsigned int say_meth, unsigned int say_v) { l_class_OC_IVector__say(this, say_meth, say_v); }
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
}l_struct_OC___block_descriptor;
#endif  // __ivector_GENERATED__H__
