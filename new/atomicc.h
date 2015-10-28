#ifndef _ATOMICC_H_
#define _ATOMICC_H_

#include <stdio.h>
#include <vector>
#include <stdlib.h>
#include <string.h>

#define ACTION(A,B,C) \
   virtual bool A ## __RDY() { return (C); } \
   virtual void A B
#define GVALUE(A,B,C) \
   virtual bool A ## __RDY() { return (C); } \
   virtual B A(void)

class Rule {
public:
  virtual bool RDY() = 0;
  virtual void ENA() = 0;
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
  void addRule(Rule *rule) {
    printf("[%s] add rule to module list rfirst %p this %p\n", __FUNCTION__, rfirst, this);
    rule->next = rfirst;
    rfirst = rule;
  }
  void run(void) {
      Rule *currule = rfirst;
      while (currule) {
printf("     RDY %p\n", currule);
          if (currule->RDY()) {
printf("     ENA %p\n", currule);
              currule->ENA();
          }
          currule = currule->next;
      }
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
    bool RDY() { return true; };\
    void ENA() bodybody;\
    name(moduletype *module) : module(module) {module->addRule(this);} \
  } name ## Rule;

#define RULEN(moduletype,name,bodybody) \
  class name : public Rule {\
    moduletype *module;\
  public:\
    bool RDY() { return true; };\
    void ENA() bodybody;\
    name(moduletype *module) : module(module) {module->addRule(this);} \
  } name ## Rule(this);

#define RULE2(moduletype,name,bodybody) \
  class name { \
  public:\
    RULE(moduletype,name ## 1,bodybody); \
    RULE(moduletype,name ## 2,{}); \
  public:\
    name(moduletype *module) : name ## 1Rule(module), name ## 2Rule(module) {} \
  } name ## Rule;

template <typename T>
     T PIPELINEMARKER(T A, T &B);
#define PIPELINE(A,B) PIPELINEMARKER<decltype(A)>(A, B)

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
extern unsigned int stop_main_program;

#endif
