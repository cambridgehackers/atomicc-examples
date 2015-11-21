#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>
#include <typeinfo>

template<class T>
class Fifo : public Module {
 public:
  ACTION(enq, (T v), notFull()) = 0;
  ACTION(deq, (void), notEmpty()) = 0;
  GVALUE(first, T, notEmpty()) = 0;
  virtual bool notEmpty() const = 0;
  virtual bool notFull() const = 0;
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
