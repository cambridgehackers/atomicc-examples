#ifndef __fifo_GENERATED__H__
#define __fifo_GENERATED__H__
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
extern void l_class_OC_Fifo1__out$deq(void *thisarg);
extern bool l_class_OC_Fifo1__out$deq__RDY(void *thisarg);
extern void l_class_OC_Fifo1__in$enq(void *thisarg, unsigned int in$enq_v);
extern bool l_class_OC_Fifo1__in$enq__RDY(void *thisarg);
extern unsigned int l_class_OC_Fifo1__out$first(void *thisarg);
extern bool l_class_OC_Fifo1__out$first__RDY(void *thisarg);
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
      in(this, l_class_OC_Fifo1__in$enq__RDY, l_class_OC_Fifo1__in$enq),
      out(this, l_class_OC_Fifo1__out$deq__RDY, l_class_OC_Fifo1__out$deq, l_class_OC_Fifo1__out$first__RDY, l_class_OC_Fifo1__out$first) {
  }
};
#endif  // __fifo_GENERATED__H__
