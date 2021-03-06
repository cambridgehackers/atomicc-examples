/* Copyright (c) 2016,2018 The Connectal Project
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
#include "atomicc.h"
#include "VIOBUF.h"

class Ft600 {
  //changed __input __int(1) CLK;
  //changed __input __int(1) nRST;
  __input __int(1) usb_clk;
  __input __int(1) usb_rxf;
  __input __int(1) usb_txe;
  __output __int(1) usb_rd_n;
  __output __int(1) usb_wr_n;
  __output __int(1) usb_oe_n;
  __inout __int(16) usb_ad;
};

class ModFt600 __implements Ft600 {
    __int(1) usb_fifo_empty;
    __int(2) usb_rxf_delay;
    __int(1) usb_txe_delay;

    IOBUF iobufs[16];

    ModFt600() {
        __rule handshake {
	  usb_rd_n = (usb_rxf_delay != 0);
	  usb_oe_n = (usb_rxf_delay & 1);
	  usb_wr_n = usb_txe_delay | usb_fifo_empty | ~(usb_rxf_delay & 1);
	  
	  usb_fifo_empty = 0;
	  usb_rxf_delay = (usb_rxf_delay << 1) | usb_rxf;
	  usb_txe_delay = usb_txe;
        }
	__rule iobufs {
	    for (int i = 0; i < 16; i++)
	        iobufs[i].IO = usb_ad >> i;
        }
    }
};
static ModFt600 dummy;  // need to run constructor
