/* Copyright (c) 2020 The Connectal Project
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include "spi.h"
#include "clockDiv.h"

template<int width>
class SPIMasterInternal __implements SPIMasterIfc<width> {
   __uint(width) shiftreg;
   __uint(__clog2(width)+1) countreg;

   __rule running if (countreg > 0) {
      countreg = countreg - 1;
      __uint(width) newshiftreg = __bitconcat(__bitsubstr(shiftreg, width-2, 0), this->miso);
      shiftreg = newshiftreg;
      if (countreg == 1)
         this->response->enq(newshiftreg);
   }

   void request.enq(__uint(width) v) if (countreg == 0) {
       shiftreg = v;
       countreg = width;
   }

   __rule init {
       this->mosi = __bitsubstr(shiftreg, width-1);
       this->clock = !__defaultClock;
   }
};

template<int width>
class SPIMaster __implements SPIMasterIfc<width> {
   ClockDiv#(width=10,upper=1010,lower=10) clockDivider;
   SPIMasterInternal<width> spi;
   __implements spi.response spiresponse;
   //Reset slowReset = mkAsyncResetFromCR(2, clockDivider.slowClock);
   void request.enq(__uint(width) v) {
   }
   void spiresponse.enq(__uint(width) v) {
   }
   __rule init {
      clockDivider.CLK = __defaultClock;
      clockDivider.nRST = __defaultnReset;
      spi.CLK = clockDivider.CLK_OUT;
      spi.nRST = __defaultnReset;
    //PipeIn<__uint(width)> request;
    //PipeIn<__uint(width)> *response;
      this->clock = spi.clock;
      this->mosi = spi.mosi;
      spi.miso = this->miso;
   }
};

SPIMaster<26> dummySpi;
