/* Copyright (c) 2018 The Connectal Project
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
#include "VPPS7.h"
#include "VBUFG.h"
#include "testTop.h"
#include "clockTop.h"

__interface ZynqClock {
    __inout __uint(15) DDR_Addr;
    __inout __uint(3)  DDR_BankAddr;
    __inout __uint(1)  DDR_CAS_n;
    __inout __uint(1)  DDR_CKE;
    __inout __uint(1)  DDR_Clk_n;
    __inout __uint(1)  DDR_Clk_p;
    __inout __uint(1)  DDR_CS_n;
    __inout __uint(4)  DDR_DM;
    __inout __uint(32) DDR_DQ;
    __inout __uint(4)  DDR_DQS_n;
    __inout __uint(4)  DDR_DQS_p;
    __inout __uint(1)  DDR_DRSTB;
    __inout __uint(1)  DDR_ODT;
    __inout __uint(1)  DDR_RAS_n;
    __inout __uint(1)  FIXED_IO_ddr_vrn;
    __inout __uint(1)  FIXED_IO_ddr_vrp;
    __inout __uint(1)  DDR_WEB;
    __inout __uint(1)  FIXED_IO_ps_clk;
    __inout __uint(1)  FIXED_IO_ps_porb;
    __inout __uint(1)  FIXED_IO_ps_srstb;
};
__interface ZynqInterrupt {
    __input __uint(1)  interrupt;
    __input __uint(1)  CLK;
    __input __uint(1)  nRST;
};
__module P7Wrap {
    ZynqClock        _;
    ZynqInterrupt    intr;
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;

    PS7 pps;
    ClockTop pclockTop;
    Pps7m            M = pps._.M;
    Pps7fclk         FCLK = pps._.FCLK;

    void MAXIGP0_I.R(__uint(32) data, __uint(12) id, __uint(1) last, __uint(2) resp) if (pps._.MAXIGP0.RREADY) {
        pps._.MAXIGP0.RDATA = data;
        pps._.MAXIGP0.RID = id;
        pps._.MAXIGP0.RLAST = last;
        pps._.MAXIGP0.RRESP = resp;
    }
    void MAXIGP0_I.B(__uint(12) id, __uint(2) resp) if (pps._.MAXIGP0.BREADY) {
        pps._.MAXIGP0.BID = id;
        pps._.MAXIGP0.BRESP = resp;
    }
       __rule init {
            pps._.FPGAID.LEN = 1;
            pps._.MAXIGP0.ACLK = __defaultClock;
            //pps._.MAXIGP0.ARESETN = 1;
            pps._.MAXIGP0.RVALID = __valid(MAXIGP0_I.R);
            pps._.MAXIGP0.BVALID = __valid(MAXIGP0_I.B);
            pps._.MAXIGP0.ARREADY = __ready(MAXIGP0_O->AR);
            pps._.MAXIGP0.AWREADY = __ready(MAXIGP0_O->AW);
            pps._.MAXIGP0.WREADY = __ready(MAXIGP0_O->W);
            _.DDR_Addr = pps._.DDR.A;
            _.DDR_BankAddr = pps._.DDR.BA;
            _.DDR_CAS_n = pps._.DDR.CASB;
            _.DDR_CKE = pps._.DDR.CKE;
            _.DDR_Clk_n = pps._.DDR.CKN;
            _.DDR_Clk_p = pps._.DDR.CKP;
            _.DDR_CS_n = pps._.DDR.CSB;
            _.DDR_DM = pps._.DDR.DM;
            _.DDR_DQ = pps._.DDR.DQ;
            _.DDR_DQS_n = pps._.DDR.DQSN;
            _.DDR_DQS_p = pps._.DDR.DQSP;
            _.DDR_DRSTB = pps._.DDR.DRSTB;
            _.DDR_ODT = pps._.DDR.ODT;
            _.DDR_RAS_n = pps._.DDR.RASB;
            _.FIXED_IO_ddr_vrn = pps._.DDR.VRN;
            _.FIXED_IO_ddr_vrp = pps._.DDR.VRP;
            _.DDR_WEB = pps._.DDR.WEB;
            _.FIXED_IO_ps_clk = pps._.PS.CLK;
            _.FIXED_IO_ps_porb = pps._.PS.PORB;
            _.FIXED_IO_ps_srstb = pps._.PS.SRSTB;
            pps._.DDR.ARB = 0;
            pps._.IRQ.F2P = intr.interrupt;
            __defaultClock = intr.CLK;
            __defaultnReset = intr.nRST;
            pclockTop._.CLK = __defaultClock;
            pclockTop._.nRST = __defaultnReset;
            //pclockTop._.clockOut;
       }
       __rule gp0ar if (pps._.MAXIGP0.ARVALID) {
           MAXIGP0_O->AR(pps._.MAXIGP0.ARADDR, pps._.MAXIGP0.ARID, pps._.MAXIGP0.ARLEN);
       }
       __rule gp0aw if (pps._.MAXIGP0.AWVALID) {
           MAXIGP0_O->AW(pps._.MAXIGP0.AWADDR, pps._.MAXIGP0.AWID, pps._.MAXIGP0.AWLEN);
       }
       __rule gp0w if (pps._.MAXIGP0.WVALID) {
           MAXIGP0_O->W(pps._.MAXIGP0.WDATA, pps._.MAXIGP0.WID, pps._.MAXIGP0.WLAST);
       }
};

__module ZynqTop {
    P7Wrap           ps7_ps7_foo;
    TestTop          test;
    BUFG ps7_fclk_0_c;
    BUFG ps7_freset_0_r;
    __connect test.MAXIGP0_O = ps7_ps7_foo.MAXIGP0_O;
    __connect test.MAXIGP0_I = ps7_ps7_foo.MAXIGP0_I;
    ZynqClock        _ = ps7_ps7_foo._;
    Pps7m            M = ps7_ps7_foo.M;
    __rule init {
        ps7_fclk_0_c._.I = ps7_ps7_foo.FCLK.CLK; // [0]
        __defaultClock = ps7_fclk_0_c._.O;
        ps7_freset_0_r._.I = ps7_ps7_foo.FCLK.RESETN; // [0]
        __defaultnReset = ps7_freset_0_r._.O;
        ps7_ps7_foo.intr.interrupt = test._.interrupt;
        ps7_ps7_foo.intr.CLK = __defaultClock;
        ps7_ps7_foo.intr.nRST = __defaultnReset;
        test._.CLK = __defaultClock;
        test._.nRST = __defaultnReset;
    }
};
