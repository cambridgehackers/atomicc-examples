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
#include "iobufVec.h"

class Ft600 {
  __input __int(1) usb_clk;
  __input __int(1) usb_rxf;
  __input __int(1) usb_txe;
  __output __int(1) usb_rd_n;
  __output __int(1) usb_wr_n;
  __output __int(1) usb_oe_n;
  __inout __int(16) usb_ad;
};

class ModFt600 {
    Ft600 _;
    __int(1) usb_fifo_empty;
    __int(2) usb_rxf_delay;
    __int(1) usb_txe_delay;
    IobufVec<16> iov;

    __rule handshake {
        _.usb_rd_n = (usb_rxf_delay != 0);
        _.usb_oe_n = (usb_rxf_delay & 1);
        _.usb_wr_n = usb_txe_delay | usb_fifo_empty | ~(usb_rxf_delay & 1);
        usb_fifo_empty = 0;
        usb_rxf_delay = (usb_rxf_delay << 1) | _.usb_rxf;
        usb_txe_delay = _.usb_txe;
        _.usb_ad = iov._.IO;
        iov._.T = _.usb_oe_n;
    }
};

// Kahn Process Network (KPN)
// Kahn, 1974
// (i) each component process in a KPN is monotonic and continuous
// and (ii) communications between such processes are infinitely buffered
// then (iii) entire system is deterministic and deadlock-free
// Kahn, G.: The Semantics of a Simple Language for Parallel Programming.
Information Processing, 471-475 (1974)

//https://books.google.com/books?id=7X8dHYev6OUC&pg=PA288&lpg=PA288&dq=techrep0716.pdf&source=bl&ots=8c7rvAXIJq&sig=ACfU3U2M_WQ3U2MLHJUXtshzgTlvhd7fNg&hl=en&sa=X&ved=2ahUKEwitqIy60vnkAhUJrp4KHUFxCG4Q6AEwAHoECAQQAQ#v=onepage&q=techrep0716.pdf&f=false
// page 278
// TLA+
(1) variables: i0, i1, o0, o1
i0, i1, o0, o1 element List of Packets
(2) Init: i0 = i1 = o0 = o1 = (),

3) Act R0:
    let pack = i0.first
    i0 != <>
    ^ (pack[0] = 0) -> (!o0.full)
    ^ (pack[0] = 1) -> (!o1.full)
4) ->
    <
    i0' = i0.deq;
    o0' = ((pack[0]= 0) ? o0.enq(pack) : o0);
    o1' = ((pack[1] = 0) ? o1.enq(pack));
    >
5) Act R1:
    let pack1 = i0.first
    let pack2 = i1.first
    i1 != <>
     ^ (pack2[0] = 0) -> (!o0.full)
     ^ (pack2[0] = 1) -> (!o1.full)
     ^ !(pack1[0] = pack2[0])
6) ->
    <
    i1' = i1.deq;
    o0' = ((pack2[0] = 0) ? o0.enq(pack2) : o0
    o1' = ((pack2[0] = 0) ? o1 : o1.enq(pack2)
    >
7)  | Act R0 \/ Act R1 | <i0, i1, o0, o1>
//
//

// Automatic Generation of Control Logic with Bluespec SystemVerilog
    __rule r0 {
        x = i0.first;
        if (x[0] == 0)
            o0.enq(x);
        else
            o1.enq(x);
        i0.deq();
        if (x[3:1] == 0)
            c = c + 1;
    }

    __rule r1 {
        x = i1.first;
        if (x[0] == 0)
            o0.enq(x);
        else
            o1.enq(x);
        i1.deq();
        if (x[3:1] == 0)
            c = c + 1;
    }
