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
//#include "mux.h"
#include "bram.h"

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
#define CLASSB_MSB 9   // 31
#define CLASSB_LSB 6   // 16
#define CLASSC_MSB (CLASSB_LSB-1)
#define CLASSC_LSB 3   //  8
#define CLASSD_MSB (CLASSC_LSB-1)
#define CLASSD_LSB 0   //  0

#define f1(A,B) A
#define f2(A,B) A
#define isLeaf(X) ((X & 1) == 1)
#define BASE_ADDR  0

typedef int LookupAddr;
typedef int LookupResult;
typedef __uint(32) IPA;
typedef struct {
    __uint(4)      ticket;
    __uint(16)     IPA;
    __uint(3)      state;
} ProcessData;

class TickIfc {
    __uint(4)      getTicket(void);
    void           allocateTicket(void);
};
class BufTicket __implements TickIfc {
    __uint(4) current;
    __uint(4) getTicket(void) {
        return current;
    }
    void allocateTicket(void) {
        printf("BufTicket allocateTicket %x\n", current);
        current++;
    }
};
class LpmMemIfc {
    void read(__uint(32) addr);
    void write(__uint(32) addr, __uint(32) data);
    PipeOut<__uint(32)> out;
};
class LpmMem __implements LpmMemIfc {
    BRAM<32, 1024> RAM;
    bool           valid;

    void read(__uint(32) addr) if (!valid) {
        printf("LpmMem read: %x\n", addr);
        RAM.read(addr);
        valid = true;
    }
    __uint(32) out.first(void) if (valid) {
        return RAM.dataOut();
    }
    void out.deq(void) if (valid) {
        printf("LpmMem out.deq:\n");
        //printf("LpmMem out.deq: data %x\n", RAM.dataOut());
//out.first());
        valid = false;
    }
    void write(__uint(32) addr, __uint(32) data) {
        RAM.write(addr, data);
    }
};

class LpmIfc {
    void         enter(IPA x);
    PipeIn<IPA> *outQ;
    void write(__uint(32) addr, __uint(32) data);
};

class Lpm __implements LpmIfc {
    Fifo1<IPA>          inQ;
    BufTicket           compBuf;
    Fifo1<ProcessData> fifo;
    LpmMem              mem;
    void enter(IPA x) {
	inQ.in.enq(x);
    }
    __rule enterRule if (!__valid(RULE$recircRule)) {
        auto x = inQ.out.first();
        __uint(4) ticket = compBuf.getTicket();
        printf("enterRule: in %x ticket %x\n", x, ticket);
        compBuf.allocateTicket();
        inQ.out.deq();
	fifo.in.enq(ProcessData{ticket, static_cast<__uint(16)>(__bitsubstr(x, CLASSC_MSB, CLASSD_LSB)), 0});
	mem.read(BASE_ADDR + __bitsubstr(x, CLASSB_MSB, CLASSB_LSB));
    };
    __rule recircRule if (!isLeaf(mem.out.first())) {
        auto x = mem.out.first();
        auto y = fifo.out.first();
        printf("recircRule: mem %x fifo: ticket %x IPA %x state %x\n", x, y.ticket, y.IPA, y.state);
        mem.out.deq();
	mem.read((x + (y.state == 1 ? __bitsubstr(y.IPA, CLASSC_MSB, CLASSC_LSB) : __bitsubstr(y.IPA, CLASSD_MSB, CLASSD_LSB))));
	fifo.out.deq();
	fifo.in.enq(ProcessData{y.ticket, y.IPA, y.state + 1});
    };
    __rule exitRule if (isLeaf(mem.out.first()) & !__valid(RULE$recircRule)) {
        auto x = mem.out.first();
        auto y = fifo.out.first();
        printf("exitRule: mem %x fifo: ticket %x IPA %x state %x\n", x, y.ticket, y.IPA, y.state);
	outQ->enq(f1(x, y));
        mem.out.deq();
	fifo.out.deq();
    };
    void write(__uint(32) addr, __uint(32) data) {
        mem.write(addr, data);
    }
};

// Testbench
class LpmRequest {
    void enter(__uint(32) data);
    void write(__uint(32) addr, __uint(32) data);
};
class LpmIndication {
    void out(__uint(32) data);
};
class LpmTestIfc {
    __software LpmRequest request;
    __software LpmIndication *indication;
};

class LpmTest __implements LpmTestIfc {
    Lpm test;
    void request.enter(__uint(32) data) {
        test.enter(data);
    }
    void request.write(__uint(32) addr, __uint(32) data) {
        test.write(addr, data);
    }
    __implements test.outQ response;
    void response.enq(IPA v) {
        indication->out(v);
    }
};

