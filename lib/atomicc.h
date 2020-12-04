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

#define BusTypeWidth               32
#define GENERIC_INT_TEMPLATE_FLAG 999999
#define PRINTF_PORT    (uint16_t) 0x7fff

#define __software __attribute__(( atomicc_software ))
#define __shared __attribute__(( atomicc_shared ))
#define __action __attribute__(( atomicc_action ))
#define __async __attribute__(( atomicc_async ))
#define __trace(A,B) __attribute__(( atomicc_trace((A), (B)) ))
#define __topModule __attribute__(( atomicc_topModule ))
#define __printf __attribute__(( atomicc_printf ))
#define __serialize(A) struct __attribute__(( atomicc_serialize )) { A ifc; }
extern "C" int __bitconcat(int, ...);
extern "C" int __bitsubstr(int, ...);
extern "C" int *__bitsubstrl(int, ...);
#define __clog2(A) __builtin_clog2(A)
extern "C" int __reduce(const char *, ...);
extern "C" void __finish(void);
extern "C" bool $past(int);

template<class T>
class PipeIn {
    void enq(T v);
};
template<class T>
class PipeInSync {
    PipeIn<T> _;
};

template<class T>
class PipeOut {
    void deq(void);
    T first(void);
};

typedef __int(16) LenType;
template<int width>
class PipeInLast {
    void enq(__uint(width) v, bool last);
};
template<int width>
class PipeOutLast {
    void deq(void);
    __uint(width) first(void);
    bool last(void);
};

template<int width>
class PipeInLength {
    void enq(__uint(width) v, LenType size);  // size in bits
};

template<int funnelWidth, int width>
class SelectIndexIfc {
    __uint(width) out;
    __uint(width) *in[funnelWidth];
    __uint(__clog2(funnelWidth)) index;
};
template<int funnelWidth, int width>
class SelectIndex __implements __verilog SelectIndexIfc<funnelWidth, width>;

typedef __uint(128) NOCData;
typedef struct NOCDataH {LenType length; NOCData data;} NOCDataH;
class Dummy __implements PipeIn<__uint(32)>;
static Dummy dummyp;
static SelectIndex<20, 14> dummySelectIndex;

// control '__async' method invocation (from invoker)
class AsyncControlIfc {
    __input __uint(1) CLK;
    __input __uint(1) nRST;
    __input __uint(1) start;
    __input __uint(1) ack;
    __input __uint(1) clear;
    __output __uint(1) out;
    __output __uint(1) done;
};
class AsyncControl __implements AsyncControlIfc;

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

#ifdef USE_PRINTF
class Printf __implements PipeIn<NOCDataH>;
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
