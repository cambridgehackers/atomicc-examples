// Copyright (c) 2015-2019 The Connectal Project

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
#include <atomicc.h>
#include <fifo.h>

#if 0
for (int entries=0; entries <= depth; entries++) {
   __uint(width) entry;
   fifo_consistent: assert property(
      (push && !full && (f_num_entries-pop == entries), entry=in)
          |=> pop[->entries] ##1 pop[->1] ##0 (out == entry));
}
#endif
/*
 * Standard fifo: enq() and deq() are exclusive
 */
template<int width>
class Fifo1Base __implements Fifo<__uint(width)> {
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

static Fifo1Base<GENERIC_INT_TEMPLATE_FLAG> dummy;

/*
 * Bypass fifo: enq() and deq() are allowed on same cycle when empty
 */
template<int width>
class FifoBypass1Base __implements Fifo<__uint(width)> {
  __uint(width) element;
  bool full;
  __shared __uint(width) enq_v;
  void in.enq(const __uint(width) v) if (notFull()) {
    enq_v = v;
    element = v;
    if (!__valid(out.deq))
        full = true;
  };
  void out.deq(void) if (notEmpty()) { full = false; };
  __uint(width) out.first(void) if (notEmpty()) { return full ? element : enq_v; };
  bool notEmpty() const { return full; };
  bool notFull() const { return !full; };
  FifoBypass1Base(): full(false) { };
};

static FifoBypass1Base<GENERIC_INT_TEMPLATE_FLAG> dummyb;

/*
 * Pipeline fifo: enq() and deq() are allowed on same cycle when full
 */
template<int width>
class FifoPipeline1Base __implements Fifo<__uint(width)> {
  __uint(width) element;
  bool full;
  void in.enq(const __uint(width) v) if (notFull()) {
    element = v;
    if (!__valid(out.deq))
        full = true;
  };
  void out.deq(void) if (notEmpty()) { full = !__valid(in.enq); };
  __uint(width) out.first(void) if (notEmpty()) { return element; };
  bool notEmpty() const { return full; };
  bool notFull() const { return !full; };
  FifoPipeline1Base(): full(false) { };
};

static FifoPipeline1Base<GENERIC_INT_TEMPLATE_FLAG> dummyPipe;

/*
 * FifoP: both in and out interfaces are PipeIn
 */
template<int width>
class FifoPBase __implements FifoPIfc<__uint(width)> {
  Fifo1Base<width> fifo;
  Out2InBase<width> base;
  void in.enq(const __uint(width) v) { fifo.in.enq(v); };
  __connect base.in = fifo.out;
  __connect base.out = this->out;
};

static FifoPBase<GENERIC_INT_TEMPLATE_FLAG> dummyc;
