// Copyright (c) 2020 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#ifndef _VPPS7_H_
#define _VPPS7_H_
class Pps7ddr {
    __inout  __uint(15)       A;
    __input  __uint(4)        ARB;
    __inout  __uint(3)        BA;
    __inout  __uint(1)        CASB;
    __inout  __uint(1)        CKE;
    __inout  __uint(1)        CKN;
    __inout  __uint(1)        CKP;
    __inout  __uint(1)        CSB;
    __inout  __uint(4)        DM;
    __inout  __uint(32)       DQ;
    __inout  __uint(4)        DQSN;
    __inout  __uint(4)        DQSP;
    __inout  __uint(1)        DRSTB;
    __inout  __uint(1)        ODT;
    __inout  __uint(1)        RASB;
    __inout  __uint(1)        VRN;
    __inout  __uint(1)        VRP;
    __inout  __uint(1)        WEB;
};
class Pps7dma {
    __input  __uint(1)        ACLK;
    __input  __uint(1)        DAREADY;
    __output __uint(2)        DATYPE;
    __output __uint(1)        DAVALID;
    __input  __uint(1)        DRLAST;
    __output __uint(1)        DRREADY;
    __input  __uint(2)        DRTYPE;
    __input  __uint(1)        DRVALID;
    __output __uint(1)        RSTN;
};
class Pps7emiocan {
    __input  __uint(1)        PHYRX;
    __output __uint(1)        PHYTX;
};
class Pps7emioenet {
    __input  __uint(1)        EXTINTIN;
    __input  __uint(1)        GMIICOL;
    __input  __uint(1)        GMIICRS;
    __input  __uint(1)        GMIIRXCLK;
    __input  __uint(8)        GMIIRXD;
    __input  __uint(1)        GMIIRXDV;
    __input  __uint(1)        GMIIRXER;
    __input  __uint(1)        GMIITXCLK;
    __output __uint(8)        GMIITXD;
    __output __uint(1)        GMIITXEN;
    __output __uint(1)        GMIITXER;
    __input  __uint(1)        MDIOI;
    __output __uint(1)        MDIOMDC;
    __output __uint(1)        MDIOO;
    __output __uint(1)        MDIOTN;
    __output __uint(1)        PTPDELAYREQRX;
    __output __uint(1)        PTPDELAYREQTX;
    __output __uint(1)        PTPPDELAYREQRX;
    __output __uint(1)        PTPPDELAYREQTX;
    __output __uint(1)        PTPPDELAYRESPRX;
    __output __uint(1)        PTPPDELAYRESPTX;
    __output __uint(1)        PTPSYNCFRAMERX;
    __output __uint(1)        PTPSYNCFRAMETX;
    __output __uint(1)        SOFRX;
    __output __uint(1)        SOFTX;
};
class Pps7emiogpio {
    __input  __uint(64)       I;
    __output __uint(64)       O;
    __output __uint(64)       TN;
};
class Pps7emioi2c {
    __input  __uint(1)        SCLI;
    __output __uint(1)        SCLO;
    __output __uint(1)        SCLTN;
    __input  __uint(1)        SDAI;
    __output __uint(1)        SDAO;
    __output __uint(1)        SDATN;
};
class Pps7emiopjtag {
    __input  __uint(1)        TCK;
    __input  __uint(1)        TDI;
    __output __uint(1)        TDO;
    __output __uint(1)        TDTN;
    __input  __uint(1)        TMS;
};
class Pps7emiosdio {
    __output __uint(1)        BUSPOW;
    __output __uint(3)        BUSVOLT;
    __input  __uint(1)        CDN;
    __output __uint(1)        CLK;
    __input  __uint(1)        CLKFB;
    __input  __uint(1)        CMDI;
    __output __uint(1)        CMDO;
    __output __uint(1)        CMDTN;
    __input  __uint(4)        DATAI;
    __output __uint(4)        DATAO;
    __output __uint(4)        DATATN;
    __output __uint(1)        LED;
    __input  __uint(1)        WP;
};
class Pps7emiospi {
    __input  __uint(1)        MI;
    __output __uint(1)        MO;
    __output __uint(1)        MOTN;
    __input  __uint(1)        SCLKI;
    __output __uint(1)        SCLKO;
    __output __uint(1)        SCLKTN;
    __input  __uint(1)        SI;
    __output __uint(1)        SO;
    __input  __uint(1)        SSIN;
    __output __uint(1)        SSNTN;
    __output __uint(3)        SSON;
    __output __uint(1)        STN;
};
class Pps7emiosramint {
    __input  __uint(1)        IN;
};
class Pps7emiotrace {
    __input  __uint(1)        CLK;
    __output __uint(1)        CTL;
    __output __uint(32)       DATA;
};
class Pps7emiottc {
    __input  __uint(3)        CLKI;
    __output __uint(3)        WAVEO;
};
class Pps7emiouart {
    __input  __uint(1)        CTSN;
    __input  __uint(1)        DCDN;
    __input  __uint(1)        DSRN;
    __output __uint(1)        DTRN;
    __input  __uint(1)        RIN;
    __output __uint(1)        RTSN;
    __input  __uint(1)        RX;
    __output __uint(1)        TX;
};
class Pps7emiousb {
    __output __uint(2)        PORTINDCTL;
    __input  __uint(1)        VBUSPWRFAULT;
    __output __uint(1)        VBUSPWRSELECT;
};
class Pps7emiowdt {
    __input  __uint(1)        CLKI;
    __output __uint(1)        RSTO;
};
class Pps7event {
    __input  __uint(1)        EVENTI;
    __output __uint(1)        EVENTO;
    __output __uint(2)        STANDBYWFE;
    __output __uint(2)        STANDBYWFI;
};
class Pps7fclk {
    __output __uint(4)        CLK;
    __input  __uint(4)        CLKTRIGN;
    __output __uint(4)        RESETN;
};
class Pps7fpgaid {
    __input  __uint(1)        LEN;
};
class Pps7ftmd {
    __input  __uint(4)        TRACEINATID;
    __input  __uint(1)        TRACEINCLOCK;
    __input  __uint(32)       TRACEINDATA;
    __input  __uint(1)        TRACEINVALID;
};
class Pps7ftmt {
    __input  __uint(32)       F2PDEBUG;
    __input  __uint(4)        F2PTRIG;
    __output __uint(4)        F2PTRIGACK;
    __output __uint(32)       P2FDEBUG;
    __output __uint(4)        P2FTRIG;
    __input  __uint(4)        P2FTRIGACK;
};
class Pps7irq {
    __input  __uint(20)       F2P;
    __output __uint(29)       P2F;
};
class Pps7maxigp {
    __input  __uint(1)        ACLK;
    __output __uint(32)       ARADDR;
    __output __uint(2)        ARBURST;
    __output __uint(4)        ARCACHE;
    __output __uint(1)        ARESETN;
    __output __uint(12)       ARID;
    __output __uint(4)        ARLEN;
    __output __uint(2)        ARLOCK;
    __output __uint(3)        ARPROT;
    __output __uint(4)        ARQOS;
    __input  __uint(1)        ARREADY;
    __output __uint(2)        ARSIZE;
    __output __uint(1)        ARVALID;
    __output __uint(32)       AWADDR;
    __output __uint(2)        AWBURST;
    __output __uint(4)        AWCACHE;
    __output __uint(12)       AWID;
    __output __uint(4)        AWLEN;
    __output __uint(2)        AWLOCK;
    __output __uint(3)        AWPROT;
    __output __uint(4)        AWQOS;
    __input  __uint(1)        AWREADY;
    __output __uint(2)        AWSIZE;
    __output __uint(1)        AWVALID;
    __input  __uint(12)       BID;
    __output __uint(1)        BREADY;
    __input  __uint(2)        BRESP;
    __input  __uint(1)        BVALID;
    __input  __uint(32)       RDATA;
    __input  __uint(12)       RID;
    __input  __uint(1)        RLAST;
    __output __uint(1)        RREADY;
    __input  __uint(2)        RRESP;
    __input  __uint(1)        RVALID;
    __output __uint(32)       WDATA;
    __output __uint(12)       WID;
    __output __uint(1)        WLAST;
    __input  __uint(1)        WREADY;
    __output __uint(4)        WSTRB;
    __output __uint(1)        WVALID;
};
class Pps7ps {
    __inout  __uint(1)        CLK;
    __inout  __uint(1)        PORB;
    __inout  __uint(1)        SRSTB;
};
class Pps7saxiacp {
    __input  __uint(1)        ACLK;
    __input  __uint(32)       ARADDR;
    __input  __uint(2)        ARBURST;
    __input  __uint(4)        ARCACHE;
    __output __uint(1)        ARESETN;
    __input  __uint(3)        ARID;
    __input  __uint(4)        ARLEN;
    __input  __uint(2)        ARLOCK;
    __input  __uint(3)        ARPROT;
    __input  __uint(4)        ARQOS;
    __output __uint(1)        ARREADY;
    __input  __uint(2)        ARSIZE;
    __input  __uint(5)        ARUSER;
    __input  __uint(1)        ARVALID;
    __input  __uint(32)       AWADDR;
    __input  __uint(2)        AWBURST;
    __input  __uint(4)        AWCACHE;
    __input  __uint(3)        AWID;
    __input  __uint(4)        AWLEN;
    __input  __uint(2)        AWLOCK;
    __input  __uint(3)        AWPROT;
    __input  __uint(4)        AWQOS;
    __output __uint(1)        AWREADY;
    __input  __uint(2)        AWSIZE;
    __input  __uint(5)        AWUSER;
    __input  __uint(1)        AWVALID;
    __output __uint(3)        BID;
    __input  __uint(1)        BREADY;
    __output __uint(2)        BRESP;
    __output __uint(1)        BVALID;
    __output __uint(64)       RDATA;
    __output __uint(3)        RID;
    __output __uint(1)        RLAST;
    __input  __uint(1)        RREADY;
    __output __uint(2)        RRESP;
    __output __uint(1)        RVALID;
    __input  __uint(64)       WDATA;
    __input  __uint(3)        WID;
    __input  __uint(1)        WLAST;
    __output __uint(1)        WREADY;
    __input  __uint(8)        WSTRB;
    __input  __uint(1)        WVALID;
};
class Pps7saxigp {
    __input  __uint(1)        ACLK;
    __input  __uint(32)       ARADDR;
    __input  __uint(2)        ARBURST;
    __input  __uint(4)        ARCACHE;
    __output __uint(1)        ARESETN;
    __input  __uint(6)        ARID;
    __input  __uint(4)        ARLEN;
    __input  __uint(2)        ARLOCK;
    __input  __uint(3)        ARPROT;
    __input  __uint(4)        ARQOS;
    __output __uint(1)        ARREADY;
    __input  __uint(2)        ARSIZE;
    __input  __uint(1)        ARVALID;
    __input  __uint(32)       AWADDR;
    __input  __uint(2)        AWBURST;
    __input  __uint(4)        AWCACHE;
    __input  __uint(6)        AWID;
    __input  __uint(4)        AWLEN;
    __input  __uint(2)        AWLOCK;
    __input  __uint(3)        AWPROT;
    __input  __uint(4)        AWQOS;
    __output __uint(1)        AWREADY;
    __input  __uint(2)        AWSIZE;
    __input  __uint(1)        AWVALID;
    __output __uint(6)        BID;
    __input  __uint(1)        BREADY;
    __output __uint(2)        BRESP;
    __output __uint(1)        BVALID;
    __output __uint(32)       RDATA;
    __output __uint(6)        RID;
    __output __uint(1)        RLAST;
    __input  __uint(1)        RREADY;
    __output __uint(2)        RRESP;
    __output __uint(1)        RVALID;
    __input  __uint(32)       WDATA;
    __input  __uint(6)        WID;
    __input  __uint(1)        WLAST;
    __output __uint(1)        WREADY;
    __input  __uint(4)        WSTRB;
    __input  __uint(1)        WVALID;
};
class Pps7saxihp {
    __input  __uint(1)        ACLK;
    __input  __uint(32)       ARADDR;
    __input  __uint(2)        ARBURST;
    __input  __uint(4)        ARCACHE;
    __output __uint(1)        ARESETN;
    __input  __uint(6)        ARID;
    __input  __uint(4)        ARLEN;
    __input  __uint(2)        ARLOCK;
    __input  __uint(3)        ARPROT;
    __input  __uint(4)        ARQOS;
    __output __uint(1)        ARREADY;
    __input  __uint(2)        ARSIZE;
    __input  __uint(1)        ARVALID;
    __input  __uint(32)       AWADDR;
    __input  __uint(2)        AWBURST;
    __input  __uint(4)        AWCACHE;
    __input  __uint(6)        AWID;
    __input  __uint(4)        AWLEN;
    __input  __uint(2)        AWLOCK;
    __input  __uint(3)        AWPROT;
    __input  __uint(4)        AWQOS;
    __output __uint(1)        AWREADY;
    __input  __uint(2)        AWSIZE;
    __input  __uint(1)        AWVALID;
    __output __uint(6)        BID;
    __input  __uint(1)        BREADY;
    __output __uint(2)        BRESP;
    __output __uint(1)        BVALID;
    __output __uint(3)        RACOUNT;
    __output __uint(8)        RCOUNT;
    __output __uint(64)       RDATA;
    __input  __uint(1)        RDISSUECAP1EN;
    __output __uint(6)        RID;
    __output __uint(1)        RLAST;
    __input  __uint(1)        RREADY;
    __output __uint(2)        RRESP;
    __output __uint(1)        RVALID;
    __output __uint(6)        WACOUNT;
    __output __uint(8)        WCOUNT;
    __input  __uint(64)       WDATA;
    __input  __uint(6)        WID;
    __input  __uint(1)        WLAST;
    __output __uint(1)        WREADY;
    __input  __uint(1)        WRISSUECAP1EN;
    __input  __uint(8)        WSTRB;
    __input  __uint(1)        WVALID;
};
class Pps7PS7 {
    Pps7ddr          DDR;
    Pps7dma          DMA0;
    Pps7dma          DMA1;
    Pps7dma          DMA2;
    Pps7dma          DMA3;
    Pps7emiocan      EMIOCAN0;
    Pps7emiocan      EMIOCAN1;
    Pps7emioenet     EMIOENET0;
    Pps7emioenet     EMIOENET1;
    Pps7emiogpio     EMIOGPIO;
    Pps7emioi2c      EMIOI2C0;
    Pps7emioi2c      EMIOI2C1;
    Pps7emiopjtag    EMIOPJTAG;
    Pps7emiosdio     EMIOSDIO0;
    Pps7emiosdio     EMIOSDIO1;
    Pps7emiospi      EMIOSPI0;
    Pps7emiospi      EMIOSPI1;
    Pps7emiosramint  EMIOSRAMINT;
    Pps7emiotrace    EMIOTRACE;
    Pps7emiottc      EMIOTTC0;
    Pps7emiottc      EMIOTTC1;
    Pps7emiouart     EMIOUART0;
    Pps7emiouart     EMIOUART1;
    Pps7emiousb      EMIOUSB0;
    Pps7emiousb      EMIOUSB1;
    Pps7emiowdt      EMIOWDT;
    Pps7event        EVENT;
    Pps7fclk         FCLK;
    Pps7fpgaid       FPGAID;
    Pps7ftmd         FTMD;
    Pps7ftmt         FTMT;
    Pps7irq          IRQ;
    Pps7maxigp       MAXIGP0;
    Pps7maxigp       MAXIGP1;
    __inout  __uint(54) MIO;
    Pps7ps           PS;
    Pps7saxiacp      SAXIACP;
    Pps7saxigp       SAXIGP0;
    Pps7saxigp       SAXIGP1;
    Pps7saxihp       SAXIHP0;
    Pps7saxihp       SAXIHP1;
    Pps7saxihp       SAXIHP2;
    Pps7saxihp       SAXIHP3;
};
class PS7 __implements __verilog Pps7PS7;
#endif
