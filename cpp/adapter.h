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

template<class T, class BusType>
__module AdapterToBus {
   PipeIn<T>        in;
   PipeIn<BusType> *out;
   const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   int              remain;
   unsigned int __attribute__(( atomicc_width(sizeofBit(T)) )) buffer;

   void in.enq(T val) if (remain == 0) {
      buffer = static_cast<decltype(buffer)>(val);
      remain = maxBeats;
   }
   AdapterToBus() {
      __rule copyRule if (remain != 0) {
         out->enq(buffer >> (sizeofBit(BusType) * (maxBeats - 1));
         remain--;
         buffer <<= sizeofBit(BusType);
      }
   }
};

template<class BusType, class T>
__module AdapterFromBus {
   PipeIn<BusType>  in;
   PipeIn<T>       *out;
   const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   int              count;
   unsigned int __attribute__(( atomicc_width(sizeofBit(T)) )) buffer;

   void in.enq(BusType x) if (count < maxBeats) {
      buffer = (buffer << sizeofBit(BusType)) | x;
      count++;
   }
   AdapterFromBus() {
      __rule pushValue if (count == maxBeats) {
          out->enq(static_cast<T>(buffer));
          count = 0;
      }
   }
};
#endif
