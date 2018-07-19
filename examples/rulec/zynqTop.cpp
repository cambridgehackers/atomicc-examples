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
    Pps7m            M;
    Pps7fclk         FCLK;
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;

    PS7 pps;
    ClockTop pclockTop;
    __connect M = pps._.M;
    __connect FCLK = pps._.FCLK;

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
            pps._.IRQ.F2P = _.interrupt;
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

typedef __uint(5)  AXIAddr;
typedef __uint(6)  AXIId;
typedef __uint(10) AXICount;
typedef __uint(32) AXIData;
typedef struct {
    AXIAddr    addr;
    AXICount   count;
    AXIId      id;
} AddrCount;
typedef struct {
  AddrCount ac;
  __uint(1) last;
} PortalInfo;
typedef struct {
  AXIData    data;
  AXIId      id;
} ReadResp;
typedef struct {
  __uint(2) resp;
  __uint(12) id;
} WriteResp;
typedef struct {
  AXIData    data;
} WriteData;

__module TestTop {
    MaxiO             MAXIGP0_O; 
    MaxiI            *MAXIGP0_I; 
    //.interrupt(read$enq__ENA && intEnable),
  //readFirst <= 1'd1;
  //writeFirst <= 1'd1;
 
    __uint(1) intEnable, writeFirst, writeLast; 
    __uint(1) readFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl; 
    AXIData requestValue, portalCtrlInfo; 
    AXICount readCount, writeCount; 
    AXIAddr readAddr, writeAddr; 
 
    Fifo1<AddrCount>  reqArs, reqAws; 
    Fifo1<PortalInfo> readBeat,writeBeat; 
    Fifo1<ReadResp>   readData; 
    Fifo1<WriteData>  writeData; 
    Fifo1<AXIId>      writeDone; 

    void MAXIGP0_O.AR(__uint(32) addr, __uint(12) id, __uint(4) len) {
        //reqArs.enq({ addr[4:0], { 4'd0, len + 4'd1, 2'd0 }, id[5:0]})
        //portalRControl = MAXIGP0_O$AR$addr[11:5] == 7'd0;
        //selectRIndReq = MAXIGP0_O$AR$addr[12];
    }
    void MAXIGP0_O.AW(__uint(32) addr, __uint(12) id, __uint(4) len) {
        //reqAws.enq({addr[4:0], { 4'd0, len + 4'd1, 2'd0 }, id[5:0] });
        //portalWControl = MAXIGP0_O$AW$addr[11:5] == 7'd0;
        //selectWIndReq = MAXIGP0_O$AW$addr[12];
    }
    void MAXIGP0_O.W(__uint(32) data, __uint(12) id, __uint(1) last) {
        //writeData.enq(data);
    }
#if 0
    UserTop user; 
    TestTop() {
        __rule init {
        }
        __rule lread if (readBeat$DeqRDY && readData$EnqRDY) {
            {readBeat$addr, readBeat$base, readBeat$id, readBeat$last} = readBeat.first();
            readBeat.deq();
            auto zzIntrChannel = !selectRIndReq && read$enq__ENA;
            case (readBeat$addr)
              0: requestValue = read$enq$v;
              4: requestValue = write$enq__RDY;
              default: requestValue = 0;
            endcase
            case (readBeat$addr)
              0: portalCtrlInfo = zzIntrChannel; // PORTAL_CTRL_INTERRUPT_STATUS 0
              //4: portalCtrlInfo = 0;//31'd0, intEnable; // PORTAL_CTRL_INTERRUPT_ENABLE 1
              8: portalCtrlInfo = 1;                         // PORTAL_CTRL_NUM_TILES        2
              5'h0C: portalCtrlInfo = zzIntrChannel;         // PORTAL_CTRL_IND_QUEUE_STATUS 3
              5'h10: portalCtrlInfo = selectRIndReq ? 6 : 5; // PORTAL_CTRL_PORTAL_ID        4
              5'h14: portalCtrlInfo = 2;                     // PORTAL_CTRL_NUM_PORTALS      5
              //5'h18: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_MSB      6
              //5'h1C: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_LSB      7
              default: portalCtrlInfo = 0;
            endcase
            .read$enq__RDY(RULEread && !portalRControl)
             user.read.enq(read$enq$v), .read$enq$last(), .read$enq__ENA(read$enq__ENA);
            readData.enq({portalRControl ? portalCtrlInfo : requestValue, readBeat$id});
        }
        __rule lreadNext if (MAXIGP0_O$AR__RDY && readBeat$EnqRDY) {
        {reqArs$addr, reqArs$count, reqArs$id}
            auto temp = reqArs.first();
            if (readFirstNext)
                reqArs.deq();
            auto readAddrupdate = readFirst ?  reqArs$addr : readAddr ;
            auto readburstCount = readFirst ?  { 2'd0, reqArs$count[9:2] } : readCount ;
            auto readFirstNext = readFirst ? reqArs$count == 4  : readLast ;
            readBeat.enq({readAddrupdate, readburstCount, temp.id, readFirstNext});
            readAddr <= readAddrupdate + 4 ;
            readCount <= readburstCount - 1 ;
            readFirst <= readFirstNext;
            readLast <= readburstCount == 2 ;
        }
        __rule lR {
            auto temp = readData.first(); readData.deq();
            MAXIGP0_I->R(temp.data, temp.id, 1, 0);
        }
        __rule lwrite if ((!writeBeat$last || writeDone$EnqRDY) && (!selectWIndReq || portalWControl)) {
            if (writeBeat$last)
                writeDone.enq( writeBeat$id);
            {writeBeat$addr, writeBeat$count, writeBeat$id, writeBeat$last} = writeBeat.first(); writeBeat.deq();
            write$enq$v = writeData.first(); writeData.deq();
            if (portalWControl && writeBeat$addr == 4)
                intEnable <= write$enq$v[0];
            if (!portalWControl)
                user.write.enq(write$enq$v, writeBeat$addr != 0);
        }
        __rule lwriteNext {
            auto writeAddrupdate = writeFirst ?  reqAws$addr : writeAddr ;
            auto writeburstCount = writeFirst ?  { 2'd0, reqAws$count[9:2] } : writeCount ;
            auto writeFirstNext = writeFirst ?  reqAws$count == 4 : writeLast ;
            {reqAws$addr, reqAws$count, reqAws$id} = reqAws.first();
            if (writeFirstNext)
                 reqAws.deq();
            writeBeat.enq({ writeAddrupdate, writeburstCount, reqAws$id, writeFirstNext });
            writeAddr <= writeAddrupdate + 4 ;
            writeCount <= writeburstCount - 1 ;
            writeFirst <= writeFirstNext ;
            writeLast <= writeburstCount == 2 ;
        }
        __rule writeResponse {
            MAXIGP0_I->B(writeDone.first(), 0);
            writeDone.deq();
        }
    }
#endif
};

__module ZynqTop {
    ZynqClock        _;
    Pps7m            M;
    Pps7fclk         FCLK;
    P7Wrap zt;
#if 1
    MaxiO            *MAXIGP0_O;
    MaxiI            MAXIGP0_I;

    __connect MAXIGP0_O = zt.MAXIGP0_O;
    __connect MAXIGP0_I = zt.MAXIGP0_I;
#else
    TestTop test;
    __connect test.MAXIGP0_O = zt.MAXIGP0_O;
    __connect test.MAXIGP0_I = zt.MAXIGP0_I;
#endif
    __connect _ = zt._;
    __connect M = zt.M;
    __connect FCLK = zt.FCLK;
};


ZynqTop ztest;
