#ifndef __lpm_GENERATED__H__
#define __lpm_GENERATED__H__
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
class l_class_OC_LpmRequest;
extern void l_class_OC_LpmRequest__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_LpmRequest__say__READY(void *thisarg);
class l_class_OC_LpmRequest {
public:
public:
  void run();
  void commit();
  void say(unsigned int say_meth, unsigned int say_v) { l_class_OC_LpmRequest__say(this, say_meth, say_v); }
  bool say__READY(void) { return l_class_OC_LpmRequest__say__READY(this); }
};
typedef struct {
  unsigned int a;
  unsigned int b;
  unsigned int c;
}l_struct_OC_ValuePair;
class l_class_OC_LpmMemory;
extern void l_class_OC_LpmMemory__memdelay(void *thisarg);
extern bool l_class_OC_LpmMemory__memdelay__RDY(void *thisarg);
extern void l_class_OC_LpmMemory__req(void *thisarg, unsigned int req_v_2e_coerce0, unsigned int req_v_2e_coerce1, unsigned int req_v_2e_coerce2);
extern bool l_class_OC_LpmMemory__req__RDY(void *thisarg);
extern void l_class_OC_LpmMemory__resAccept(void *thisarg);
extern bool l_class_OC_LpmMemory__resAccept__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_LpmMemory__resValue(void *thisarg);
extern bool l_class_OC_LpmMemory__resValue__RDY(void *thisarg);
class l_class_OC_LpmMemory {
public:
  unsigned int delayCount, delayCount_shadow; bool delayCount_valid;
  l_struct_OC_ValuePair saved;
public:
  void run();
  void commit();
  void memdelay(void) { l_class_OC_LpmMemory__memdelay(this); }
  bool memdelay__RDY(void) { return l_class_OC_LpmMemory__memdelay__RDY(this); }
  void req(unsigned int req_v_2e_coerce0, unsigned int req_v_2e_coerce1, unsigned int req_v_2e_coerce2) { l_class_OC_LpmMemory__req(this, req_v_2e_coerce0, req_v_2e_coerce1, req_v_2e_coerce2); }
  bool req__RDY(void) { return l_class_OC_LpmMemory__req__RDY(this); }
  void resAccept(void) { l_class_OC_LpmMemory__resAccept(this); }
  bool resAccept__RDY(void) { return l_class_OC_LpmMemory__resAccept__RDY(this); }
  l_struct_OC_ValuePair resValue(void) { return l_class_OC_LpmMemory__resValue(this); }
  bool resValue__RDY(void) { return l_class_OC_LpmMemory__resValue__RDY(this); }
};
class l_class_OC_PipeIn_OC_2 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_ValuePair );
public:
  void enq(l_struct_OC_ValuePair v) { enqp(p, v); }
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
  l_struct_OC_ValuePair  (*firstp) (void *);
public:
  void deq(void) { deqp(p); }
  bool deq__RDY(void) { return deq__RDYp(p); }
  l_struct_OC_ValuePair first(void) { return firstp(p); }
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
extern void l_class_OC_Fifo1_OC_0__enq(void *thisarg, l_struct_OC_ValuePair enq_v);
extern bool l_class_OC_Fifo1_OC_0__enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo1_OC_0__first(void *thisarg);
extern bool l_class_OC_Fifo1_OC_0__first__RDY(void *thisarg);
class l_class_OC_Fifo1_OC_0 {
public:
  l_class_OC_PipeIn_OC_2 in;
  l_class_OC_PipeOut_OC_3 out;
  l_struct_OC_ValuePair element;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1_OC_0():
      in(this, l_class_OC_Fifo1_OC_0__enq__RDY, l_class_OC_Fifo1_OC_0__enq),
      out(this, l_class_OC_Fifo1_OC_0__deq__RDY, l_class_OC_Fifo1_OC_0__deq, l_class_OC_Fifo1_OC_0__first__RDY, l_class_OC_Fifo1_OC_0__first) {
  }
};
class l_class_OC_Fifo2;
extern void l_class_OC_Fifo2__deq(void *thisarg);
extern bool l_class_OC_Fifo2__deq__RDY(void *thisarg);
extern void l_class_OC_Fifo2__enq(void *thisarg, l_struct_OC_ValuePair enq_v);
extern bool l_class_OC_Fifo2__enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo2__first(void *thisarg);
extern bool l_class_OC_Fifo2__first__RDY(void *thisarg);
class l_class_OC_Fifo2 {
public:
  l_class_OC_PipeIn_OC_2 in;
  l_class_OC_PipeOut_OC_3 out;
  l_struct_OC_ValuePair element0;
  l_struct_OC_ValuePair element1;
  l_struct_OC_ValuePair element2;
  unsigned int rindex, rindex_shadow; bool rindex_valid;
  unsigned int windex, windex_shadow; bool windex_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo2():
      in(this, l_class_OC_Fifo2__enq__RDY, l_class_OC_Fifo2__enq),
      out(this, l_class_OC_Fifo2__deq__RDY, l_class_OC_Fifo2__deq, l_class_OC_Fifo2__first__RDY, l_class_OC_Fifo2__first) {
  }
};
class l_class_OC_LpmIndication {
public:
  void *p;
  bool  (*heard__READYp) (void *);
  void  (*heardp) (void *, unsigned int , unsigned int );
public:
  void heard(unsigned int meth, unsigned int v) { heardp(p, meth, v); }
  bool heard__READY(void) { return heard__READYp(p); }
  l_class_OC_LpmIndication(decltype(p) ap, decltype(heard__READYp) aheard__READYp, decltype(heardp) aheardp) {
    p = ap;
    heard__READYp = aheard__READYp;
    heardp = aheardp;
  }
};
class l_class_OC_Lpm;
extern void l_class_OC_Lpm__enter(void *thisarg);
extern bool l_class_OC_Lpm__enter__RDY(void *thisarg);
extern void l_class_OC_Lpm__exit(void *thisarg);
extern bool l_class_OC_Lpm__exit__RDY(void *thisarg);
extern void l_class_OC_Lpm__recirc(void *thisarg);
extern bool l_class_OC_Lpm__recirc__RDY(void *thisarg);
extern void l_class_OC_Lpm__respond(void *thisarg);
extern bool l_class_OC_Lpm__respond__RDY(void *thisarg);
extern void l_class_OC_Lpm__say(void *thisarg, unsigned int say_meth, unsigned int say_v);
extern bool l_class_OC_Lpm__say__READY(void *thisarg);
class l_class_OC_Lpm {
public:
  l_class_OC_Fifo1_OC_0 inQ;
  l_class_OC_Fifo2 fifo;
  l_class_OC_Fifo1_OC_0 outQ;
  l_class_OC_LpmMemory mem;
  unsigned int doneCount, doneCount_shadow; bool doneCount_valid;
  l_class_OC_LpmIndication *indication;
public:
  void run();
  void commit();
  void enter(void) { l_class_OC_Lpm__enter(this); }
  bool enter__RDY(void) { return l_class_OC_Lpm__enter__RDY(this); }
  void exit(void) { l_class_OC_Lpm__exit(this); }
  bool exit__RDY(void) { return l_class_OC_Lpm__exit__RDY(this); }
  void recirc(void) { l_class_OC_Lpm__recirc(this); }
  bool recirc__RDY(void) { return l_class_OC_Lpm__recirc__RDY(this); }
  void respond(void) { l_class_OC_Lpm__respond(this); }
  bool respond__RDY(void) { return l_class_OC_Lpm__respond__RDY(this); }
  void say(unsigned int say_meth, unsigned int say_v) { l_class_OC_Lpm__say(this, say_meth, say_v); }
  bool say__READY(void) { return l_class_OC_Lpm__say__READY(this); }
  void setindication(l_class_OC_LpmIndication *v) { indication = v; }
};
class l_class_OC_foo;
extern void l_class_OC_foo__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_class_OC_foo__heard__READY(void *thisarg);
class l_class_OC_foo {
public:
  l_class_OC_LpmIndication indication;
public:
  void run();
  void commit();
  l_class_OC_foo():
      indication(this, l_class_OC_foo__heard__READY, l_class_OC_foo__heard) {
  }
};
class l_class_OC_LpmTest;
class l_class_OC_LpmTest {
public:
  l_class_OC_Lpm lpm;
public:
  void run();
  void commit();
};
typedef struct {
}l_struct_OC___block_descriptor;
#endif  // __lpm_GENERATED__H__
