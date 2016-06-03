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

#define FIFOBASECONSTRUCTOR(A) \
    Fifo<T>(this, IFC(A, enq), IFC(A, deq), IFC(A, first))

template<class T>
class Fifo : public ModuleExternal
{
 public:
    PipeIn<T> in;
    PipeOut<T> out;
    Fifo() { }
    Fifo(void *p, unsigned long aenq__RDY, unsigned long aenq, unsigned long adeq__RDY, unsigned long adeq, unsigned long afirst__RDY, unsigned long afirst) {
        in.init("in", p, aenq__RDY, aenq);
        out.init("out", p, adeq__RDY, adeq, afirst__RDY, afirst);
    }
};

#ifndef FIFODEFINE
#define FIFODEFINE ModuleExternal
#define BODYGUARD {return true;}
#define BODYVALUE { return (T) 0; }
#define BODYACTION {}
#define FIFOCONSTRUCTOR(A) : FIFOBASECONSTRUCTOR(A) { }
#else
#define BODYGUARD ;
#define BODYACTION ;
#define BODYVALUE ;
#define FIFOCONSTRUCTOR(A) ;
#endif

#ifndef FIFODATA
#define FIFODATA
#endif

template<class T>
class Fifo1 : public Fifo<T> , public FIFODEFINE
{
    FIFODATA
    METHOD(enq, (const T &v), BODYGUARD) BODYACTION
    METHOD(deq, (void), BODYGUARD) BODYACTION
    GVALUE(first, T, BODYGUARD) BODYVALUE
    bool notEmpty() const BODYGUARD
    bool notFull() const BODYGUARD
public:
    Fifo1() FIFOCONSTRUCTOR(Fifo1)
};
#endif
