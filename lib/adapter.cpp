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
template<int width, int owidth>
class AdapterToBus __implements AtB<width, owidth> {
   __uint(width)     buffer;
   LenType           remain;

   void clear(void) {
       remain = 0;
   }
   void in.enq(__uint(width) v, LenType size) if (!__valid(clear) && remain == 0) {
      buffer = v;
      remain = size;
      if (TRACE_ADAPTER)
      printf ("adapterTOin %x length %x\n", v, size);
   }
   bool out.last(void) if (!__valid(clear) && remain != 0) {
       return remain <= owidth;
   }
   __uint(width) out.first(void) if (!__valid(clear) && remain != 0) {
        __uint(owidth) outVal = __bitsubstr(buffer, __bitsize(buffer) - 1, __bitsize(buffer) - owidth);
       return outVal;
   }
   void out.deq(void) if (!__valid(clear) && remain != 0) {
      if (TRACE_ADAPTER)
      printf ("adapterTOout remain %x\n", remain);
      if (remain <= owidth)
          remain = 0;
      else
          remain -= owidth;
      buffer <<= owidth;
   }
};

template<int owidth, class T>
class AdapterFromBus __implements AfB<owidth, T> {
   NOCData              buffer;
   bool                 waitForEnq;
   LenType              length;

   void in.enq(__uint(owidth) v, bool last) if (!waitForEnq) {
      if (TRACE_ADAPTER)
      printf("adapterFROMin %x last %x buffer %x\n", v, last, buffer);
      buffer = __bitconcat(v, __bitsubstr(buffer, __bitsize(buffer) - 1, owidth));
      length += owidth;
      if (last)  // this is the last beat
          waitForEnq = true;
   }
   __rule pushValue if (waitForEnq) {
       length = 0;
       if (TRACE_ADAPTER)
       printf("adapterFROMout %x\n", buffer);
       this->out->enq(T{length, buffer});
       waitForEnq = false;
   }
};

static AdapterToBus<__bitsize(NOCData), BusTypeWidth> radapter_0;
static AdapterFromBus<BusTypeWidth, NOCDataH> wadapter_0;
