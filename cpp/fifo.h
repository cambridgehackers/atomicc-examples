#ifndef _FIFO_H_
#define _FIFO_H_

#include <assert.h>
#include <atomicc.h>

template<class T>
class Fifo : public Module {
 public:
  Fifo() {}
  virtual ~Fifo() {}
  virtual Action *enq(T &v) = 0;
  virtual T first() const = 0;
  virtual Action * deq() = 0;
  virtual bool notEmpty() const = 0;
  virtual bool notFull() const = 0;
};

template<class T>
class Fifo1 : public Fifo<T> {
  T element;
  bool full;

  class EnqAction : public Action {
    Fifo1 *fifo;
    T &v;
  public:
  EnqAction(Fifo1 *fifo, T &v) : fifo(fifo), v(v) {}
    bool guard() { return fifo->notFull(); }
    void body() { }
    void update() {
      // ok, how do we get the value we wanted?
      fifo->element = v;
      fifo->full = true;
    }
  };
  friend class EnqAction;
  class DeqAction : public Action {
    Fifo1 *fifo;
    public:
      DeqAction(Fifo1 *fifo) : fifo(fifo) {}
      bool guard() { return fifo->notEmpty(); }
      void body() { }
      void update() {
	fifo->full = false;
      }
    };
  friend class DeqAction;
 public:
  Fifo1() {};
  ~Fifo1() {}

  bool notEmpty() const {
    return full;
  }
  bool notFull() const {
    return !full;
  }
  Action *enq(T &v) {
    return new EnqAction(this, v);
  }
  T first() const {
    assert(full);
    return element;
  }
  Action *deq() {
    return new DeqAction(this);
  }
};

#endif
