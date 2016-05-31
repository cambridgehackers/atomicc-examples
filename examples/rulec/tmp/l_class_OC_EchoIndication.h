#ifndef __l_class_OC_EchoIndication_H__
#define __l_class_OC_EchoIndication_H__
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
#endif  // __l_class_OC_EchoIndication_H__
