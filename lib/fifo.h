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
#include "out2in.h"

template<class T>
class Fifo {
    PipeIn<T> in;
    PipeOut<T> out;
};

template<int width>
class Fifo1Base __implements Fifo<__uint(width)>;

template<class T>
class Fifo1 __implements Fifo<T> {
  Fifo1Base<__bitsize(T)> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};

// FifoB -- bypass fifos (simultaneous enq/deq when empty)
template<int width>
class FifoB1Base __implements Fifo<__uint(width)>;

template<class T>
class FifoB1 __implements Fifo<T> {
  FifoB1Base<__bitsize(T)> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};

// FifoPipe -- pipeline fifos (simultaneous enq/deq when full)
template<int width>
class FifoPipe1Base __implements Fifo<__uint(width)>;

template<class T>
class FifoPipe1 __implements Fifo<T> {
  FifoPipe1Base<__bitsize(T)> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};

// Sized fifo

template<int depth, int width, int bypass = 0>
class SizedFifoBase __implements Fifo<__uint(width)>;

template<int depth, class T, int bypass = 0>
class SizedFifo __implements Fifo<T> {
  SizedFifoBase<depth, __bitsize(T), bypass> fifo;
  void in.enq(const T v) { fifo.in.enq(__bit_cast<__uint(__bitsize(T))>(v)); };
  void out.deq(void) { fifo.out.deq(); }
  T out.first(void) { return __bit_cast<T>(fifo.out.first()); };
};

// FifoP

template<class T>
class FifoPIfc {
    PipeIn<T> in;
    PipeIn<T> *out;
};

template<int width>
class FifoPBase __implements FifoPIfc<__uint(width)>;

template<class T>
class FifoP __implements FifoPIfc<T> {
  FifoPBase<__bitsize(T)> fifo;
  __connect fifo.in = this->in;
  __connect fifo.out = this->out;
};
#endif
