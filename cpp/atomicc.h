#ifndef _ATOMICC_H_
#define _ATOMICC_H_

#include <vector>

template<class V>
class Action;
class Rule;
class Module;

template<class V>
class Action {
public:
  Action() {};
  virtual ~Action(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void body(V v) = 0;
  virtual void update() = 0;
};

class Rule {
public:
  Rule() {};
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
  virtual void setModule(Module *m) = 0;
};

class Module {
  //std::list<Rule*> rules;
 public:
  Module();
  virtual ~Module() {}
  void addRule(Rule *rule) {
    rule->setModule(this);
  }
};

#define RULE(moduletype,name,guardbody,bodybody,updatebody) \
  class name : public Rule {\
    moduletype *module;\
  public:\
    name(moduletype *module) : module(module) {module->addRule(this);} \
    void setModule(Module *m) { module = static_cast<moduletype *>(m); } \
    virtual bool guard() guardbody;\
    virtual void body() bodybody;\
    virtual void body(bool v) {};\
    void update() updatebody \
  } name ## Rule;

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
