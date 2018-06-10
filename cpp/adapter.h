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

//#define CAST reinterpret_cast
#define CAST __bit_cast

template<class T, class BusType>
__module AdapterToBus {
   PipeIn<T>        in;
   PipeIn<BusType> *out;
   const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   __int(16)        remain;
   __uint(__bitsize(T)) buffer;

   void in.enq(T val) if (remain == 0) {
      buffer = CAST<decltype(buffer)>(val);
      remain = buffer;
   }
   AdapterToBus() {
      __rule copyRule if (remain != 0) {
         out->enq(buffer);
         remain--;
         buffer >>= __bitsize(BusType);
      }
   }
};

template<class BusType, class T>
__module AdapterFromBus {
   PipeIn<BusType>  in;
   PipeIn<T>       *out;
   const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   int              remain;
   __uint(__bitsize(T)) buffer;

   void in.enq(BusType v) if (remain != 0) {
      buffer = v | (sizeof(buffer) > sizeof(BusType) ? (buffer << __bitsize(BusType)) : 0);
      if (remain < 0)
          remain = v - 1;
      else
          remain--;
   }
   AdapterFromBus() {
      __rule pushValue if (remain == 0) {
          out->enq(CAST<T>(buffer));
          remain = -1;
      }
   }
};
#endif
