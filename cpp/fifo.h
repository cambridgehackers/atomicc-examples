#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>
#include <typeinfo>

template<class T>
class Fifo : public ModuleStub
{
 public:
  METHOD(enq, (T v), notFull()) {}
  METHOD(deq, (void), notEmpty()) {}
  GVALUE(first, T, notEmpty()) { return (T)0; }
  virtual bool notEmpty() const { return false; }
  virtual bool notFull() const { return false; }
};

#if 0
template<class T>
class Fifo1 : public Fifo<T> 
{
public:
  T element;
  bool full;

  METHOD(enq, (T v), notFull()) {
      element = v;
      full = true;
    }
  METHOD(deq, (void), notEmpty()) {
      full = false;
    }
  GVALUE(first, T, notEmpty()) {
    return element;
    }
  Fifo1(): Fifo<T>(), full(false) {
    printf("Fifo1: addr %p size 0x%lx\n", this, sizeof(*this));
  }
  bool notEmpty() const { return full; }
  bool notFull() const { return !full; }
};
#else
template<class T>
class Fifo1 : public Fifo<T> 
{
public:
  METHOD(enq, (T v), true) {}
  METHOD(deq, (void), true) {}
  GVALUE(first, T, true) { return (T)0; }
  Fifo1(): Fifo<T>() { }
  virtual bool notEmpty() const { return false; }
  virtual bool notFull() const { return false; }
};
#endif

#endif
