#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>

template<class T>
class Fifo : public Module {
 public:
  Fifo(size_t size, Action<T> *enq, GuardedValue<T> *first, Action<T> *deq) :
    Module(size), enq(enq), first(first), deq(deq) {}
  virtual ~Fifo() {}
  Action<T> *enq;
  GuardedValue<T> *first;
  Action<T> *deq;
  virtual bool notEmpty() const = 0;
  virtual bool notFull() const = 0;
};

template<class T>
class Fifo1 //: public Fifo<T> 
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
  Fifo1()// : Fifo<T>(sizeof(Fifo1<T>), &enqAction, &firstValue, &deqAction), full(false), enqAction(this), deqAction(this), firstValue(this)
  {
    printf("Fifo1: addr %p size 0x%lx\n", this, sizeof(*this)); 
  };
  ~Fifo1() {}
  bool notEmpty() const { return full; }
  bool notFull() const { return !full; }
};

#endif
