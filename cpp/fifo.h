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
#ifndef _FIFO_H_
#define _FIFO_H_
#include <atomicc.h>

template<class T>
__emodule Fifo {
    PipeIn<T> in;
    PipeOut<T> out;
};

//#define FIFODEFINE __emodule
#define FIFODEFINE __module

template<int width>
__module Fifo1Base : public Fifo<__uint(width)> {
  __uint(width) element;
  bool full;
  void in.enq(const __uint(width) v) if (notFull()) {
    element = v;
    full = true;
  };
  void out.deq(void) if (notEmpty()) { full = false; };
  __uint(width) out.first(void) if (notEmpty()) { return element; };
  bool notEmpty() const { return full; };
  bool notFull() const { return !full; };
  Fifo1Base(): full(false) { };
};

template<class T>
FIFODEFINE Fifo1old : public Fifo<T> {
  Fifo1Base<__bitsize(T)> fifo;
  T element;
  bool full;
  void in.enq(const T v) if (notFull()) {
    element = v;
    full = true;
  };
  void out.deq(void) if (notEmpty()) { full = false; };
  T out.first(void) if (notEmpty()) { return element; };
  bool notEmpty() const { return full; };
  bool notFull() const { return !full; };
  Fifo1old(): full(false) { };
};
template<class T>
FIFODEFINE Fifo1new : public Fifo<T> {
  Fifo1Base<__bitsize(T)> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};
#define Fifo1 Fifo1old
#define Fifo1 Fifo1new

#endif
