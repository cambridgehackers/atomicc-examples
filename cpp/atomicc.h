// Copyright (c) 2015 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#ifndef _ATOMICC_H_
#define _ATOMICC_H_
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern "C" void addBaseRule(void *, const char *name, bool (^RDY)(void), void (^ENA)(void));
extern "C" void exportSymbol(void *thisp, const char *name, unsigned long STy);
#define ACTION(A,B,C) \
    virtual bool A ## __RDY(void) { return (C); } \
    virtual void A B
#define GVALUE(A,B,C) \
    virtual bool A ## __RDY(void) { return (C); } \
    virtual B A(void)
#define INDICATION(NAME, TYPE) \
    long unused_data_to_flag_indication_ ## NAME; \
    virtual void NAME TYPE
#define EXPORTREQUEST(NAME) \
    exportSymbol(this, #NAME, 0)

// This is a marker for classes that should be synthesized in hardware
class Module {
 public:
    Module() {}
    ~Module() {}
    long unused_data_to_force_inheritance;
 private:
    // copy ops are private to prevent copying
    Module(const Module&); // no implementation
    Module& operator=(const Module&);
};

#define RULE(moduletype,name,bodybody) \
  addBaseRule(this, "rule_" #name, ^{ (void)this; return true; }, ^ bodybody )

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
