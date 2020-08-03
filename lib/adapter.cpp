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
#include "adapter.h"

#define TRACE_ADAPTER 0
template<class T, int width>
class AdapterToBus __implements AtB<T, width> {
   __uint(__bitsize(T)) buffer;
   LenType                   remain;

   void in.enq(T v) if (remain == 0) {
      buffer = __bit_cast<decltype(buffer)>(v);
      remain = v.length;
      if (TRACE_ADAPTER)
      printf ("adapterTOin %x length %x\n", v.data, v.length);
   }
   __rule copyRule if (remain != 0) {
      __uint(width) outVal = __bitsubstr(buffer, __bitsize(T) - 1, __bitsize(T) - width);
      if (TRACE_ADAPTER)
      printf ("adapterTOout %x remain %x\n", outVal, remain);
      this->out->enq(outVal, remain == 1);
      remain--;
      buffer <<= width;
   }
};

template<int width, class T>
class AdapterFromBus __implements AfB<width, T> {
   __uint(__bitsize(T)) buffer;
   bool                 waitForEnq;
   LenType              length;

   void in.enq(__uint(width) v, bool last) if (!waitForEnq) {
      if (TRACE_ADAPTER)
      printf("adapterFROMin %x last %x buffer %x\n", v, last, buffer);
      LenType newLength = length + 1;
      buffer = __bitconcat(v, __bitsubstr(buffer, __bitsize(buffer) - 1, __bitsize(LenType) + width), __bit_cast<__uint(__bitsize(LenType))>(newLength));
      length = newLength;
      if (last)  // this is the last beat
          waitForEnq = true;
   }
   __rule pushValue if (waitForEnq) {
       length = 0;
       if (TRACE_ADAPTER)
       printf("adapterFROMout %x\n", buffer);
       this->out->enq(__bit_cast<T>(buffer));
       waitForEnq = false;
   }
};

static AdapterToBus<NOCDataH, BusTypeWidth> radapter_0;
static AdapterFromBus<BusTypeWidth, NOCDataH> wadapter_0;
