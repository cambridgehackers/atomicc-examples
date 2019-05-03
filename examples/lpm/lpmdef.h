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
#include "atomicc.h"
typedef int LookupAddr;
typedef int LookupResult;
typedef __uint(32) IPA;
typedef struct {
    __uint(4) ticket;
    __uint(16) IPA;
    __uint(3) state;
} ProcessData;

#define f1(A,B) A
#define f2(A,B) A
#define addr(IPA) (0/*base_addr*/ + __bitsubstr(IPA, 31, 16))
#define compute_addr(P, S, IPA) ((P) + ((S) == 1 ? __bitsubstr(IPA, 15, 8) : __bitsubstr(IPA, 7, 0)))
#define p(X) ((X & 1) == 1)

__interface TickIfc {
    __uint(4) getTicket(void);
    void allocateTicket(void);
};

__emodule BufTicket {
    TickIfc tickIfc;
};

__interface LpmMem {
    void req(IPA v);
    void resAccept(void);
    IPA resValue(void);
};

__emodule LpmMemory {
    LpmMem ifc;
};
