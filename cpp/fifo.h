#ifndef _FIFO_H_
#define _FIFO_H_

#include <atomicc.h>

template<class T>
class Fifo : public Module {
 public:
  Fifo() {}
  virtual ~Fifo() {}
  virtual void enq(T v) = 0;
  virtual T first() const = 0;
  virtual void deq() = 0;
  virtual bool notEmpty() = 0;
  virtual bool notFull() = 0;
};

template<class T>
class Fifo1 : public Fifo {
  T element;
  bool full;
 public:
  Fifo1() {};
  ~FIFO1() {}

  void enq(T v) {
    // guarded atomic action
    if (!full) {
      element = v;
      full = true;
    }
  }
  T first() const {
    // guarded expression
    if (full)
      return element;
    else
      fail;
  }
  void deq() {
    // guarded atomic action
    if (full) {
      full = false;
    }
  }
};

#endif
