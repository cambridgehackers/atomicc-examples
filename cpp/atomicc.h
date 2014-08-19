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

class Rule : public Action {
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

#define RULE(moduletype,name,guardbody,bodybody,updatebody) \
  class name : public Rule {moduletype *module; public: name() : module(0) {module->addRule(this);} virtual bool guard() guardbody; virtual void body() bodybody; void update() updatebody } name ## Instance;


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
