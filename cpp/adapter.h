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
#ifndef _ADAPTER_H_
#define _ADAPTER_H_
#include <atomicc.h>

typedef __int(16) LenType;
template<class T>
__interface PipeInH {
    typedef T Data;
    void enq(T v, LenType length);
};
template<class T>
__interface PipeInB {
    typedef T Data;
    void enq(T v, bool last);
};

template<class T, class BusType>
__module AdapterToBus {
   PipeInH<T>        in;
   PipeInB<BusType> *out;
   //const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   __int(16)        remain;
   __uint(__bitsize(T)) buffer;

   void in.enq(T v, LenType length) if (remain == 0) {
      buffer = __bit_cast<decltype(buffer)>(v);
      remain = length + 1;
   }
   AdapterToBus() {
      __rule copyRule if (remain != 0) {
         out->enq(buffer, remain == 1);
         remain--;
         buffer >>= __bitsize(BusType);
      }
   }
};

template<class BusType, class T>
__module AdapterFromBus {
   PipeInB<BusType>  in;
   PipeInH<T>       *out;
   //const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   bool             waitForEnq;
   __uint(__bitsize(T)) buffer;

   void in.enq(BusType v, bool last) if (!waitForEnq) {
      buffer = __bitconcat(__bitsubstr(buffer, __bitsize(buffer) - 1, __bitsize(BusType)), v);
      //buffer = v | (sizeof(buffer) > sizeof(BusType) ? (buffer << __bitsize(BusType)) : 0);
      if (last)
          waitForEnq = 1;
   }
   AdapterFromBus() {
      __rule pushValue if (waitForEnq) {
          out->enq(__bit_cast<T>(buffer), 0);
          waitForEnq = 0;
      }
   }
};
#endif
