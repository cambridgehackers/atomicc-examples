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
#include "fwb.h"

#define F_LGDEPTH 4
class FwbSlaveIfc {
    BusRequestType a;
    BusStatusType *status;
    __uint(F_LGDEPTH) f_nreqs();
    __uint(F_LGDEPTH) f_nacks();
    __uint(F_LGDEPTH) f_outstanding();
};

class FwbSlave __implements FwbSlaveIfc {
    bool f_past_valid;
    __uint(F_LGDEPTH) nreqs;
    __uint(F_LGDEPTH) nacks;
    __shared bool stb_share;
    __shared bool we_share;
    __shared __uint(AW) addr_share;
    __shared __uint(DW) data_share;
    __shared __uint(DW/8) sel_share;

    void a.cyc(bool stb, bool we, __uint(AW) addr, __uint(DW) data, __uint(DW/8) sel) {
        stb_share = stb;
        we_share = we;
        addr_share = addr;
        data_share = data;
        sel_share = sel;
    }
    __uint(F_LGDEPTH) f_nreqs() {
        return nreqs;
    }
    __uint(F_LGDEPTH) f_nacks() {
        return nacks;
    }
    __uint(F_LGDEPTH) f_outstanding() {
        return __valid(a.cyc) ? (f_nreqs() - f_nacks()) : 0;
    }
    __rule init {
        f_past_valid = true;
    }
    __rule init2 {
        if (!__valid(a.cyc))
            nacks = 0;
    }
    __rule init3 {
        if (status->ack() || status->err())
            nacks++;
    }
    __rule init4 {
        if (!__valid(a.cyc))
            nreqs = 0;
        if (stb_share && !status->stall())
            nreqs++;
    }

// initial __assert(!__defaultnReset)
// initial __assume(!__valid(a.cyc))
// initial __assume(!stb_share)
// initial __assert(!status->ack())
// initial __assert(!status->err())
    __rule verify {
        if (!f_past_valid)
              __assert(!__defaultnReset);
        if (f_past_valid && $past(!__defaultnReset)) {
              __assume(!__valid(a.cyc));
              __assume(!stb_share);
              __assert(!status->ack());
              __assert(!status->err());
        }
        if (f_past_valid && $past(status->err()) && $past(__valid(a.cyc)))
              __assume(!__valid(a.cyc));
        if (stb_share)
              __assume(__valid(a.cyc));
        if (f_past_valid && $past(__defaultnReset) && $past(stb_share) && $past(status->stall()) && __valid(a.cyc)) {
              __assume(stb_share);
              __assume(we_share == $past(we_share));
              __assume(addr_share == $past(addr_share));
              __assume(sel_share == $past(sel_share));
              if (we_share)
                  __assume(data_share == $past(data_share));
        }
        if (f_past_valid && $past(stb_share) && stb_share)
            __assume(we_share == $past(we_share));
        if (f_past_valid && f_outstanding() > 0)
            __assume(we_share == $past(we_share));
        //if (stb_share && we_share)
        //    __assume(__reduce("|", sel_share));
        if (f_past_valid && !$past(__valid(a.cyc)) && !__valid(a.cyc)) {
            __assert(!status->ack());
            __assert(!status->err());
        }
        __assert(!status->ack() || !status->err());
        __assert(f_outstanding() < (1 << F_LGDEPTH) - 1);
        if (__valid(a.cyc) && f_outstanding() == 0) {
            __assert(!status->ack() || (stb_share && !status->stall()));
            __assert(!status->err() || (stb_share && !status->stall()));
        }
    }
};

