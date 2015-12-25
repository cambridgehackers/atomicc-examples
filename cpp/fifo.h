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

#include <assert.h>
#include <atomicc.h>
#include <typeinfo>

#ifndef FIFODEFINE
#define FIFODEFINE ModuleStub
#define BODYGUARD {return true;}
#define BODYVALUE { return (T) 0; }
#define BODYACTION {}
#define FIFODATA
#else
#define BODYGUARD ;
#define BODYACTION ;
#define BODYVALUE ;
#endif
template<class T>
class Fifo : public FIFODEFINE
{
 public:
  METHOD(enq, (T v), {return false; }) {}
  METHOD(deq, (void), {return false; }) {}
  GVALUE(first, T, {return false; }) { return (T)0; }
};

template<class T>
class Fifo1 : public Fifo<T> 
{
  FIFODATA
public:
#if 0
  PipeIn<T, Fifo1<T>> in;
  PipeOut<T, Fifo1<T>> out;
#endif
  METHOD(enq, (T v), BODYGUARD) BODYACTION
  METHOD(deq, (void), BODYGUARD) BODYACTION
  GVALUE(first, T, BODYGUARD) BODYVALUE
  Fifo1() BODYACTION
  bool notEmpty() const BODYGUARD
  bool notFull() const BODYGUARD
};

#endif
