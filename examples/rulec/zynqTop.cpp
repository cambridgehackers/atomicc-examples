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
#include "userTop.h"

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
    MMCME2_ADV#(BANDWIDTH = "OPTIMIZED",
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
    __input __uint(1)  CLK;
    __input __uint(1)  nRST;
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
};

__interface MaxiO {
    void AR(__uint(32) addr, __uint(12) id, __uint(4) len);
    void AW(__uint(32) addr, __uint(12) id, __uint(4) len);
    void W(__uint(32) data, __uint(12) id, __uint(1) last);
};

__interface MaxiI {
    void R(__uint(32) data, __uint(12) id, __uint(1) last, __uint(2) resp);
    void B(__uint(12) id, __uint(2) resp);
};
__module P7Wrap {
    ZynqClock        _;
    ZynqInterrupt    intr;
    Pps7m            M;
    Pps7fclk         FCLK;
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;

    PS7 pps;
    ClockTop pclockTop;
    __forward M = pps._.M;
    __forward FCLK = pps._.FCLK;

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
    P7Wrap() {
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
            pclockTop._.userCLK = __defaultClock;
            pclockTop._.usernRST = __defaultnReset;
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
    }
};

typedef __uint(5) AXIAddr;
typedef __uint(6) AXIId;
typedef __uint(4) AXICount;
typedef struct {
    AXIId      id;
    AXICount   count;
    AXIAddr    addr;
} AddrCount;
typedef struct {
  __uint(1) last;
  AddrCount ac;
} PortalInfo;
typedef struct {
  AXIId      id;
  BusType    data;
} ReadResp;
typedef struct {
  BusType    data;
} BusData;

__interface TestPins {
    __output __uint(1) interrupt;
    __input __uint(1)  CLK;
    __input __uint(1)  nRST;
};

__module TestTop {
    TestPins          _;
    MaxiO             MAXIGP0_O;
    MaxiI            *MAXIGP0_I;
    __uint(1) intEnable, writeNotFirst, writeLast;
    __uint(1) readNotFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
    AXICount readCount, writeCount;
    AXIAddr readAddr, writeAddr;

    Fifo1<AddrCount>  reqArs, reqAws;
    Fifo1<PortalInfo> readBeat,writeBeat;
    Fifo1<ReadResp>   readData;
    Fifo1<BusData>    writeData;
    Fifo1<AXIId>      writeDone;
    UserTop user;

    void MAXIGP0_O.AR(__uint(32) addr, __uint(12) id, __uint(4) len) {
        reqArs.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalRControl = __bitsubstr(addr, 11, 5) == 0;
        selectRIndReq = __bitsubstr(addr, 12);
    }
    void MAXIGP0_O.AW(__uint(32) addr, __uint(12) id, __uint(4) len) {
        reqAws.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalWControl = __bitsubstr(addr, 11, 5) == 0;
        selectWIndReq = __bitsubstr(addr, 12);
    }
    void MAXIGP0_O.W(__uint(32) data, __uint(12) id, __uint(1) last) {
        writeData.in.enq(BusData{data});
    }
    PipeInB<BusType> readUser;
    BusType requestValue, portalCtrlInfo;
    bool haveUser;
    __uint(1) writeReady;
    void readUser.enq(BusType v) if (!haveUser) {
        requestValue = v;
        haveUser = true;
    }
    __connect readUser = user.read;

    TestTop() {
        __rule init {
           _.interrupt = haveUser && intEnable;
           writeReady = __ready(user.write.enq);
        }
        __rule lread {
            auto temp = readBeat.out.first();
            readBeat.out.deq();
            BusType res;
#if 1
            switch (temp.ac.addr) {
              case 0: res = requestValue; haveUser = false; break;
              case 4: res = writeReady; break; //__ready(user.write.enq);
              default: res = 0; break;
            }
            readData.in.enq(ReadResp{temp.ac.id, portalRControl ? portalCtrlInfo : res});
#else
            if (!portalRControl && temp.ac.addr == 0)
                haveUser = false;
            readData.in.enq(ReadResp{temp.ac.id, portalCtrlInfo});
#endif
        }
        __rule lreadNext {
            auto temp = reqArs.out.first();
            auto readAddrupdate = readNotFirst ? readAddr : temp.addr;
            AXICount readburstCount = readNotFirst ? readCount : temp.count;
            __uint(1) readLastNext = readNotFirst ? readLast : temp.count == 1;
            auto zzIntrChannel = !selectRIndReq && haveUser;
            //if (portalRControl)
            switch (readAddrupdate) {
              case 0: portalCtrlInfo = zzIntrChannel; break;
              case 8: portalCtrlInfo = 1; break;
              case 0xc: portalCtrlInfo = zzIntrChannel; break;
              case 0x10: portalCtrlInfo = selectRIndReq ? 6 : 5; break;
              case 0x14: portalCtrlInfo = 2; break;
              default: portalCtrlInfo = 0; break;
            }
#if 0
            else
            switch (readAddrupdate) {
              case 0: portalCtrlInfo = requestValue; break;
              case 4: portalCtrlInfo = writeReady; break; //__ready(user.write.enq);
              default: portalCtrlInfo = 0; break;
            }
#endif
            readBeat.in.enq(PortalInfo{readLastNext, temp.id, readburstCount, readAddrupdate});
            readAddr = readAddrupdate + 4 ;
            readCount = readburstCount - 1 ;
            readNotFirst = !readLastNext;
            readLast = readburstCount == 2 ;
            if (readLastNext)
                reqArs.out.deq();
        }
        __rule lR {
            auto temp = readData.out.first();
            readData.out.deq();
            MAXIGP0_I->R(temp.data, temp.id, 1, 0);
        }
        __rule lwrite {
            auto wb = writeBeat.out.first();
            writeBeat.out.deq();
            auto temp = writeData.out.first();
            writeData.out.deq();
            if (wb.last)
                writeDone.in.enq(wb.ac.id);
            if (!portalWControl)
                user.write.enq(temp.data, wb.ac.addr != 0);
            else if (wb.ac.addr == 4)
                intEnable = __bitsubstr(temp.data, 0, 0);
        }
        __rule lwriteNext {
            auto temp = reqAws.out.first();
            auto writeAddrupdate = writeNotFirst ? writeAddr : temp.addr;
            AXICount writeburstCount = writeNotFirst ? writeCount : temp.count;
            __uint(1) writeLastNext = writeNotFirst ? writeLast : temp.count == 1;
            writeBeat.in.enq(PortalInfo{writeLastNext, temp.id, writeburstCount, writeAddrupdate});
            writeAddr = writeAddrupdate + 4 ;
            writeCount = writeburstCount - 1 ;
            writeNotFirst = !writeLastNext ;
            writeLast = writeburstCount == 2 ;
            if (writeLastNext)
                reqAws.out.deq();
        }
        __rule writeResponse {
            MAXIGP0_I->B(writeDone.out.first(), 0);
            writeDone.out.deq();
        }
    }
};

__module ZynqTop {
    ZynqClock        _;
    ZynqInterrupt    intr;
    Pps7m            M;
    Pps7fclk         FCLK;
    P7Wrap zt;
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;

    __forward MAXIGP0_O = zt.MAXIGP0_O;
    __forward MAXIGP0_I = zt.MAXIGP0_I;
    __forward _ = zt._;
    __forward intr = zt.intr;
    __forward M = zt.M;
    __forward FCLK = zt.FCLK;
};

__module ZynqTopNew {
    ZynqClock        _;
    Pps7m            M;
    Pps7fclk         FCLK;
    P7Wrap zt;
    TestTop test;
    __connect test.MAXIGP0_O = zt.MAXIGP0_O;
    __connect test.MAXIGP0_I = zt.MAXIGP0_I;
    __connect test._ = zt.intr;
    __connect test._.CLK = _.CLK;
    __connect test._.nRST = _.nRST;
    __forward _ = zt._;
    __forward M = zt.M;
    __forward FCLK = zt.FCLK;
};

ZynqTopNew Ttest;
ZynqTop ztest;
