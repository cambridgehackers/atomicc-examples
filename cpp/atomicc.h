#ifndef _ATOMICC_H_
#define _ATOMICC_H_

#include <stdio.h>
#include <vector>

template<class V>
class Action;
class Rule;
class Module;

template<class V>
class GuardedValue {
 public:
  GuardedValue() {
     next = first;
     first = this;
  };
  virtual bool guard() = 0;
  virtual V value() = 0;
  static GuardedValue *first;
  GuardedValue *next;
};
template<class V>
GuardedValue<V> *GuardedValue<V>::first = NULL;

template<class V>
class Action {
public:
  Action() {
     next = first;
     first = this;
  };
  virtual ~Action(){}
  virtual bool guard() { return true; };
  //virtual void body() = 0;
  virtual void body(V v) = 0;
  virtual void update() = 0;
  static Action *first;
  Action *next;
};
template<class V>
Action<V> *Action<V>::first = NULL;

class Rule {
public:
  Rule() {};
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
  virtual void setModule(Module *m) = 0;
  Rule *next;
};

class Module {
  //std::list<Rule*> rules;
 public:
  Module(): rfirst(NULL) {
     printf("[%s] add module to list first %p this %p\n", __FUNCTION__, first, this);
     next = first;
     first = this;
  };
  virtual ~Module() {}
  void addRule(Rule *rule) {
    rule->setModule(this);
  }
  static Module *first;
  Rule *rfirst;
  Module *next;
  static void run();
};

#define RULE(moduletype,name,guardbody,bodybody,updatebody) \
  class name : public Rule {\
    moduletype *module;\
  public:\
    name(moduletype *module) : module(module) {module->addRule(this);} \
    void setModule(Module *m) { module = static_cast<moduletype *>(m); \
       printf("[%s] add rule to module list rfirst %p this %p\n", __FUNCTION__, module->rfirst, this); \
       next = module->rfirst; \
       module->rfirst = this; \
    } \
    virtual bool guard() guardbody;\
    virtual void body() bodybody;\
    virtual void body(bool v) {};\
    void update() updatebody \
  } name ## Rule;

template<class T>
class Reg {
  T storage;
public:
  Reg() {};
  Reg(T v) {};
  T operator *() const { return storage; };
  operator T () const { return storage; };
  void operator =(T v) { storage = v; };
};

#endif
