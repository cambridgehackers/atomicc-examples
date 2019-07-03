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
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <string>
#include <stddef.h> // offsetof

#define __interface class __attribute__(( atomicc_interface ))
#define __module class __attribute__(( atomicc_module ))
#define __emodule class __attribute__(( atomicc_emodule ))
#define __software __attribute__(( atomicc_software ))
#define __shared __attribute__(( atomicc_shared ))
#define __action __attribute__(( atomicc_action ))
#define __serialize(A) struct __attribute__(( atomicc_serialize )) { A ifc; }
#define __printf    NOCPipeH *printfp
extern "C" int __bitconcat(int, ...);
extern "C" int __bitsubstr(int, ...);
extern "C" int *__bitsubstrl(int, ...);
extern "C" int __clog2(int);
extern "C" int __reduce(const char *, ...);

#define GENERIC_INT_TEMPLATE_FLAG 999999

extern "C" void atomiccSchedulePriority(const char *arule, const char *priority, unsigned long classPtr);

template<class T>
__interface PipeIn {
    typedef T Data;
    void enq(T v);
};

template<class T>
__interface PipeOut {
    typedef T Data;
    void deq(void);
    T first(void);
};

typedef __int(16) LenType;
template<class T>
__interface PipeInH {
    typedef T Data;
    void enq(T v, LenType length);
};
template<class T>
__interface PipeInB {
    typedef T Data;
    void enq(T v, LenType length); // last item in packet has (length == 1)
};

template<class T>
__emodule Fifo {
    PipeIn<T> in;
    PipeOut<T> out;
};

template<class In, class Out>
__emodule Gear {
    PipeIn<In> in;
    PipeOut<Out> out;
};

#define MAX_NOC_WIDTH                  4//100
#define PRINTF_PORT    (uint16_t) 0x7fff

typedef struct {__uint(128) data;} NOCData;
typedef PipeIn<NOCData>                   NOCPipe;
typedef PipeInH<NOCData>                  NOCPipeH;
typedef __uint(32)                        BusType;
#if 0
template<class T> __emodule M2P { // method -> pipe
public:
    typedef __serialize(T) Data;
    typedef NOCPipeH   Pipe;
    //typedef PipeIn<Data>   Pipe;
    T                      method;
    Pipe                  *pipe;
    Pipe                   unused;
};

template<class T> __emodule P2M { // pipe -> method
public:
    typedef __serialize(T) Data;
    typedef NOCPipe   Pipe;
    //typedef PipeIn<Data>   Pipe;
    Pipe                   pipe;
    T                     *method;
};
#endif
static NOCPipe unusedNOCPipe;

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
