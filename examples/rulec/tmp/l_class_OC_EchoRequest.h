#ifndef __l_class_OC_EchoRequest_H__
#define __l_class_OC_EchoRequest_H__
class l_class_OC_EchoRequest {
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
  l_class_OC_EchoRequest(decltype(p) ap, decltype(say__RDYp) asay__RDYp, decltype(sayp) asayp, decltype(say2__RDYp) asay2__RDYp, decltype(say2p) asay2p) {
    p = ap;
    say__RDYp = asay__RDYp;
    sayp = asayp;
    say2__RDYp = asay2__RDYp;
    say2p = asay2p;
  }
};
#endif  // __l_class_OC_EchoRequest_H__
