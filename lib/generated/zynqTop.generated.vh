`ifndef __zynqTop_GENERATED__VH__
`define __zynqTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __ZynqInterruptT_DEF__
`define __ZynqInterruptT_DEF__
interface ZynqInterruptT;
    logic  CLK;
    logic  nRST;
    logic  interrupt;
    modport server (output interrupt);
    modport client (input  interrupt);
endinterface
`endif
`ifndef __MaxiO_DEF__
`define __MaxiO_DEF__
interface MaxiO;
    logic AR__ENA;
    logic [32 - 1:0] AR$addr;
    logic [12 - 1:0] AR$id;
    logic [4 - 1:0] AR$len;
    logic AR__RDY;
    logic AW__ENA;
    logic [32 - 1:0] AW$addr;
    logic [12 - 1:0] AW$id;
    logic [4 - 1:0] AW$len;
    logic AW__RDY;
    logic W__ENA;
    logic [32 - 1:0] W$data;
    logic [12 - 1:0] W$id;
    logic  W$last;
    logic W__RDY;
    modport server (input  AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    output AR__RDY, AW__RDY, W__RDY);
    modport client (output AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    input  AR__RDY, AW__RDY, W__RDY);
endinterface
`endif
`ifndef __MaxiI_DEF__
`define __MaxiI_DEF__
interface MaxiI;
    logic R__ENA;
    logic [32 - 1:0] R$data;
    logic [12 - 1:0] R$id;
    logic  R$last;
    logic [2 - 1:0] R$resp;
    logic R__RDY;
    logic B__ENA;
    logic [12 - 1:0] B$id;
    logic [2 - 1:0] B$resp;
    logic B__RDY;
    modport server (input  R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    output R__RDY, B__RDY);
    modport client (output R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    input  R__RDY, B__RDY);
endinterface
`endif
`ifndef __MbufgBUFG_DEF__
`define __MbufgBUFG_DEF__
interface MbufgBUFG;
    logic  I;
    logic  O;
    modport server (input  I,
                    output O);
    modport client (output I,
                    input  O);
endinterface
`endif
`ifndef __ClockIfc_DEF__
`define __ClockIfc_DEF__
interface ClockIfc;
    logic  CLK;
    logic  nRST;
    logic  clockOut;
    modport server (output clockOut);
    modport client (input  clockOut);
endinterface
`endif
`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __ZynqClock_DEF__
`define __ZynqClock_DEF__
interface ZynqClock;
    logic [15 - 1:0] DDR_Addr;
    logic [3 - 1:0] DDR_BankAddr;
    logic  DDR_CAS_n;
    logic  DDR_CKE;
    logic  DDR_Clk_n;
    logic  DDR_Clk_p;
    logic  DDR_CS_n;
    logic [4 - 1:0] DDR_DM;
    logic [32 - 1:0] DDR_DQ;
    logic [4 - 1:0] DDR_DQS_n;
    logic [4 - 1:0] DDR_DQS_p;
    logic  DDR_DRSTB;
    logic  DDR_ODT;
    logic  DDR_RAS_n;
    logic  FIXED_IO_ddr_vrn;
    logic  FIXED_IO_ddr_vrp;
    logic  DDR_WEB;
    logic  FIXED_IO_ps_clk;
    logic  FIXED_IO_ps_porb;
    logic  FIXED_IO_ps_srstb;
endinterface
`endif
`ifndef __ZynqInterrupt_DEF__
`define __ZynqInterrupt_DEF__
interface ZynqInterrupt;
    logic  interrupt;
    logic  CLK;
    logic  nRST;
    modport server (input  interrupt);
    modport client (output interrupt);
endinterface
`endif
`ifndef __Pps7m_DEF__
`define __Pps7m_DEF__
interface Pps7m;
    logic [54 - 1:0] IO;
endinterface
`endif
`ifndef __Pps7fclk_DEF__
`define __Pps7fclk_DEF__
interface Pps7fclk;
    logic [4 - 1:0] CLK;
    logic [4 - 1:0] CLKTRIGN;
    logic [4 - 1:0] RESETN;
    modport server (input  CLKTRIGN,
                    output RESETN);
    modport client (output CLKTRIGN,
                    input  RESETN);
endinterface
`endif
`ifndef __Pps7ddr_DEF__
`define __Pps7ddr_DEF__
interface Pps7ddr;
    logic [15 - 1:0] A;
    logic [4 - 1:0] ARB;
    logic [3 - 1:0] BA;
    logic  CASB;
    logic  CKE;
    logic  CKN;
    logic  CKP;
    logic  CSB;
    logic [4 - 1:0] DM;
    logic [32 - 1:0] DQ;
    logic [4 - 1:0] DQSN;
    logic [4 - 1:0] DQSP;
    logic  DRSTB;
    logic  ODT;
    logic  RASB;
    logic  VRN;
    logic  VRP;
    logic  WEB;
    modport server (input  ARB);
    modport client (output ARB);
endinterface
`endif
`ifndef __Pps7dma_DEF__
`define __Pps7dma_DEF__
interface Pps7dma;
    logic  ACLK;
    logic  DAREADY;
    logic [2 - 1:0] DATYPE;
    logic  DAVALID;
    logic  DRLAST;
    logic  DRREADY;
    logic [2 - 1:0] DRTYPE;
    logic  DRVALID;
    logic  RSTN;
    modport server (input  ACLK, DAREADY, DRLAST, DRTYPE, DRVALID,
                    output DATYPE, DAVALID, DRREADY, RSTN);
    modport client (output ACLK, DAREADY, DRLAST, DRTYPE, DRVALID,
                    input  DATYPE, DAVALID, DRREADY, RSTN);
endinterface
`endif
`ifndef __Pps7emiocan_DEF__
`define __Pps7emiocan_DEF__
interface Pps7emiocan;
    logic  PHYRX;
    logic  PHYTX;
    modport server (input  PHYRX,
                    output PHYTX);
    modport client (output PHYRX,
                    input  PHYTX);
endinterface
`endif
`ifndef __Pps7emioenet_DEF__
`define __Pps7emioenet_DEF__
interface Pps7emioenet;
    logic  EXTINTIN;
    logic  GMIICOL;
    logic  GMIICRS;
    logic  GMIIRXCLK;
    logic [8 - 1:0] GMIIRXD;
    logic  GMIIRXDV;
    logic  GMIIRXER;
    logic  GMIITXCLK;
    logic [8 - 1:0] GMIITXD;
    logic  GMIITXEN;
    logic  GMIITXER;
    logic  MDIOI;
    logic  MDIOMDC;
    logic  MDIOO;
    logic  MDIOTN;
    logic  PTPDELAYREQRX;
    logic  PTPDELAYREQTX;
    logic  PTPPDELAYREQRX;
    logic  PTPPDELAYREQTX;
    logic  PTPPDELAYRESPRX;
    logic  PTPPDELAYRESPTX;
    logic  PTPSYNCFRAMERX;
    logic  PTPSYNCFRAMETX;
    logic  SOFRX;
    logic  SOFTX;
    modport server (input  EXTINTIN, GMIICOL, GMIICRS, GMIIRXCLK, GMIIRXD, GMIIRXDV, GMIIRXER, GMIITXCLK, MDIOI,
                    output GMIITXD, GMIITXEN, GMIITXER, MDIOMDC, MDIOO, MDIOTN, PTPDELAYREQRX, PTPDELAYREQTX, PTPPDELAYREQRX, PTPPDELAYREQTX, PTPPDELAYRESPRX, PTPPDELAYRESPTX, PTPSYNCFRAMERX, PTPSYNCFRAMETX, SOFRX, SOFTX);
    modport client (output EXTINTIN, GMIICOL, GMIICRS, GMIIRXCLK, GMIIRXD, GMIIRXDV, GMIIRXER, GMIITXCLK, MDIOI,
                    input  GMIITXD, GMIITXEN, GMIITXER, MDIOMDC, MDIOO, MDIOTN, PTPDELAYREQRX, PTPDELAYREQTX, PTPPDELAYREQRX, PTPPDELAYREQTX, PTPPDELAYRESPRX, PTPPDELAYRESPTX, PTPSYNCFRAMERX, PTPSYNCFRAMETX, SOFRX, SOFTX);
endinterface
`endif
`ifndef __Pps7emiogpio_DEF__
`define __Pps7emiogpio_DEF__
interface Pps7emiogpio;
    logic [64 - 1:0] I;
    logic [64 - 1:0] O;
    logic [64 - 1:0] TN;
    modport server (input  I,
                    output O, TN);
    modport client (output I,
                    input  O, TN);
endinterface
`endif
`ifndef __Pps7emioi2c_DEF__
`define __Pps7emioi2c_DEF__
interface Pps7emioi2c;
    logic  SCLI;
    logic  SCLO;
    logic  SCLTN;
    logic  SDAI;
    logic  SDAO;
    logic  SDATN;
    modport server (input  SCLI, SDAI,
                    output SCLO, SCLTN, SDAO, SDATN);
    modport client (output SCLI, SDAI,
                    input  SCLO, SCLTN, SDAO, SDATN);
endinterface
`endif
`ifndef __Pps7emiopjtag_DEF__
`define __Pps7emiopjtag_DEF__
interface Pps7emiopjtag;
    logic  TCK;
    logic  TDI;
    logic  TDO;
    logic  TDTN;
    logic  TMS;
    modport server (input  TCK, TDI, TMS,
                    output TDO, TDTN);
    modport client (output TCK, TDI, TMS,
                    input  TDO, TDTN);
endinterface
`endif
`ifndef __Pps7emiosdio_DEF__
`define __Pps7emiosdio_DEF__
interface Pps7emiosdio;
    logic  BUSPOW;
    logic [3 - 1:0] BUSVOLT;
    logic  CDN;
    logic  CLK;
    logic  CLKFB;
    logic  CMDI;
    logic  CMDO;
    logic  CMDTN;
    logic [4 - 1:0] DATAI;
    logic [4 - 1:0] DATAO;
    logic [4 - 1:0] DATATN;
    logic  LED;
    logic  WP;
    modport server (input  CDN, CLKFB, CMDI, DATAI, WP,
                    output BUSPOW, BUSVOLT, CMDO, CMDTN, DATAO, DATATN, LED);
    modport client (output CDN, CLKFB, CMDI, DATAI, WP,
                    input  BUSPOW, BUSVOLT, CMDO, CMDTN, DATAO, DATATN, LED);
endinterface
`endif
`ifndef __Pps7emiospi_DEF__
`define __Pps7emiospi_DEF__
interface Pps7emiospi;
    logic  MI;
    logic  MO;
    logic  MOTN;
    logic  SCLKI;
    logic  SCLKO;
    logic  SCLKTN;
    logic  SI;
    logic  SO;
    logic  SSIN;
    logic  SSNTN;
    logic [3 - 1:0] SSON;
    logic  STN;
    modport server (input  MI, SCLKI, SI, SSIN,
                    output MO, MOTN, SCLKO, SCLKTN, SO, SSNTN, SSON, STN);
    modport client (output MI, SCLKI, SI, SSIN,
                    input  MO, MOTN, SCLKO, SCLKTN, SO, SSNTN, SSON, STN);
endinterface
`endif
`ifndef __Pps7emiosramint_DEF__
`define __Pps7emiosramint_DEF__
interface Pps7emiosramint;
    logic  IN;
    modport server (input  IN);
    modport client (output IN);
endinterface
`endif
`ifndef __Pps7emiotrace_DEF__
`define __Pps7emiotrace_DEF__
interface Pps7emiotrace;
    logic  CLK;
    logic  CTL;
    logic [32 - 1:0] DATA;
    modport server (output CTL, DATA);
    modport client (input  CTL, DATA);
endinterface
`endif
`ifndef __Pps7emiottc_DEF__
`define __Pps7emiottc_DEF__
interface Pps7emiottc;
    logic [3 - 1:0] CLKI;
    logic [3 - 1:0] WAVEO;
    modport server (input  CLKI,
                    output WAVEO);
    modport client (output CLKI,
                    input  WAVEO);
endinterface
`endif
`ifndef __Pps7emiouart_DEF__
`define __Pps7emiouart_DEF__
interface Pps7emiouart;
    logic  CTSN;
    logic  DCDN;
    logic  DSRN;
    logic  DTRN;
    logic  RIN;
    logic  RTSN;
    logic  RX;
    logic  TX;
    modport server (input  CTSN, DCDN, DSRN, RIN, RX,
                    output DTRN, RTSN, TX);
    modport client (output CTSN, DCDN, DSRN, RIN, RX,
                    input  DTRN, RTSN, TX);
endinterface
`endif
`ifndef __Pps7emiousb_DEF__
`define __Pps7emiousb_DEF__
interface Pps7emiousb;
    logic [2 - 1:0] PORTINDCTL;
    logic  VBUSPWRFAULT;
    logic  VBUSPWRSELECT;
    modport server (input  VBUSPWRFAULT,
                    output PORTINDCTL, VBUSPWRSELECT);
    modport client (output VBUSPWRFAULT,
                    input  PORTINDCTL, VBUSPWRSELECT);
endinterface
`endif
`ifndef __Pps7emiowdt_DEF__
`define __Pps7emiowdt_DEF__
interface Pps7emiowdt;
    logic  CLKI;
    logic  RSTO;
    modport server (input  CLKI,
                    output RSTO);
    modport client (output CLKI,
                    input  RSTO);
endinterface
`endif
`ifndef __Pps7event_DEF__
`define __Pps7event_DEF__
interface Pps7event;
    logic  EVENTI;
    logic  EVENTO;
    logic [2 - 1:0] STANDBYWFE;
    logic [2 - 1:0] STANDBYWFI;
    modport server (input  EVENTI,
                    output EVENTO, STANDBYWFE, STANDBYWFI);
    modport client (output EVENTI,
                    input  EVENTO, STANDBYWFE, STANDBYWFI);
endinterface
`endif
`ifndef __Pps7fpgaid_DEF__
`define __Pps7fpgaid_DEF__
interface Pps7fpgaid;
    logic  LEN;
    modport server (input  LEN);
    modport client (output LEN);
endinterface
`endif
`ifndef __Pps7ftmd_DEF__
`define __Pps7ftmd_DEF__
interface Pps7ftmd;
    logic [4 - 1:0] TRACEINATID;
    logic  TRACEINCLOCK;
    logic [32 - 1:0] TRACEINDATA;
    logic  TRACEINVALID;
    modport server (input  TRACEINATID, TRACEINCLOCK, TRACEINDATA, TRACEINVALID);
    modport client (output TRACEINATID, TRACEINCLOCK, TRACEINDATA, TRACEINVALID);
endinterface
`endif
`ifndef __Pps7ftmt_DEF__
`define __Pps7ftmt_DEF__
interface Pps7ftmt;
    logic [32 - 1:0] F2PDEBUG;
    logic [4 - 1:0] F2PTRIG;
    logic [4 - 1:0] F2PTRIGACK;
    logic [32 - 1:0] P2FDEBUG;
    logic [4 - 1:0] P2FTRIG;
    logic [4 - 1:0] P2FTRIGACK;
    modport server (input  F2PDEBUG, F2PTRIG, P2FTRIGACK,
                    output F2PTRIGACK, P2FDEBUG, P2FTRIG);
    modport client (output F2PDEBUG, F2PTRIG, P2FTRIGACK,
                    input  F2PTRIGACK, P2FDEBUG, P2FTRIG);
endinterface
`endif
`ifndef __Pps7irq_DEF__
`define __Pps7irq_DEF__
interface Pps7irq;
    logic [20 - 1:0] F2P;
    logic [29 - 1:0] P2F;
    modport server (input  F2P,
                    output P2F);
    modport client (output F2P,
                    input  P2F);
endinterface
`endif
`ifndef __Pps7maxigp_DEF__
`define __Pps7maxigp_DEF__
interface Pps7maxigp;
    logic  ACLK;
    logic [32 - 1:0] ARADDR;
    logic [2 - 1:0] ARBURST;
    logic [4 - 1:0] ARCACHE;
    logic  ARESETN;
    logic [12 - 1:0] ARID;
    logic [4 - 1:0] ARLEN;
    logic [2 - 1:0] ARLOCK;
    logic [3 - 1:0] ARPROT;
    logic [4 - 1:0] ARQOS;
    logic  ARREADY;
    logic [2 - 1:0] ARSIZE;
    logic  ARVALID;
    logic [32 - 1:0] AWADDR;
    logic [2 - 1:0] AWBURST;
    logic [4 - 1:0] AWCACHE;
    logic [12 - 1:0] AWID;
    logic [4 - 1:0] AWLEN;
    logic [2 - 1:0] AWLOCK;
    logic [3 - 1:0] AWPROT;
    logic [4 - 1:0] AWQOS;
    logic  AWREADY;
    logic [2 - 1:0] AWSIZE;
    logic  AWVALID;
    logic [12 - 1:0] BID;
    logic  BREADY;
    logic [2 - 1:0] BRESP;
    logic  BVALID;
    logic [32 - 1:0] RDATA;
    logic [12 - 1:0] RID;
    logic  RLAST;
    logic  RREADY;
    logic [2 - 1:0] RRESP;
    logic  RVALID;
    logic [32 - 1:0] WDATA;
    logic [12 - 1:0] WID;
    logic  WLAST;
    logic  WREADY;
    logic [4 - 1:0] WSTRB;
    logic  WVALID;
    modport server (input  ACLK, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY,
                    output ARADDR, ARBURST, ARCACHE, ARESETN, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID);
    modport client (output ACLK, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY,
                    input  ARADDR, ARBURST, ARCACHE, ARESETN, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID);
endinterface
`endif
`ifndef __Pps7ps_DEF__
`define __Pps7ps_DEF__
interface Pps7ps;
    logic  CLK;
    logic  PORB;
    logic  SRSTB;
endinterface
`endif
`ifndef __Pps7saxiacp_DEF__
`define __Pps7saxiacp_DEF__
interface Pps7saxiacp;
    logic  ACLK;
    logic [32 - 1:0] ARADDR;
    logic [2 - 1:0] ARBURST;
    logic [4 - 1:0] ARCACHE;
    logic  ARESETN;
    logic [3 - 1:0] ARID;
    logic [4 - 1:0] ARLEN;
    logic [2 - 1:0] ARLOCK;
    logic [3 - 1:0] ARPROT;
    logic [4 - 1:0] ARQOS;
    logic  ARREADY;
    logic [2 - 1:0] ARSIZE;
    logic [5 - 1:0] ARUSER;
    logic  ARVALID;
    logic [32 - 1:0] AWADDR;
    logic [2 - 1:0] AWBURST;
    logic [4 - 1:0] AWCACHE;
    logic [3 - 1:0] AWID;
    logic [4 - 1:0] AWLEN;
    logic [2 - 1:0] AWLOCK;
    logic [3 - 1:0] AWPROT;
    logic [4 - 1:0] AWQOS;
    logic  AWREADY;
    logic [2 - 1:0] AWSIZE;
    logic [5 - 1:0] AWUSER;
    logic  AWVALID;
    logic [3 - 1:0] BID;
    logic  BREADY;
    logic [2 - 1:0] BRESP;
    logic  BVALID;
    logic [64 - 1:0] RDATA;
    logic [3 - 1:0] RID;
    logic  RLAST;
    logic  RREADY;
    logic [2 - 1:0] RRESP;
    logic  RVALID;
    logic [64 - 1:0] WDATA;
    logic [3 - 1:0] WID;
    logic  WLAST;
    logic  WREADY;
    logic [8 - 1:0] WSTRB;
    logic  WVALID;
    modport server (input  ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARUSER, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWUSER, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID,
                    output ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY);
    modport client (output ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARUSER, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWUSER, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID,
                    input  ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY);
endinterface
`endif
`ifndef __Pps7saxigp_DEF__
`define __Pps7saxigp_DEF__
interface Pps7saxigp;
    logic  ACLK;
    logic [32 - 1:0] ARADDR;
    logic [2 - 1:0] ARBURST;
    logic [4 - 1:0] ARCACHE;
    logic  ARESETN;
    logic [6 - 1:0] ARID;
    logic [4 - 1:0] ARLEN;
    logic [2 - 1:0] ARLOCK;
    logic [3 - 1:0] ARPROT;
    logic [4 - 1:0] ARQOS;
    logic  ARREADY;
    logic [2 - 1:0] ARSIZE;
    logic  ARVALID;
    logic [32 - 1:0] AWADDR;
    logic [2 - 1:0] AWBURST;
    logic [4 - 1:0] AWCACHE;
    logic [6 - 1:0] AWID;
    logic [4 - 1:0] AWLEN;
    logic [2 - 1:0] AWLOCK;
    logic [3 - 1:0] AWPROT;
    logic [4 - 1:0] AWQOS;
    logic  AWREADY;
    logic [2 - 1:0] AWSIZE;
    logic  AWVALID;
    logic [6 - 1:0] BID;
    logic  BREADY;
    logic [2 - 1:0] BRESP;
    logic  BVALID;
    logic [32 - 1:0] RDATA;
    logic [6 - 1:0] RID;
    logic  RLAST;
    logic  RREADY;
    logic [2 - 1:0] RRESP;
    logic  RVALID;
    logic [32 - 1:0] WDATA;
    logic [6 - 1:0] WID;
    logic  WLAST;
    logic  WREADY;
    logic [4 - 1:0] WSTRB;
    logic  WVALID;
    modport server (input  ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID,
                    output ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY);
    modport client (output ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RREADY, WDATA, WID, WLAST, WSTRB, WVALID,
                    input  ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RDATA, RID, RLAST, RRESP, RVALID, WREADY);
endinterface
`endif
`ifndef __Pps7saxihp_DEF__
`define __Pps7saxihp_DEF__
interface Pps7saxihp;
    logic  ACLK;
    logic [32 - 1:0] ARADDR;
    logic [2 - 1:0] ARBURST;
    logic [4 - 1:0] ARCACHE;
    logic  ARESETN;
    logic [6 - 1:0] ARID;
    logic [4 - 1:0] ARLEN;
    logic [2 - 1:0] ARLOCK;
    logic [3 - 1:0] ARPROT;
    logic [4 - 1:0] ARQOS;
    logic  ARREADY;
    logic [2 - 1:0] ARSIZE;
    logic  ARVALID;
    logic [32 - 1:0] AWADDR;
    logic [2 - 1:0] AWBURST;
    logic [4 - 1:0] AWCACHE;
    logic [6 - 1:0] AWID;
    logic [4 - 1:0] AWLEN;
    logic [2 - 1:0] AWLOCK;
    logic [3 - 1:0] AWPROT;
    logic [4 - 1:0] AWQOS;
    logic  AWREADY;
    logic [2 - 1:0] AWSIZE;
    logic  AWVALID;
    logic [6 - 1:0] BID;
    logic  BREADY;
    logic [2 - 1:0] BRESP;
    logic  BVALID;
    logic [3 - 1:0] RACOUNT;
    logic [8 - 1:0] RCOUNT;
    logic [64 - 1:0] RDATA;
    logic  RDISSUECAP1EN;
    logic [6 - 1:0] RID;
    logic  RLAST;
    logic  RREADY;
    logic [2 - 1:0] RRESP;
    logic  RVALID;
    logic [6 - 1:0] WACOUNT;
    logic [8 - 1:0] WCOUNT;
    logic [64 - 1:0] WDATA;
    logic [6 - 1:0] WID;
    logic  WLAST;
    logic  WREADY;
    logic  WRISSUECAP1EN;
    logic [8 - 1:0] WSTRB;
    logic  WVALID;
    modport server (input  ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RDISSUECAP1EN, RREADY, WDATA, WID, WLAST, WRISSUECAP1EN, WSTRB, WVALID,
                    output ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RACOUNT, RCOUNT, RDATA, RID, RLAST, RRESP, RVALID, WACOUNT, WCOUNT, WREADY);
    modport client (output ACLK, ARADDR, ARBURST, ARCACHE, ARID, ARLEN, ARLOCK, ARPROT, ARQOS, ARSIZE, ARVALID, AWADDR, AWBURST, AWCACHE, AWID, AWLEN, AWLOCK, AWPROT, AWQOS, AWSIZE, AWVALID, BREADY, RDISSUECAP1EN, RREADY, WDATA, WID, WLAST, WRISSUECAP1EN, WSTRB, WVALID,
                    input  ARESETN, ARREADY, AWREADY, BID, BRESP, BVALID, RACOUNT, RCOUNT, RDATA, RID, RLAST, RRESP, RVALID, WACOUNT, WCOUNT, WREADY);
endinterface
`endif
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; P7Wrap
//METAINTERNAL; pps; PS7;
//METAINTERNAL; pclockTop; ClockTop;
//METAGUARD; MAXIGP0_I.R; 0 != pps.MAXIGP0RREADY;
//METAGUARD; MAXIGP0_I.B; 0 != pps.MAXIGP0BREADY;
//METAGUARD; RULE$init; 1;
//METAINVOKE; RULE$gp0ar__ENA; :MAXIGP0_O.AR__ENA;
//METAGUARD; RULE$gp0ar; !( ( 0 == pps.MAXIGP0ARVALID ) || ( !MAXIGP0_O.AR__RDY ) );
//METAINVOKE; RULE$gp0aw__ENA; :MAXIGP0_O.AW__ENA;
//METAGUARD; RULE$gp0aw; !( ( 0 == pps.MAXIGP0AWVALID ) || ( !MAXIGP0_O.AW__RDY ) );
//METAINVOKE; RULE$gp0w__ENA; :MAXIGP0_O.W__ENA;
//METAGUARD; RULE$gp0w; !( ( 0 == pps.MAXIGP0WVALID ) || ( !MAXIGP0_O.W__RDY ) );
//METARULES; RULE$init; RULE$gp0ar; RULE$gp0aw; RULE$gp0w
//METASTART; ZynqTop
//METAINTERNAL; ps7_ps7_foo; P7Wrap;
//METAINTERNAL; test; AxiTop;
//METAINTERNAL; ps7_fclk_0_c; BUFG;
//METAINTERNAL; ps7_freset_0_r; BUFG;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
//METACONNECT; test$MAXIGP0_O.AR__ENA; ps7_ps7_foo$MAXIGP0_O.AR__ENA
//METACONNECT; test$MAXIGP0_O.AR__RDY; ps7_ps7_foo$MAXIGP0_O.AR__RDY
//METACONNECT; test$MAXIGP0_O.AW__ENA; ps7_ps7_foo$MAXIGP0_O.AW__ENA
//METACONNECT; test$MAXIGP0_O.AW__RDY; ps7_ps7_foo$MAXIGP0_O.AW__RDY
//METACONNECT; test$MAXIGP0_O.W__ENA; ps7_ps7_foo$MAXIGP0_O.W__ENA
//METACONNECT; test$MAXIGP0_O.W__RDY; ps7_ps7_foo$MAXIGP0_O.W__RDY
//METACONNECT; test$MAXIGP0_I.R__ENA; ps7_ps7_foo$MAXIGP0_I.R__ENA
//METACONNECT; test$MAXIGP0_I.R__RDY; ps7_ps7_foo$MAXIGP0_I.R__RDY
//METACONNECT; test$MAXIGP0_I.B__ENA; ps7_ps7_foo$MAXIGP0_I.B__ENA
//METACONNECT; test$MAXIGP0_I.B__RDY; ps7_ps7_foo$MAXIGP0_I.B__RDY
`endif
