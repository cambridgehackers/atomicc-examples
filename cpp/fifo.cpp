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

#define FIFODEFINE Module
#define FIFODATA \
  T element;     \
  bool full;

#include <fifo.h>

template<class T>
bool Fifo1<T>::enq__RDY(void) {
    return notFull();
};
template<class T>
void Fifo1<T>::enq(const T &v) {
    element = v;
    full = true;
};
template<class T>
bool Fifo1<T>::deq__RDY(void) {
    return notEmpty();
};
template<class T>
void Fifo1<T>::deq(void) {
    full = false;
};
template<class T>
bool Fifo1<T>::first__RDY(void) {
    return notEmpty();
};
template<class T>
T Fifo1<T>::first(void) {
    return element;
};
template<class T>
Fifo1<T>::Fifo1(): FIFOBASECONSTRUCTOR(Fifo1<T>), full(false)
{
    printf("Fifo1: addr %p size 0x%lx\n", this, sizeof(*this));
};
template<class T>
bool Fifo1<T>::notEmpty() const {
    return full;
};

template<class T>
bool Fifo1<T>::notFull() const {
    return !full;
};

//template class 
Fifo1<int> unused;
//Fifo1<unsigned char> ff1Char;
