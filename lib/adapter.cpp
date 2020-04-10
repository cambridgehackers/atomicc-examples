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
#include "atomicc.h"
#include "adapter.h"

template<class T, class BusType>
class AdapterToBus __implements AtB<T, BusType> {
   //const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   __int(16)        remain;
   __uint(__bitsize(T)) buffer;

   void in.enq(T v, LenType length) if (remain == 0) {
      //printf("TTTTTT in.enq: v %x length %x\n", v, length);
      buffer = __bit_cast<decltype(buffer)>(v);
      remain = length + 1;
   }
   AdapterToBus() {
      __rule copyRule if (remain != 0) {
         //printf("TTTTTT copyRule: buffer %x remain %x\n", buffer, remain);
         this->out->enq(buffer, remain);
         remain--;
         buffer >>= __bitsize(BusType);
      }
   }
};

template<class BusType, class T>
class AdapterFromBus __implements AfB<BusType, T> {
   //const int        maxBeats = (sizeof(T) + sizeof(BusType) - 1)/sizeof(BusType);
   bool             waitForEnq;
   __uint(__bitsize(T)) buffer;

   void in.enq(BusType v, LenType length) if (!waitForEnq) {
      //printf("FFFFFFFF in.enq: v %d last %d buffer %x\n", v, last, buffer);
      buffer = __bitconcat(__bitsubstr(buffer, __bitsize(buffer) - __bitsize(BusType) - 1, 0), v);
      if (length == 1)  // this is the last beat
          waitForEnq = 1;
   }
   AdapterFromBus() {
      __rule pushValue if (waitForEnq) {
          //printf("FFFFFFFF pushValue: buffer %x\n", buffer);
          this->out->enq(__bit_cast<T>(buffer), 0);
          waitForEnq = 0;
      }
   }
};

static AdapterToBus<NOCData, BusType> radapter_0;
static AdapterFromBus<BusType, NOCData> wadapter_0;
