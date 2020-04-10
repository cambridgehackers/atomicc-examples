// Copyright (c) 2018 The Connectal Project

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
#ifndef _FIFON_H_
#define _FIFON_H_

#include <assert.h>
#include <atomicc.h>
#include <fifo.h>

template<class T>
class FifoN __implements Fifo<T> {
  unsigned nelem;
  T *elements;
  unsigned readIndex;
  unsigned writeIndex;

  bool full;

  class EnqAction : public Action<T> {
    FifoN *fifo;
    T elt;
  public:
  EnqAction(FifoN *fifo) : fifo(fifo), elt() {}
    bool guard() { return fifo->notFull(); }
    //void body() { }
    void body(T v) { elt = v; }
    void update() {
      // ok, how do we get the value we wanted?
      fifo->elements[fifo->writeIndex] = elt;
      fifo->writeIndex = (fifo->writeIndex + 1 ) % fifo->nelem;
    }
  } enqAction;
  friend class EnqAction;
  class DeqAction : public Action<T> {
    FifoN *fifo;
    public:
      DeqAction(FifoN *fifo) : fifo(fifo) {}
      bool guard() { return fifo->notEmpty(); }
      //void body() { }
      void body(T v) { }
      void update() {
	fifo->readIndex = (fifo->readIndex + 1) % fifo->nelem;
      }
    } deqAction;
  friend class DeqAction;

  class FirstValue : public GuardedValue<T> {
    FifoN *fifo;
  public:
  FirstValue(FifoN *fifo) : fifo(fifo) {}
    bool guard() { return fifo->notEmpty(); }
    T value() { return fifo->elements[fifo->readIndex]; }
  } firstValue;

 public:
   FifoN(unsigned size)

   : full(false), enqAction(this), deqAction(this), firstValue(this) 
  {
    nelem = size;
    readIndex = 0;
    writeIndex = 0;
    elements = new T[size];
  }
  ~FifoN() {
    delete[] elements;
  }

  bool notEmpty() const {
    return (readIndex != writeIndex);
  }
  bool notFull() const {
    return !(((writeIndex + 1) % nelem) == readIndex);
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
