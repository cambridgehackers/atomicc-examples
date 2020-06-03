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
#ifndef _ATOMICC_H_
#define _ATOMICC_H_
#if 1
// With: Ubuntu 18.04.4 LTS
// In /usr/include/x86_64-linux-gnu/bits/libio.h:284:15: error: field has incomplete type 'void'
//  _IO_lock_t *_lock;
#define _IO_lock_t_defined
typedef int _IO_lock_t;
#endif
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <string>
#include <stddef.h> // offsetof

#define __software __attribute__(( atomicc_software ))
#define __shared __attribute__(( atomicc_shared ))
#define __action __attribute__(( atomicc_action ))
#define __serialize(A) struct __attribute__(( atomicc_serialize )) { A ifc; }
#define __printf    PipeIn<NOCDataH> *printfp
extern "C" int __bitconcat(int, ...);
extern "C" int __bitsubstr(int, ...);
extern "C" int *__bitsubstrl(int, ...);
#define __clog2(A) __builtin_clog2(A)
extern "C" int __reduce(const char *, ...);
extern "C" void __finish(void);

#define GENERIC_INT_TEMPLATE_FLAG 999999

template<class T>
class PipeIn {
    void enq(T v);
};

template<class T>
class PipeOut {
    void deq(void);
    T first(void);
};

typedef __int(16) LenType;
template<class T>
class PipeInB {
    void enq(T v, bool last);
};

template<class T>
class Fifo {
    PipeIn<T> in;
    PipeOut<T> out;
};

template<class In, class Out>
class Gear {
    PipeIn<In> in;
    PipeOut<Out> out;
};

#define PRINTF_PORT    (uint16_t) 0x7fff

typedef struct {__uint(128) data;} NOCData;
typedef struct {LenType length; __uint(128) data;} NOCDataH;
typedef PipeIn<NOCData>                   NOCPipe;
typedef __uint(32)                        BusType;
#if 0
template<class T> class M2P __implements T { // method -> pipe
public:
    typedef __serialize(T) Data;
    //typedef PipeIn<Data>   Pipe;
    T                      method;
    Pipe                  *pipe;
};

template<class T> class P2M __implements NOCPipe { // pipe -> method
public:
    typedef __serialize(T) Data;
    //typedef PipeIn<Data>   Pipe;
    Pipe                   pipe;
    T                     *method;
};
#endif

static inline std::string utostr(uint64_t X) {
  char Buffer[21], *BufPtr = Buffer+21;
  if (X == 0) *--BufPtr = '0';  // Handle special case...
  while (X) {
    *--BufPtr = '0' + char(X % 10);
    X /= 10;
  }
  return std::string(BufPtr, Buffer+21);
}

#define container_of(ptr, type, member) ({			\
	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
	(type *)( (char *)__mptr - offsetof(type,member) );})
#endif // _ATOMICC_H_
