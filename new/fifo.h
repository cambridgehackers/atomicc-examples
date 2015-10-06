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
class Fifo1 : public Fifo<T> {
public:
  T element;
  bool full;

  class EnqAction : public Action<T> {
  public:
    Fifo1 *fifo;
    T elt;
    EnqAction(Fifo1 *fifo) : fifo(fifo), elt() { printf("[%s:%d] fifo %p\n", __FUNCTION__, __LINE__, fifo); }
    bool guard() { return fifo->notFull(); }
    void body() { }
    void body(T v) { elt = v; }
    void update() {
      // ok, how do we get the value we wanted?
      fifo->element = elt;
      fifo->full = true;
    }
  } enqAction;
  friend class EnqAction;
  class DeqAction : public Action<T> {
  public:
    Fifo1 *fifo;
    DeqAction(Fifo1 *fifo) : fifo(fifo) { printf("[%s:%d] fifo %p\n", __FUNCTION__, __LINE__, fifo); }
    bool guard() { return fifo->notEmpty(); }
    void body() { }
    void body(T v) { }
    void update() {
      fifo->full = false;
    }
  } deqAction;
  friend class DeqAction;

  class FirstValue : public GuardedValue<T> {
  public:
    Fifo1 *fifo;
    FirstValue(Fifo1 *fifo) : fifo(fifo) {}
    bool guard() { return fifo->notEmpty(); }
    T value() { return fifo->element; }
  } firstValue;
  Fifo1() : Fifo<T>(sizeof(Fifo1<T>), &enqAction, &firstValue, &deqAction), full(false), enqAction(this), deqAction(this), firstValue(this) {
    printf("Fifo1: addr %p size 0x%lx\n", this, sizeof(*this)); 
  };
  ~Fifo1() {}
  bool notEmpty() const { return full; }
  bool notFull() const { return !full; }
  //Action<T> *enq() { return &enqAction; }
  //GuardedValue<T> *first() { return &firstValue; }
  //Action<T> *deq() { return &deqAction; }
};

#endif
