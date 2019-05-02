/* Copyright (c) 2019 The Connectal Project
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
/* Test program for example from:
 *     http://csg.csail.mit.edu/pubs/memos/Memo-500/memo500.pdf
 *     (Originally from: http://csg.csail.mit.edu/pubs/memos/Memo-473/memo473.pdf )
 */
#include "fifo.h"
#include "mux.h"
#include "lpmdef.h"

/* For reference, s/w implementation of LPM:
int lpm(IPA ipa)
{
    int p;
    p = RAM[rootTableBase + ipa[31:16]];
    if (isLeaf(p) return p;
    p = RAM[p + ipa[15:8]];
    if (isLeaf(p) return p;
    p = RAM[p + ipa[7:0]];
    return p;    // must be a leaf
}
*/

__interface LpmRequest {
    void       enter(IPA x);
};

__module Lpm {
    LpmRequest          request;
    BufTicket    compBuf;
    Fifo1<IPA>   inQ;
    FifoB1<ProcessData>   fifo;
    PipeIn<IPA> *outQ;
    LpmMemory           mem;
    Lpm() {
        __rule recirc if (!p(mem.ifc.resValue())) {
            auto x = mem.ifc.resValue();
            auto y = fifo.out.first();
            mem.ifc.resAccept();
	    mem.ifc.req(compute_addr(x, y.state, y.IPA));
	    fifo.out.deq();
	    fifo.in.enq(ProcessData{y.ticket, y.IPA, y.state + 1});
        };
        __rule exitr if (p(mem.ifc.resValue()) & !__valid(RULE$recirc)) {
            auto x = mem.ifc.resValue();
            auto y = fifo.out.first();
            mem.ifc.resAccept();
	    fifo.out.deq();
	    outQ->enq(f1(x,y));
        };
        __rule enter if (!__valid(RULE$recirc)) {
            auto x = inQ.out.first();
            auto ticket = compBuf.tickIfc.getTicket();
            compBuf.tickIfc.allocateTicket();
            inQ.out.deq();
	    fifo.in.enq(ProcessData{ticket, static_cast<__uint(16)>(__bitsubstr(x, 15, 0)), 0});
	    mem.ifc.req(addr(x));
        };
    };
    void request.enter(IPA x) {
	inQ.in.enq(x);
    }
};

Lpm test;
