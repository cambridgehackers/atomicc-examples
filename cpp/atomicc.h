#ifndef _ATOMICC_H_
#define _ATOMICC_H_

#include <vector>

class Action;
class Rule;
class Module;

class Action {
public:
  Action() {};
  virtual ~Action(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
};

class Rule : public Action {
  // needs to be some sort of smart pointer?
  std::vector<Action*> actions;
public:
  Rule() {};
  virtual ~Rule(){}
  virtual bool guard() { return true; };
  virtual void body() = 0;
  virtual void update() = 0;
  virtual void setModule(Module *m) = 0;
  void append(Action *action) {
    actions.push_back(action);
  };
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
    name() : module(0) {module->addRule(this);} \
    void setModule(Module *m) { module = static_cast<moduletype *>(m); } \
    virtual bool guard() guardbody;\
    virtual void body() bodybody;\
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
