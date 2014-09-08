#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>
#include <fifoh.h>

template<class T>
class FifoN : public Fifo<T> {
  unsigned nelem;
  T *elements;
  unsigned readIndex;
  unsigned writeIndex;

  bool full;

  class EnqAction : public Action<T> {
    Fifo1 *fifo;
    T elt;
  public:
  EnqAction(Fifo1 *fifo) : fifo(fifo), elt() {}
    bool guard() { return fifo->notFull(); }
    //void body() { }
    void body(T v) { elt = v; }
    void update() {
      // ok, how do we get the value we wanted?
      fifo->element[fifo->writeIndex] = elt;
      fifo->writeIndex = (fifo->writeIndex + 1 ) % fifo->nelem;
    }
  } enqAction;
  friend class EnqAction;
  class DeqAction : public Action<T> {
    Fifo1 *fifo;
    public:
      DeqAction(Fifo1 *fifo) : fifo(fifo) {}
      bool guard() { return fifo->notEmpty(); }
      //void body() { }
      void body(T v) { }
      void update() {
	fifo->readIndex = (fifo->readIndex + 1) % fifo->nelem;
      }
    } deqAction;
  friend class DeqAction;

  class FirstValue : public GuardedValue<T> {
    Fifo1 *fifo;
  public:
  FirstValue(Fifo1 *fifo) : fifo(fifo) {}
    bool guard() { return fifo->notEmpty(); }
    T value() { return fifo->element[readIndex]; }
  } firstValue;

 public:
   FifoN(unsigned size):

   : full(false), enqAction(this), deqAction(this), firstValue(this) 
  {
    fifo->nelem = size;
    fifo->readIndex = 0;
    fifo->writeIndex = 0;
    fifo->elements = new T[size]'
  }
  ~FifoN() {
    delete[] fifo->elements;
  }

  bool notEmpty() const {
    return (fifo->readIndex != fifo->writeIndex);
  }
  bool notFull() const {
    return !(((fifo->writeIndex + 1) % fifo->nelem) == fifo->readIndex);
  }
  Action<T> *enq() {
    return &enqAction;
  }
  GuardedValue<T> *first() {
    return &firstValue;
  }
  Action<T> *deq() {
    return &deqAction;
  }
};

#endif
