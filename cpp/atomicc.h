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
#include <stdint.h>
#include <string.h>
#include <string>
#include <stddef.h> // offsetof

extern "C" void addBaseRule(void *, const char *name, bool (^ __vectorcall RDY)(void), void (^ __vectorcall ENA)(void));
class Module;
typedef bool (Module::*METHPTR)(void); // MemberFunctionPointer
#define METH(A) methodToFunction((METHPTR)(A))
extern "C" unsigned long methodToFunction(METHPTR v);
extern "C" void connectInterface(void *classp, void **target, void *source);
extern "C" void atomiccSchedulePriority(const char *rule, const char *priority, unsigned long classPtr);
/*
 * Note: The 'virtual' attribute is needed on guarded interfaces so that
 * references to them are preserved by clang, even if they are not
 * referenced in the original C++ code.  During guard hoisting operations,
 * many new references to '__RDY' methods are created and propagated.
 *
 * The 'virtual' attribute forces all the function names to appear in the
 * vtable, which makes them visible to the atomicc code generation phase.
 */
#define METHODATTR [[ gnu::target("atomicc_method") ]] [[ gnu::used ]] __vectorcall
//#define METHODATTR
#define METHOD(A,B,C) \
    METHODATTR bool A ## __RDY(void) C \
    METHODATTR void A B
#define VMETHOD(A,B,C) \
    METHODATTR bool A ## __READY(void) C \
    METHODATTR void A B
#define GVALUE(A,B,C) \
    METHODATTR bool A ## __RDY(void) C \
    METHODATTR B A(void)
#define INDICATION(NAME, TYPE, RDYEXPRESSION) \
    METHODATTR bool NAME ## __RDY(void) RDYEXPRESSION \
    METHODATTR void NAME TYPE

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
// This is a marker for classes that should not be generated (they are separately compiled)
class ModuleExternal {
 public:
    ModuleExternal() {}
    ~ModuleExternal() {}
    long unused_data_to_force_inheritance;
 private:
    // copy ops are private to prevent copying
    ModuleExternal(const ModuleExternal&); // no implementation
    ModuleExternal& operator=(const ModuleExternal&);
};

typedef bool (*GUARDPTR)(void *);
#define IFC(cname,mname) METH(&cname::mname ## __RDY), METH(&cname::mname)
#define VIFC(cname,mname) METH(&cname::mname ## __READY), METH(&cname::mname)
#define ASSIGNIFCPTR(A) { \
         A ## __RDYp = (decltype(A ## __RDYp))a ## A ## __RDYp; \
         A ## p = (decltype(A ## p))a ## A ## p; }
#define ASSIGNVIFCPTR(A) { \
         A ## __READYp = (decltype(A ## __READYp))a ## A ## __READYp; \
         A ## p = (decltype(A ## p))a ## A ## p; }
template<class T>
ainterface PipeIn {
    void enq(const T &v);
};

template<class T>
ainterface PipeOut {
    void deq(void);
    T first(void);
};

#define RULE(moduletype,name, guardExpr, bodybody) \
  addBaseRule(this, name, ^ __vectorcall { (void)this; return (guardExpr); }, ^ __vectorcall bodybody )

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

static inline std::string utostr(uint64_t X) {
  char Buffer[21], *BufPtr = Buffer+21;
  if (X == 0) *--BufPtr = '0';  // Handle special case...
  while (X) {
    *--BufPtr = '0' + char(X % 10);
    X /= 10;
  }
  return std::string(BufPtr, Buffer+21);
}

#define container_of(ptr, type, member) ({			\
	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
	(type *)( (char *)__mptr - offsetof(type,member) );})

#endif
