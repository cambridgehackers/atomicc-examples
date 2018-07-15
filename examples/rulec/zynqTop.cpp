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
#include "VMMCME2_ADV.h"
#include "VPPS7.h"
#include "VBUFG.h"
#include "VResetInverter.h"

__interface ClockIfc {
   __parameter float   CLKIN1_PERIOD;
   __input  __uint(1)  userCLK;
   __input  __uint(1)  usernRST;
   __output __uint(1)  clockOut;
};

__module ResetInverter {
    MResetInverterResetInverter _;
    ResetInverter() {
    __rule init {
        _.RESET_OUT = !_.RESET_IN;
    }
    }
};

__module ClockTop {
    ClockIfc _;
    MMCME2_ADV#( BANDWIDTH = "OPTIMIZED",
        CLKFBOUT_USE_FINE_PS = "FALSE", CLKOUT0_USE_FINE_PS = "FALSE",
        CLKOUT1_USE_FINE_PS = "FALSE", CLKOUT2_USE_FINE_PS = "FALSE",
        CLKOUT3_USE_FINE_PS = "FALSE", CLKOUT4_USE_FINE_PS = "FALSE",
        CLKOUT5_USE_FINE_PS = "FALSE", CLKOUT6_USE_FINE_PS = "FALSE",
        CLKOUT4_CASCADE = "FALSE",
        COMPENSATION = "ZHOLD", STARTUP_WAIT = "FALSE",
        CLKFBOUT_MULT_F = 10.0, CLKFBOUT_PHASE = 0.0,
        CLKIN1_PERIOD = 10.0, CLKIN2_PERIOD = 0.0, DIVCLK_DIVIDE = 1,
        CLKOUT0_DIVIDE_F = 5.0, CLKOUT0_DUTY_CYCLE = 0.5, CLKOUT0_PHASE = 0.0,
        CLKOUT1_DIVIDE = 10, CLKOUT1_DUTY_CYCLE = 0.5, CLKOUT1_PHASE = 0.0,
        CLKOUT2_DIVIDE = 10, CLKOUT2_DUTY_CYCLE = 0.5, CLKOUT2_PHASE = 0.0,
        CLKOUT3_DIVIDE = 10, CLKOUT3_DUTY_CYCLE = 0.5, CLKOUT3_PHASE = 0.0,
        CLKOUT4_DIVIDE = 10, CLKOUT4_DUTY_CYCLE = 0.5, CLKOUT4_PHASE = 0.0,
        CLKOUT5_DIVIDE = 10, CLKOUT5_DUTY_CYCLE = 0.5, CLKOUT5_PHASE = 0.0,
        CLKOUT6_DIVIDE = 10, CLKOUT6_DUTY_CYCLE = 0.5, CLKOUT6_PHASE = 0.0,
        REF_JITTER1 = 1.0e-2, REF_JITTER2 = 1.0e-2) ps7_clockGen_pll;
    ResetInverter rinverter;
    BUFG clkbuf;
    BUFG clkbuf0;
    ClockTop() {
        __rule init {
        ps7_clockGen_pll._.CLKIN2 = 0;
        ps7_clockGen_pll._.CLKINSEL = 1;
        ps7_clockGen_pll._.DADDR = 0;
        ps7_clockGen_pll._.DCLK = 0;
        ps7_clockGen_pll._.DEN = 0;
        ps7_clockGen_pll._.DI = 0;
        ps7_clockGen_pll._.DWE = 0;
        ps7_clockGen_pll._.PSCLK = 0;
        ps7_clockGen_pll._.PSEN = 0;
        ps7_clockGen_pll._.PSINCDEC = 0;
        ps7_clockGen_pll._.PWRDWN = 0;
        clkbuf._.I = ps7_clockGen_pll._.CLKFBOUT;
        _.clockOut = clkbuf0._.O;
        ps7_clockGen_pll._.CLKFBIN = clkbuf._.O;
        rinverter._.RESET_IN = _.usernRST;
        ps7_clockGen_pll._.RST = rinverter._.RESET_OUT;
        clkbuf0._.I = ps7_clockGen_pll._.CLKOUT0;
        ps7_clockGen_pll._.CLKIN1 = _.userCLK;
        __defaultClock = _.userCLK;
        __defaultnReset = _.usernRST;
        };
    }
};

__interface ZynqClock {
    __output __uint(1) CLK;
    __output __uint(1) nRST;
    __output __uint(4) FCLKCLK;
};

__module ZynqTop {
    ZynqClock        _;
    Pps7ddr          DDR;
    Pps7irq          IRQ;
    Pps7m            M;
    Pps7maxigp       MAXIGP0;
    Pps7ps           PS;

    PS7 pps;
    BUFG ps7_fclk_0_c;
    BUFG ps7_freset_0_r;
    __connect DDR = pps._.DDR;
    __connect IRQ = pps._.IRQ;
    __connect PS = pps._.PS;
    __connect M = pps._.M;
    __connect MAXIGP0 = pps._.MAXIGP0;
    ZynqTop() {
       __rule init {
            ps7_fclk_0_c._.I = pps._.FCLK.CLK; // [0]
            __defaultClock = ps7_fclk_0_c._.O;
            ps7_freset_0_r._.I = pps._.FCLK.RESETN; // [0]
            __defaultnReset = ps7_freset_0_r._.O;
            pps._.FPGAID.LEN = 1;
            pps._.MAXIGP0.ACLK = __defaultClock;
            pps._.MAXIGP1.ACLK = __defaultClock;
            pps._.SAXIACP.ACLK = __defaultClock;
            pps._.SAXIGP0.ACLK = __defaultClock;
            pps._.SAXIGP1.ACLK = __defaultClock;
            pps._.SAXIHP0.ACLK = __defaultClock;
            pps._.SAXIHP1.ACLK = __defaultClock;
            pps._.SAXIHP2.ACLK = __defaultClock;
            pps._.SAXIHP3.ACLK = __defaultClock;
            _.FCLKCLK = pps._.FCLK.CLK;
        }
    }
};

ClockTop ctest;
ZynqTop ztest;
