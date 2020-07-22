/* Copyright (c) 2016 The Connectal Project
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

#define AW 32
#define DW 32
class BusType {
    void cyc(bool stb, bool we, __uint(AW) adr, __uint(DW) dat, __uint(DW/8) sel);
    bool ack();
    bool stall();
    bool err();
};

template<int OPT_ZERO_ON_IDLE, int F_OPT_CLK2FFLOGIC>
class WbPriArbiterIfc {
    BusType a;
    BusType b;
    BusType *o;
};

template<int OPT_ZERO_ON_IDLE, int F_OPT_CLK2FFLOGIC>
class WbPriArbiter __implements WbPriArbiterIfc<OPT_ZERO_ON_IDLE, F_OPT_CLK2FFLOGIC> {
    bool r_a_owner;

    void a.cyc(bool stb, bool we, __uint(AW) adr, __uint(DW) dat, __uint(DW/8) sel) {
       r_a_owner = true;
       this->o->cyc(stb, we, adr, dat, sel);
    }
    bool a.ack() {
        return this->o->ack() & r_a_owner;
    }
    bool a.stall() {
        return this->o->stall() | !r_a_owner;
    }
    bool a.err() {
        return this->o->err() & r_a_owner;
    }
    void b.cyc(bool stb, bool we, __uint(AW) adr, __uint(DW) dat, __uint(DW/8) sel) if (!__valid(this->a.cyc)) {
       r_a_owner = false;
       this->o->cyc(stb, we, adr, dat, sel);
    }
    bool b.ack() {
        return this->o->ack() & !r_a_owner;
    }
    bool b.stall() {
        return this->o->stall() | r_a_owner;
    }
    bool b.err() {
        return this->o->err() & !r_a_owner;
    }
};

WbPriArbiter<0, 1> dummy;
