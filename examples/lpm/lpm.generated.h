#ifndef __lpm_GENERATED__H__
#define __lpm_GENERATED__H__
class l_ainterface_OC_LpmIndication {
public:
  void *p;
  bool  (*heard__READYp) (void *);
  void  (*heardp) (void *, unsigned int , unsigned int );
public:
  void heard(unsigned int meth, unsigned int v) { heardp(p, meth, v); }
  bool heard__READY(void) { return heard__READYp(p); }
  l_ainterface_OC_LpmIndication(decltype(p) ap, decltype(heard__READYp) aheard__READYp, decltype(heardp) aheardp) {
    p = ap;
    heard__READYp = aheard__READYp;
    heardp = aheardp;
  }
};
class l_class_OC_foo;
extern void l_class_OC_foo__indication$heard(void *thisarg, unsigned int indication$heard_meth, unsigned int indication$heard_v);
extern bool l_class_OC_foo__indication$heard__READY(void *thisarg);
class l_class_OC_foo {
public:
  l_ainterface_OC_LpmIndication indication;
public:
  void run();
  void commit();
  l_class_OC_foo():
      indication(this, l_class_OC_foo__indication$heard__READY, l_class_OC_foo__indication$heard) {
  }
};
typedef struct {
  unsigned int a;
  unsigned int b;
  unsigned int c;
}l_struct_OC_ValuePair;
class l_ainterface_OC_PipeIn_OC_2 {
public:
  void *p;
  bool  (*enq__RDYp) (void *);
  void  (*enqp) (void *, l_struct_OC_ValuePair );
public:
  void enq(l_struct_OC_ValuePair v) { enqp(p, v); }
  bool enq__RDY(void) { return enq__RDYp(p); }
  l_ainterface_OC_PipeIn_OC_2(decltype(p) ap, decltype(enq__RDYp) aenq__RDYp, decltype(enqp) aenqp) {
    p = ap;
    enq__RDYp = aenq__RDYp;
    enqp = aenqp;
  }
};
class l_ainterface_OC_PipeOut_OC_3 {
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
  l_ainterface_OC_PipeOut_OC_3(decltype(p) ap, decltype(deq__RDYp) adeq__RDYp, decltype(deqp) adeqp, decltype(first__RDYp) afirst__RDYp, decltype(firstp) afirstp) {
    p = ap;
    deq__RDYp = adeq__RDYp;
    deqp = adeqp;
    first__RDYp = afirst__RDYp;
    firstp = afirstp;
  }
};
class l_class_OC_Fifo1_OC_0;
extern void l_class_OC_Fifo1_OC_0__out$deq(void *thisarg);
extern bool l_class_OC_Fifo1_OC_0__out$deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1_OC_0__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v);
extern bool l_class_OC_Fifo1_OC_0__in$enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo1_OC_0__out$first(void *thisarg);
extern bool l_class_OC_Fifo1_OC_0__out$first__RDY(void *thisarg);
class l_class_OC_Fifo1_OC_0 {
public:
  l_ainterface_OC_PipeIn_OC_2 in;
  l_ainterface_OC_PipeOut_OC_3 out;
  l_struct_OC_ValuePair element;
  bool full, full_shadow; bool full_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo1_OC_0():
      in(this, l_class_OC_Fifo1_OC_0__in$enq__RDY, l_class_OC_Fifo1_OC_0__in$enq),
      out(this, l_class_OC_Fifo1_OC_0__out$deq__RDY, l_class_OC_Fifo1_OC_0__out$deq, l_class_OC_Fifo1_OC_0__out$first__RDY, l_class_OC_Fifo1_OC_0__out$first) {
  }
};
class l_class_OC_Fifo2;
extern void l_class_OC_Fifo2__out$deq(void *thisarg);
extern bool l_class_OC_Fifo2__out$deq__RDY(void *thisarg);
extern void l_class_OC_Fifo2__in$enq(void *thisarg, l_struct_OC_ValuePair in$enq_v);
extern bool l_class_OC_Fifo2__in$enq__RDY(void *thisarg);
extern l_struct_OC_ValuePair l_class_OC_Fifo2__out$first(void *thisarg);
extern bool l_class_OC_Fifo2__out$first__RDY(void *thisarg);
class l_class_OC_Fifo2 {
public:
  l_ainterface_OC_PipeIn_OC_2 in;
  l_ainterface_OC_PipeOut_OC_3 out;
  l_struct_OC_ValuePair element0;
  l_struct_OC_ValuePair element1;
  l_struct_OC_ValuePair element2;
  unsigned int rindex, rindex_shadow; bool rindex_valid;
  unsigned int windex, windex_shadow; bool windex_valid;
public:
  void run();
  void commit();
  l_class_OC_Fifo2():
      in(this, l_class_OC_Fifo2__in$enq__RDY, l_class_OC_Fifo2__in$enq),
      out(this, l_class_OC_Fifo2__out$deq__RDY, l_class_OC_Fifo2__out$deq, l_class_OC_Fifo2__out$first__RDY, l_class_OC_Fifo2__out$first) {
  }
};
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
class l_ainterface_OC_LpmRequest {
public:
  void *p;
  bool  (*say__READYp) (void *);
  void  (*sayp) (void *, unsigned int , unsigned int );
public:
  void say(unsigned int meth, unsigned int v) { sayp(p, meth, v); }
  bool say__READY(void) { return say__READYp(p); }
  l_ainterface_OC_LpmRequest(decltype(p) ap, decltype(say__READYp) asay__READYp, decltype(sayp) asayp) {
    p = ap;
    say__READYp = asay__READYp;
    sayp = asayp;
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
extern void l_class_OC_Lpm__request$say(void *thisarg, unsigned int request$say_meth, unsigned int request$say_v);
extern bool l_class_OC_Lpm__request$say__READY(void *thisarg);
class l_class_OC_Lpm {
public:
  l_class_OC_Fifo1_OC_0 inQ;
  l_class_OC_Fifo2 fifo;
  l_class_OC_Fifo1_OC_0 outQ;
  l_class_OC_LpmMemory mem;
  unsigned int doneCount, doneCount_shadow; bool doneCount_valid;
  l_ainterface_OC_LpmIndication *indication;
  l_ainterface_OC_LpmRequest request;
public:
  void run();
  void commit();
  l_class_OC_Lpm():
      request(this, l_class_OC_Lpm__request$say__READY, l_class_OC_Lpm__request$say) {
  }
  void enter(void) { l_class_OC_Lpm__enter(this); }
  bool enter__RDY(void) { return l_class_OC_Lpm__enter__RDY(this); }
  void exit(void) { l_class_OC_Lpm__exit(this); }
  bool exit__RDY(void) { return l_class_OC_Lpm__exit__RDY(this); }
  void recirc(void) { l_class_OC_Lpm__recirc(this); }
  bool recirc__RDY(void) { return l_class_OC_Lpm__recirc__RDY(this); }
  void respond(void) { l_class_OC_Lpm__respond(this); }
  bool respond__RDY(void) { return l_class_OC_Lpm__respond__RDY(this); }
  void setindication(l_ainterface_OC_LpmIndication *v) { indication = v; }
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
#endif  // __lpm_GENERATED__H__
