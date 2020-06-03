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

template<class T, int width>
class AdapterToBus __implements AtB<T, width> {
   __uint(__bitsize(T)) buffer;
   __int(16)            remain;

   void in.enq(T v, LenType length) if (remain == 0) {
      buffer = __bit_cast<decltype(buffer)>(v);
      remain = length;
   }
   __rule copyRule if (remain != 0) {
      this->out->enq(buffer, remain == 1);
      remain--;
      buffer >>= width;
   }
};

template<int width, class T>
class AdapterFromBus __implements AfB<width, T> {
   __uint(__bitsize(T)) buffer;
   bool                 waitForEnq;

   void in.enq(__uint(width) v, bool last) if (!waitForEnq) {
      buffer = __bitconcat(__bitsubstr(buffer, __bitsize(buffer) - width - 1, 0), v);
      if (last)  // this is the last beat
          waitForEnq = 1;
   }
   __rule pushValue if (waitForEnq) {
       this->out->enq(__bit_cast<T>(buffer), 0);
       waitForEnq = 0;
   }
};

static AdapterToBus<NOCData, BusTypeWidth> radapter_0;
static AdapterFromBus<BusTypeWidth, NOCData> wadapter_0;
