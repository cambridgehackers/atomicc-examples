#ifndef _ATOMICC_H_
#define _ATOMICC_H_

class Rule {
public:
  Rule() {};
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
};

template<class T>
class Reg {
  T storage;
public:
  Reg();
  T read();
  void write(T v);
};

#endif
