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

extern "C" void addBaseRule(void *, const char *name, bool (^RDY)(void), void (^ENA)(void));
class Module;
typedef bool (Module::*METHPTR)(void); // MemberFunctionPointer
#define METH(A) methodToFunction((METHPTR)(A))
extern "C" unsigned long methodToFunction(METHPTR v);
extern "C" void exportRequest(unsigned long v);
/*
 * Note: The 'virtual' attribute is needed on guarded interfaces so that
 * references to them are preserved by clang, even if they are not
 * referenced in the original C++ code.  During guard hoisting operations,
 * many new references to '__RDY' methods are created and propigated.
 *
 * The 'virtual' attribute forces all the function names to appear in the
 * vtable, which makes them visible to the atomicc code generation phase.
 */
#define METHOD(A,B,C) \
    virtual bool A ## __RDY(void) C \
    virtual void A B
#define GVALUE(A,B,C) \
    virtual bool A ## __RDY(void) C \
    virtual B A(void)
#define INDICATION(NAME, TYPE, RDYEXPRESSION) \
    virtual bool NAME ## __RDY(void) RDYEXPRESSION \
    virtual void NAME TYPE
#define EXPORTREQUEST(NAME) exportRequest(METH(&NAME));

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
// This is a marker for classes that are exported interfaces from a containing class
class InterfaceClass {
 public:
    InterfaceClass() {}
    ~InterfaceClass() {}
    long unused_data_to_force_inheritance;
 private:
    // copy ops are private to prevent copying
    InterfaceClass(const InterfaceClass&); // no implementation
    InterfaceClass& operator=(const InterfaceClass&);
};
// This is a marker for classes that hold bitvectors
class BitsClass {
 public:
    BitsClass() {}
    ~BitsClass() {}
    long unused_data_to_force_inheritance;
 //private:
    //BitsClass(const BitsClass&) {}
    //BitsClass& operator=(const BitsClass&) {}
};

typedef bool (*GUARDPTR)(void *);
template<class T>
class PipeIn: InterfaceClass {
    void *p;
    GUARDPTR enq__RDYp;
    void (*enqp)(void *p, T v);
 public:
    METHOD(enq, (T v), {return enq__RDYp(p); }) { enqp(p, v); }
    PipeIn(): p(NULL), enq__RDYp(NULL), enqp(NULL) { }
    void init(const char *name, void *ap, unsigned long aenq__RDYp, unsigned long aenqp) {
         p = ap;
         enq__RDYp = (GUARDPTR)aenq__RDYp;
         enqp = (void (*)(void *, T))aenqp;
    }
};

template<class T>
class PipeOut: InterfaceClass {
    void *p;
    GUARDPTR deq__RDYp;
    void (*deqp)(void *p);
    GUARDPTR first__RDYp;
    T (*firstp)(void *p);
 public:
    METHOD(deq, (void), {return deq__RDYp(p); }) { deqp(p); }
    GVALUE(first, T, {return first__RDYp(p); }) { return firstp(p); }
    PipeOut(): p(NULL), deq__RDYp(NULL), deqp(NULL), first__RDYp(NULL), firstp(NULL) { }
    void init(const char *name, void *ap, unsigned long adeq__RDYp, unsigned long adeqp, unsigned long afirst__RDYp, unsigned long afirstp) {
        p = ap;
        deq__RDYp = (GUARDPTR)adeq__RDYp;
        deqp = (void (*)(void *))adeqp;
        first__RDYp = (GUARDPTR)afirst__RDYp;
        firstp = (T (*)(void *))afirstp;
        }
};

#define RULE(moduletype,name,bodybody) \
  addBaseRule(this, name, ^{ (void)this; return true; }, ^ bodybody )

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

extern "C" long fixedGet(void *);
extern "C" void fixedSet(void *, long);
typedef uint8_t Bit;
template<int32_t precision_bits>
    class FixedPoint: public BitsClass {
        long data;
    public:
        static const unsigned long size = precision_bits;
        FixedPoint() {}
        FixedPoint(const FixedPoint &arg) { fixedSet((void *)this, fixedGet((void *)&arg)); }
        ~FixedPoint() {}
        FixedPoint(long val): data(val) {}
        virtual void fixedPrecMeth(void) {}
        inline FixedPoint & operator=(const FixedPoint & arg) {
            //this->data = arg.data;
            fixedSet((void *)this, fixedGet((void *)&arg));
            return *this;
        }
    };

class FixedPointV: public BitsClass {
public:
    long data;
    unsigned long size;
    FixedPointV(int precision_bits): size(precision_bits) { }
    FixedPointV(int precision_bits, long val): size(precision_bits) { }
    inline FixedPointV & operator=(const FixedPointV & arg) {
        fixedSet((void *)this, fixedGet((void *)&arg));
        return *this;
    }
};

#endif
