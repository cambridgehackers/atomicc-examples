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
#include "VIOBUF.h"
#include "axiTop.h"
#include "clockTop.h"
#include "bscan.h"

class ZynqClock {
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
class ZynqInterrupt {
    __input __uint(1)  interrupt;
    __input __uint(1)  CLK;
    __input __uint(1)  nRST;
};
class I2C_Pins {
    __inout __uint(1) scl;
    __inout __uint(1) sda;
};

class P7WrapIfc {
    ZynqClock        _;
    ZynqInterrupt    intr;
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;
    __inout  __uint(54) MIO;
    Pps7fclk         FCLK;
    I2C_Pins         i2c0;
    I2C_Pins         i2c1;
};

class P7Wrap __implements P7WrapIfc {
    PS7 pps;
    ClockTop pclockTop;
    IOBUF tsda0;
    IOBUF tscl0;
    IOBUF tsda1;
    IOBUF tscl1;
    __connect FCLK = pps.FCLK;

    void MAXIGP0_I.R(__uint(32) data, __uint(12) id, bool last, __uint(2) resp) if (pps.MAXIGP0.RREADY) {
        pps.MAXIGP0.RDATA = data;
        pps.MAXIGP0.RID = id;
        pps.MAXIGP0.RLAST = last;
        pps.MAXIGP0.RRESP = resp;
    }
    void MAXIGP0_I.B(__uint(12) id, __uint(2) resp) if (pps.MAXIGP0.BREADY) {
        pps.MAXIGP0.BID = id;
        pps.MAXIGP0.BRESP = resp;
    }
    __rule init {
        tscl0.T = ~pps.EMIOI2C0.SCLTN;
        tscl0.I = pps.EMIOI2C0.SCLO;
        pps.EMIOI2C0.SCLI = tscl0.O;
        i2c0.scl = tscl0.IO;
        tsda0.T = ~pps.EMIOI2C0.SDATN;
        tsda0.I = pps.EMIOI2C0.SDAO;
        pps.EMIOI2C0.SDAI = tsda0.O;
        i2c0.sda = tsda0.IO;

        tscl1.T = ~pps.EMIOI2C1.SCLTN;
        tscl1.I = pps.EMIOI2C1.SCLO;
        pps.EMIOI2C1.SCLI = tscl1.O;
        i2c1.scl = tscl1.IO;
        tsda1.T = ~pps.EMIOI2C1.SDATN;
        tsda1.I = pps.EMIOI2C1.SDAO;
        pps.EMIOI2C1.SDAI = tsda1.O;
        i2c1.sda = tsda1.IO;

        MIO = pps.MIO;
        pps.FPGAID.LEN = 1;
        pps.MAXIGP0.ACLK = __defaultClock;
        //pps.MAXIGP0.ARESETN = 1;
        pps.MAXIGP0.RVALID = __valid(MAXIGP0_I.R);
        pps.MAXIGP0.BVALID = __valid(MAXIGP0_I.B);
        pps.MAXIGP0.ARREADY = __ready(MAXIGP0_O->AR);
        pps.MAXIGP0.AWREADY = __ready(MAXIGP0_O->AW);
        pps.MAXIGP0.WREADY = __ready(MAXIGP0_O->W);
        _.DDR_Addr = pps.DDR.A;
        _.DDR_BankAddr = pps.DDR.BA;
        _.DDR_CAS_n = pps.DDR.CASB;
        _.DDR_CKE = pps.DDR.CKE;
        _.DDR_Clk_n = pps.DDR.CKN;
        _.DDR_Clk_p = pps.DDR.CKP;
        _.DDR_CS_n = pps.DDR.CSB;
        _.DDR_DM = pps.DDR.DM;
        _.DDR_DQ = pps.DDR.DQ;
        _.DDR_DQS_n = pps.DDR.DQSN;
        _.DDR_DQS_p = pps.DDR.DQSP;
        _.DDR_DRSTB = pps.DDR.DRSTB;
        _.DDR_ODT = pps.DDR.ODT;
        _.DDR_RAS_n = pps.DDR.RASB;
        _.FIXED_IO_ddr_vrn = pps.DDR.VRN;
        _.FIXED_IO_ddr_vrp = pps.DDR.VRP;
        _.DDR_WEB = pps.DDR.WEB;
        _.FIXED_IO_ps_clk = pps.PS.CLK;
        _.FIXED_IO_ps_porb = pps.PS.PORB;
        _.FIXED_IO_ps_srstb = pps.PS.SRSTB;
        pps.DDR.ARB = 0;
        pps.IRQ.F2P = intr.interrupt;
        __defaultClock = intr.CLK;
        __defaultnReset = intr.nRST;
        pclockTop.CLK = __defaultClock;
        pclockTop.nRST = __defaultnReset;
        //pclockTop.clockOut;
    }
    __rule gp0ar if (pps.MAXIGP0.ARVALID) {
        MAXIGP0_O->AR(pps.MAXIGP0.ARADDR, pps.MAXIGP0.ARID, pps.MAXIGP0.ARLEN);
    }
    __rule gp0aw if (pps.MAXIGP0.AWVALID) {
        MAXIGP0_O->AW(pps.MAXIGP0.AWADDR, pps.MAXIGP0.AWID, pps.MAXIGP0.AWLEN);
    }
    __rule gp0w if (pps.MAXIGP0.WVALID) {
        MAXIGP0_O->W(pps.MAXIGP0.WDATA, pps.MAXIGP0.WID, pps.MAXIGP0.WLAST);
    }
};
class ZynqTopIFC {
    ZynqClock        _;
    __inout  __uint(54) MIO;
    __inout  __uint(1) I2C0_scl;
    __inout  __uint(1) I2C0_sda;
    __inout  __uint(1) I2C1_scl;
    __inout  __uint(1) I2C1_sda;
};

class __topModule ZynqTop __implements ZynqTopIFC {
    P7Wrap           ps7_ps7_foo;
    AxiTop          test;
    BUFG ps7_fclk_0_c;
    BUFG ps7_freset_0_r;
    __connect test.MAXIGP0_O = ps7_ps7_foo.MAXIGP0_O;
    __connect test.MAXIGP0_I = ps7_ps7_foo.MAXIGP0_I;
    __connect _ = ps7_ps7_foo._;
    __rule init {
        MIO = ps7_ps7_foo.MIO;
        ps7_fclk_0_c.I = __bitsubstr(ps7_ps7_foo.FCLK.CLK, 0, 0);
        __defaultClock = ps7_fclk_0_c.O;
        ps7_freset_0_r.I = __bitsubstr(ps7_ps7_foo.FCLK.RESETN, 0, 0);
        __defaultnReset = ps7_freset_0_r.O;
        ps7_ps7_foo.intr.interrupt = test._.interrupt;
        ps7_ps7_foo.intr.CLK = __defaultClock;
        ps7_ps7_foo.intr.nRST = __defaultnReset;
        test._.CLK = __defaultClock;
        test._.nRST = __defaultnReset;
        ps7_ps7_foo.i2c0.scl = I2C0_scl;
        ps7_ps7_foo.i2c0.sda = I2C0_sda;
        ps7_ps7_foo.i2c1.scl = I2C1_scl;
        ps7_ps7_foo.i2c1.sda = I2C1_sda;
    }
    // trace readout to bscan
    Bscan<3,32> bscan;
    bool resetFunnel;
    __uint(32) selectIndex;
    __implements bscan.fromBscan readUser;
    void readUser.enq(__uint(32) v) { // data from jtag
        resetFunnel = (v != -1);
        selectIndex = v;
    }
    __rule resetOneShot if (resetFunnel) {
        resetFunnel = false;
    }
    //__rule callBack {
        // send to trace buffer to jtag
        //bscan.toBscan.enq(test.__traceMemory$out.first());
    //}
};
