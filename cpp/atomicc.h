#ifndef _ATOMICC_H_
#define _ATOMICC_H_

#include <stdio.h>
#include <vector>
#include <stdlib.h>
#include <string.h>

template<class V>
class Action;
class Rule;
class Module;

template<class V>
class GuardedValue {
 public:
  GuardedValue() { };
  virtual bool guard() = 0;
  virtual V value() = 0;
};

template<class V>
class Action {
public:
  Action() { };
  virtual ~Action(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void body(V v) = 0;
  virtual void update() = 0;
};

class Rule {
public:
  Rule() { printf("Rule: addr %p size 0x%lx\n", this, sizeof(*this)); };
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
  virtual void setModule(Module *m) = 0;
  Rule *next;
};

class Module {
 public:
  Module(size_t size): rfirst(NULL), next(first), size(size) {
     printf("[%s] add module to list first %p this %p\n", __FUNCTION__, first, this);
     first = this;
     void *temp = malloc(size);
     memset(temp, 0, size);
     shadow = (Module *)temp;
  };
  virtual ~Module() {}
  void addRule(Rule *rule) {
    rule->setModule(this);
  }
  Rule *rfirst;
  Module *next;
  Module *shadow;
  size_t size;
  static Module *first;
};

#define RULE(moduletype,name,bodybody) \
  class name : public Rule {\
    moduletype *module;\
  public:\
    name(moduletype *module) : module(module) {module->addRule(this);} \
    void setModule(Module *m) { module = static_cast<moduletype *>(m); \
       printf("[%s] add rule to module list rfirst %p this %p\n", __FUNCTION__, module->rfirst, this); \
       next = module->rfirst; \
       module->rfirst = this; \
    } \
    virtual bool guard() { return true; };\
    virtual void body() bodybody;\
    virtual void body(bool v) {};\
    void update() {} \
  } name ## Rule;

#define RULE2(moduletype,name,bodybody) \
  class name { \
  public:\
    RULE(moduletype,name ## 1,bodybody); \
    RULE(moduletype,name ## 2,{}); \
  public:\
    name(moduletype *module) : name ## 1Rule(module), name ## 2Rule(module) {} \
  } name ## Rule;

extern "C" int PIPELINE(int A);

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
extern void run_main_program();
extern int stop_main_program;

#endif
