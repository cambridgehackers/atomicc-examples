/* Copyright (c) 2014 Quanta Research Cambridge, Inc
 * Copyright (c) 2019 The Connectal Project
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

typedef int LookupAddr;
typedef int LookupResult;
typedef struct {
    LookupAddr addr;
    LookupResult b;
    int c; // for c++ , need to generate std::copy [20];
} LookupItem;

__interface LpmRequest {
    void enter(int addr);
};

__interface LpmMem {
    void req(LookupItem v);
    void resAccept(void);
    LookupItem resValue(void);
};

__emodule LpmMemory {
    LpmMem ifc;
};

__module LpmMemory {
    LpmMem ifc;
    int delayCount;
    LookupItem saved;
    void ifc.req(LookupItem v) if (delayCount == 0) { delayCount = 4; saved = v; }
    void ifc.resAccept(void) if (delayCount == 1) { delayCount = 0;}
    LookupItem ifc.resValue(void) if (delayCount == 1) { return saved; }
    LpmMemory() {
        __rule memdelay_rule if (delayCount > 1) { delayCount = delayCount - 1; };
    }
};

__module Lpm {
    LpmRequest request;
    Fifo1<LookupItem> inQ;
    Fifo1<LookupItem> fifo;
    PipeIn<LookupItem> *outQ;
    LpmMemory        mem;
    void request.enter(LookupAddr addr) {
        LookupItem temp;
        temp.addr = addr;
        inQ.in.enq(temp);
    }
    Lpm() {
        printf("Lpm: this %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(Lpm));
            __rule recirc {
                LookupItem temp = fifo.out.first();
                LookupItem mtemp = mem.ifc.resValue();
                mem.ifc.resAccept();
	        fifo.out.deq();
printf("recirc: (%d, %d)\n", temp.addr, temp.b);
	        fifo.in.enq(mtemp);
	        mem.ifc.req(temp);
                };
            __rule exit_rule {
                LookupItem temp = fifo.out.first();
                LookupItem mtemp = mem.ifc.resValue();
                mem.ifc.resAccept();
	        fifo.out.deq();
printf("exit: (%d, %d)\n", temp.addr, temp.b);
	        outQ->enq(temp);
                };
            __rule enter {
                LookupItem temp = inQ.out.first();
printf("enter: (%d, %d)\n", temp.addr, temp.b);
	        inQ.out.deq();
	        fifo.in.enq(temp);
	        mem.ifc.req(temp);
                };
            atomiccSchedulePriority("recirc", "enter;exit", 0);
    };
};

Lpm lpmbase;
