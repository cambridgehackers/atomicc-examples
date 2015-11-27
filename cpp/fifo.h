#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>
#include <typeinfo>

template<class T>
class Fifo : public Module {
 public:
  ACTION(enq, (T v), notFull()) {}
  ACTION(deq, (void), notEmpty()) {}
  GVALUE(first, T, notEmpty()) { return (T)0; }
  virtual bool notEmpty() const { return false; }
  virtual bool notFull() const { return false; }
};

template<class T>
class Fifo1 : public Fifo<T> 
{
public:
  T element;
  bool full;

  ACTION(enq, (T v), notFull()) {
      element = v;
      full = true;
    }
  ACTION(deq, (void), notEmpty()) {
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

#endif
