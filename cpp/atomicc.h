#ifndef _ATOMICC_H_
#define _ATOMICC_H_

class Action {
public:
  Action() {};
  virtual ~Action(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
};

class Rule : public Action{
public:
  Rule() {};
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
};

class Module {
  //std::list<Rule*> rules;
 public:
  void addRule(Rule *rule) {
    rule->setModule(this);
  }
}

template<class T>
class Reg {
  T storage;
public:
  Reg();
  Reg(T v);
  T operator *() const { return storage; };
  operator T () const { return storage; };
  void operator =(T v) { storage = v; };
};

#endif
