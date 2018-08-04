`include "zynqTop.generated.vh"

`default_nettype none
module P7Wrap (
    output wire MAXIGP0_O$AR__ENA,
    output wire [31:0]MAXIGP0_O$AR$addr,
    output wire [11:0]MAXIGP0_O$AR$id,
    output wire [3:0]MAXIGP0_O$AR$len,
    input wire MAXIGP0_O$AR__RDY,
    output wire MAXIGP0_O$AW__ENA,
    output wire [31:0]MAXIGP0_O$AW$addr,
    output wire [11:0]MAXIGP0_O$AW$id,
    output wire [3:0]MAXIGP0_O$AW$len,
    input wire MAXIGP0_O$AW__RDY,
    output wire MAXIGP0_O$W__ENA,
    output wire [31:0]MAXIGP0_O$W$data,
    output wire [11:0]MAXIGP0_O$W$id,
    output wire MAXIGP0_O$W$last,
    input wire MAXIGP0_O$W__RDY,
    input wire MAXIGP0_I$B__ENA,
    input wire [11:0]MAXIGP0_I$B$id,
    input wire [1:0]MAXIGP0_I$B$resp,
    output wire MAXIGP0_I$B__RDY,
    input wire MAXIGP0_I$R__ENA,
    input wire [31:0]MAXIGP0_I$R$data,
    input wire [11:0]MAXIGP0_I$R$id,
    input wire MAXIGP0_I$R$last,
    input wire [1:0]MAXIGP0_I$R$resp,
    output wire MAXIGP0_I$R__RDY,
    inout wire [14:0]DDR_Addr,
    inout wire [2:0]DDR_BankAddr,
    inout wire DDR_CAS_n,
    inout wire DDR_CKE,
    inout wire DDR_Clk_n,
    inout wire DDR_Clk_p,
    inout wire DDR_CS_n,
    inout wire [3:0]DDR_DM,
    inout wire [31:0]DDR_DQ,
    inout wire [3:0]DDR_DQS_n,
    inout wire [3:0]DDR_DQS_p,
    inout wire DDR_DRSTB,
    inout wire DDR_ODT,
    inout wire DDR_RAS_n,
    inout wire FIXED_IO_ddr_vrn,
    inout wire FIXED_IO_ddr_vrp,
    inout wire DDR_WEB,
    inout wire FIXED_IO_ps_clk,
    inout wire FIXED_IO_ps_porb,
    inout wire FIXED_IO_ps_srstb,
    input wire intrinterrupt,
    input wire intrCLK,
    input wire intrnRST,
    inout wire [53:0]MIO,
    output wire [3:0]FCLKCLK,
    input wire [3:0]FCLKCLKTRIGN,
    output wire [3:0]FCLKRESETN);
    wire RULEgp0ar__ENA;
    wire RULEgp0ar__RDY;
    wire RULEgp0aw__ENA;
    wire RULEgp0aw__RDY;
    wire RULEgp0w__ENA;
    wire RULEgp0w__RDY;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire [14:0]pps$DDRA;
    wire [2:0]pps$DDRBA;
    wire pps$DDRCASB;
    wire pps$DDRCKE;
    wire pps$DDRCKN;
    wire pps$DDRCKP;
    wire pps$DDRCSB;
    wire [3:0]pps$DDRDM;
    wire [31:0]pps$DDRDQ;
    wire [3:0]pps$DDRDQSN;
    wire [3:0]pps$DDRDQSP;
    wire pps$DDRDRSTB;
    wire pps$DDRODT;
    wire pps$DDRRASB;
    wire pps$DDRVRN;
    wire pps$DDRVRP;
    wire pps$DDRWEB;
    wire pps$MAXIGP0ARVALID;
    wire pps$MAXIGP0AWVALID;
    wire pps$MAXIGP0WLAST;
    wire pps$MAXIGP0WVALID;
    wire pps$PSCLK;
    wire pps$PSPORB;
    wire pps$PSSRSTB;
    assign DDR_Addr = pps$DDRA;
    assign DDR_BankAddr = pps$DDRBA;
    assign DDR_CAS_n = pps$DDRCASB;
    assign DDR_CKE = pps$DDRCKE;
    assign DDR_CS_n = pps$DDRCSB;
    assign DDR_Clk_n = pps$DDRCKN;
    assign DDR_Clk_p = pps$DDRCKP;
    assign DDR_DM = pps$DDRDM;
    assign DDR_DQ = pps$DDRDQ;
    assign DDR_DQS_n = pps$DDRDQSN;
    assign DDR_DQS_p = pps$DDRDQSP;
    assign DDR_DRSTB = pps$DDRDRSTB;
    assign DDR_ODT = pps$DDRODT;
    assign DDR_RAS_n = pps$DDRRASB;
    assign DDR_WEB = pps$DDRWEB;
    assign FIXED_IO_ddr_vrn = pps$DDRVRN;
    assign FIXED_IO_ddr_vrp = pps$DDRVRP;
    assign FIXED_IO_ps_clk = pps$PSCLK;
    assign FIXED_IO_ps_porb = pps$PSPORB;
    assign FIXED_IO_ps_srstb = pps$PSSRSTB;
    assign MAXIGP0_O$AR__ENA = pps$MAXIGP0ARVALID;
    assign MAXIGP0_O$AW__ENA = pps$MAXIGP0AWVALID;
    assign MAXIGP0_O$W$last = pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY & pps$MAXIGP0WLAST;
    assign MAXIGP0_O$W__ENA = pps$MAXIGP0WVALID;
    assign RULEgp0ar__ENA = pps$MAXIGP0ARVALID & MAXIGP0_O$AR__RDY;
    assign RULEgp0aw__ENA = pps$MAXIGP0AWVALID & MAXIGP0_O$AW__RDY;
    assign RULEgp0w__ENA = pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY;
    assign RULEinit__ENA = 1;
    PS7 pps (
        .DDRA(pps$DDRA),
        .DDRARB(4'd0),
        .DDRBA(pps$DDRBA),
        .DDRCASB(pps$DDRCASB),
        .DDRCKE(pps$DDRCKE),
        .DDRCKN(pps$DDRCKN),
        .DDRCKP(pps$DDRCKP),
        .DDRCSB(pps$DDRCSB),
        .DDRDM(pps$DDRDM),
        .DDRDQ(pps$DDRDQ),
        .DDRDQSN(pps$DDRDQSN),
        .DDRDQSP(pps$DDRDQSP),
        .DDRDRSTB(pps$DDRDRSTB),
        .DDRODT(pps$DDRODT),
        .DDRRASB(pps$DDRRASB),
        .DDRVRN(pps$DDRVRN),
        .DDRVRP(pps$DDRVRP),
        .DDRWEB(pps$DDRWEB),
        .DMA0ACLK(0),
        .DMA0DAREADY(0),
        .DMA0DATYPE(),
        .DMA0DAVALID(),
        .DMA0DRLAST(0),
        .DMA0DRREADY(),
        .DMA0DRTYPE(0),
        .DMA0DRVALID(0),
        .DMA0RSTN(),
        .DMA1ACLK(0),
        .DMA1DAREADY(0),
        .DMA1DATYPE(),
        .DMA1DAVALID(),
        .DMA1DRLAST(0),
        .DMA1DRREADY(),
        .DMA1DRTYPE(0),
        .DMA1DRVALID(0),
        .DMA1RSTN(),
        .DMA2ACLK(0),
        .DMA2DAREADY(0),
        .DMA2DATYPE(),
        .DMA2DAVALID(),
        .DMA2DRLAST(0),
        .DMA2DRREADY(),
        .DMA2DRTYPE(0),
        .DMA2DRVALID(0),
        .DMA2RSTN(),
        .DMA3ACLK(0),
        .DMA3DAREADY(0),
        .DMA3DATYPE(),
        .DMA3DAVALID(),
        .DMA3DRLAST(0),
        .DMA3DRREADY(),
        .DMA3DRTYPE(0),
        .DMA3DRVALID(0),
        .DMA3RSTN(),
        .EMIOCAN0PHYRX(0),
        .EMIOCAN0PHYTX(),
        .EMIOCAN1PHYRX(0),
        .EMIOCAN1PHYTX(),
        .EMIOENET0EXTINTIN(0),
        .EMIOENET0GMIICOL(0),
        .EMIOENET0GMIICRS(0),
        .EMIOENET0GMIIRXCLK(0),
        .EMIOENET0GMIIRXD(0),
        .EMIOENET0GMIIRXDV(0),
        .EMIOENET0GMIIRXER(0),
        .EMIOENET0GMIITXCLK(0),
        .EMIOENET0GMIITXD(),
        .EMIOENET0GMIITXEN(),
        .EMIOENET0GMIITXER(),
        .EMIOENET0MDIOI(0),
        .EMIOENET0MDIOMDC(),
        .EMIOENET0MDIOO(),
        .EMIOENET0MDIOTN(),
        .EMIOENET0PTPDELAYREQRX(),
        .EMIOENET0PTPDELAYREQTX(),
        .EMIOENET0PTPPDELAYREQRX(),
        .EMIOENET0PTPPDELAYREQTX(),
        .EMIOENET0PTPPDELAYRESPRX(),
        .EMIOENET0PTPPDELAYRESPTX(),
        .EMIOENET0PTPSYNCFRAMERX(),
        .EMIOENET0PTPSYNCFRAMETX(),
        .EMIOENET0SOFRX(),
        .EMIOENET0SOFTX(),
        .EMIOENET1EXTINTIN(0),
        .EMIOENET1GMIICOL(0),
        .EMIOENET1GMIICRS(0),
        .EMIOENET1GMIIRXCLK(0),
        .EMIOENET1GMIIRXD(0),
        .EMIOENET1GMIIRXDV(0),
        .EMIOENET1GMIIRXER(0),
        .EMIOENET1GMIITXCLK(0),
        .EMIOENET1GMIITXD(),
        .EMIOENET1GMIITXEN(),
        .EMIOENET1GMIITXER(),
        .EMIOENET1MDIOI(0),
        .EMIOENET1MDIOMDC(),
        .EMIOENET1MDIOO(),
        .EMIOENET1MDIOTN(),
        .EMIOENET1PTPDELAYREQRX(),
        .EMIOENET1PTPDELAYREQTX(),
        .EMIOENET1PTPPDELAYREQRX(),
        .EMIOENET1PTPPDELAYREQTX(),
        .EMIOENET1PTPPDELAYRESPRX(),
        .EMIOENET1PTPPDELAYRESPTX(),
        .EMIOENET1PTPSYNCFRAMERX(),
        .EMIOENET1PTPSYNCFRAMETX(),
        .EMIOENET1SOFRX(),
        .EMIOENET1SOFTX(),
        .EMIOGPIOI(0),
        .EMIOGPIOO(),
        .EMIOGPIOTN(),
        .EMIOI2C0SCLI(0),
        .EMIOI2C0SCLO(),
        .EMIOI2C0SCLTN(),
        .EMIOI2C0SDAI(0),
        .EMIOI2C0SDAO(),
        .EMIOI2C0SDATN(),
        .EMIOI2C1SCLI(0),
        .EMIOI2C1SCLO(),
        .EMIOI2C1SCLTN(),
        .EMIOI2C1SDAI(0),
        .EMIOI2C1SDAO(),
        .EMIOI2C1SDATN(),
        .EMIOPJTAGTCK(0),
        .EMIOPJTAGTDI(0),
        .EMIOPJTAGTDO(),
        .EMIOPJTAGTDTN(),
        .EMIOPJTAGTMS(0),
        .EMIOSDIO0BUSPOW(),
        .EMIOSDIO0BUSVOLT(),
        .EMIOSDIO0CDN(0),
        .EMIOSDIO0CLK(),
        .EMIOSDIO0CLKFB(0),
        .EMIOSDIO0CMDI(0),
        .EMIOSDIO0CMDO(),
        .EMIOSDIO0CMDTN(),
        .EMIOSDIO0DATAI(0),
        .EMIOSDIO0DATAO(),
        .EMIOSDIO0DATATN(),
        .EMIOSDIO0LED(),
        .EMIOSDIO0WP(0),
        .EMIOSDIO1BUSPOW(),
        .EMIOSDIO1BUSVOLT(),
        .EMIOSDIO1CDN(0),
        .EMIOSDIO1CLK(),
        .EMIOSDIO1CLKFB(0),
        .EMIOSDIO1CMDI(0),
        .EMIOSDIO1CMDO(),
        .EMIOSDIO1CMDTN(),
        .EMIOSDIO1DATAI(0),
        .EMIOSDIO1DATAO(),
        .EMIOSDIO1DATATN(),
        .EMIOSDIO1LED(),
        .EMIOSDIO1WP(0),
        .EMIOSPI0MI(0),
        .EMIOSPI0MO(),
        .EMIOSPI0MOTN(),
        .EMIOSPI0SCLKI(0),
        .EMIOSPI0SCLKO(),
        .EMIOSPI0SCLKTN(),
        .EMIOSPI0SI(0),
        .EMIOSPI0SO(),
        .EMIOSPI0SSIN(0),
        .EMIOSPI0SSNTN(),
        .EMIOSPI0SSON(),
        .EMIOSPI0STN(),
        .EMIOSPI1MI(0),
        .EMIOSPI1MO(),
        .EMIOSPI1MOTN(),
        .EMIOSPI1SCLKI(0),
        .EMIOSPI1SCLKO(),
        .EMIOSPI1SCLKTN(),
        .EMIOSPI1SI(0),
        .EMIOSPI1SO(),
        .EMIOSPI1SSIN(0),
        .EMIOSPI1SSNTN(),
        .EMIOSPI1SSON(),
        .EMIOSPI1STN(),
        .EMIOSRAMINTIN(0),
        .EMIOTRACECLK(0),
        .EMIOTRACECTL(),
        .EMIOTRACEDATA(),
        .EMIOTTC0CLKI(0),
        .EMIOTTC0WAVEO(),
        .EMIOTTC1CLKI(0),
        .EMIOTTC1WAVEO(),
        .EMIOUART0CTSN(0),
        .EMIOUART0DCDN(0),
        .EMIOUART0DSRN(0),
        .EMIOUART0DTRN(),
        .EMIOUART0RIN(0),
        .EMIOUART0RTSN(),
        .EMIOUART0RX(0),
        .EMIOUART0TX(),
        .EMIOUART1CTSN(0),
        .EMIOUART1DCDN(0),
        .EMIOUART1DSRN(0),
        .EMIOUART1DTRN(),
        .EMIOUART1RIN(0),
        .EMIOUART1RTSN(),
        .EMIOUART1RX(0),
        .EMIOUART1TX(),
        .EMIOUSB0PORTINDCTL(),
        .EMIOUSB0VBUSPWRFAULT(0),
        .EMIOUSB0VBUSPWRSELECT(),
        .EMIOUSB1PORTINDCTL(),
        .EMIOUSB1VBUSPWRFAULT(0),
        .EMIOUSB1VBUSPWRSELECT(),
        .EMIOWDTCLKI(0),
        .EMIOWDTRSTO(),
        .EVENTEVENTI(0),
        .EVENTEVENTO(),
        .EVENTSTANDBYWFE(),
        .EVENTSTANDBYWFI(),
        .FCLKCLK(FCLKCLK),
        .FCLKCLKTRIGN(FCLKCLKTRIGN),
        .FCLKRESETN(FCLKRESETN),
        .FPGAIDLEN(1'd1),
        .FTMDTRACEINATID(0),
        .FTMDTRACEINCLOCK(0),
        .FTMDTRACEINDATA(0),
        .FTMDTRACEINVALID(0),
        .FTMTF2PDEBUG(0),
        .FTMTF2PTRIG(0),
        .FTMTF2PTRIGACK(),
        .FTMTP2FDEBUG(),
        .FTMTP2FTRIG(),
        .FTMTP2FTRIGACK(0),
        .IRQF2P(intrinterrupt),
        .IRQP2F(),
        .MAXIGP0ACLK(intrCLK),
        .MAXIGP0ARADDR(MAXIGP0_O$AR$addr),
        .MAXIGP0ARBURST(),
        .MAXIGP0ARCACHE(),
        .MAXIGP0ARESETN(),
        .MAXIGP0ARID(MAXIGP0_O$AR$id),
        .MAXIGP0ARLEN(MAXIGP0_O$AR$len),
        .MAXIGP0ARLOCK(),
        .MAXIGP0ARPROT(),
        .MAXIGP0ARQOS(),
        .MAXIGP0ARREADY(MAXIGP0_O$AR__RDY),
        .MAXIGP0ARSIZE(),
        .MAXIGP0ARVALID(pps$MAXIGP0ARVALID),
        .MAXIGP0AWADDR(MAXIGP0_O$AW$addr),
        .MAXIGP0AWBURST(),
        .MAXIGP0AWCACHE(),
        .MAXIGP0AWID(MAXIGP0_O$AW$id),
        .MAXIGP0AWLEN(MAXIGP0_O$AW$len),
        .MAXIGP0AWLOCK(),
        .MAXIGP0AWPROT(),
        .MAXIGP0AWQOS(),
        .MAXIGP0AWREADY(MAXIGP0_O$AW__RDY),
        .MAXIGP0AWSIZE(),
        .MAXIGP0AWVALID(pps$MAXIGP0AWVALID),
        .MAXIGP0BID(MAXIGP0_I$B$id),
        .MAXIGP0BREADY(MAXIGP0_I$B__RDY),
        .MAXIGP0BRESP(MAXIGP0_I$B$resp),
        .MAXIGP0BVALID(MAXIGP0_I$B__ENA),
        .MAXIGP0RDATA(MAXIGP0_I$R$data),
        .MAXIGP0RID(MAXIGP0_I$R$id),
        .MAXIGP0RLAST(MAXIGP0_I$R__RDY & MAXIGP0_I$R$last),
        .MAXIGP0RREADY(MAXIGP0_I$R__RDY),
        .MAXIGP0RRESP(MAXIGP0_I$R$resp),
        .MAXIGP0RVALID(MAXIGP0_I$R__ENA),
        .MAXIGP0WDATA(MAXIGP0_O$W$data),
        .MAXIGP0WID(MAXIGP0_O$W$id),
        .MAXIGP0WLAST(pps$MAXIGP0WLAST),
        .MAXIGP0WREADY(MAXIGP0_O$W__RDY),
        .MAXIGP0WSTRB(),
        .MAXIGP0WVALID(pps$MAXIGP0WVALID),
        .MAXIGP1ACLK(0),
        .MAXIGP1ARADDR(),
        .MAXIGP1ARBURST(),
        .MAXIGP1ARCACHE(),
        .MAXIGP1ARESETN(),
        .MAXIGP1ARID(),
        .MAXIGP1ARLEN(),
        .MAXIGP1ARLOCK(),
        .MAXIGP1ARPROT(),
        .MAXIGP1ARQOS(),
        .MAXIGP1ARREADY(0),
        .MAXIGP1ARSIZE(),
        .MAXIGP1ARVALID(),
        .MAXIGP1AWADDR(),
        .MAXIGP1AWBURST(),
        .MAXIGP1AWCACHE(),
        .MAXIGP1AWID(),
        .MAXIGP1AWLEN(),
        .MAXIGP1AWLOCK(),
        .MAXIGP1AWPROT(),
        .MAXIGP1AWQOS(),
        .MAXIGP1AWREADY(0),
        .MAXIGP1AWSIZE(),
        .MAXIGP1AWVALID(),
        .MAXIGP1BID(0),
        .MAXIGP1BREADY(),
        .MAXIGP1BRESP(0),
        .MAXIGP1BVALID(0),
        .MAXIGP1RDATA(0),
        .MAXIGP1RID(0),
        .MAXIGP1RLAST(0),
        .MAXIGP1RREADY(),
        .MAXIGP1RRESP(0),
        .MAXIGP1RVALID(0),
        .MAXIGP1WDATA(),
        .MAXIGP1WID(),
        .MAXIGP1WLAST(),
        .MAXIGP1WREADY(0),
        .MAXIGP1WSTRB(),
        .MAXIGP1WVALID(),
        .MIO(MIO),
        .PSCLK(pps$PSCLK),
        .PSPORB(pps$PSPORB),
        .PSSRSTB(pps$PSSRSTB),
        .SAXIACPACLK(0),
        .SAXIACPARADDR(0),
        .SAXIACPARBURST(0),
        .SAXIACPARCACHE(0),
        .SAXIACPARESETN(),
        .SAXIACPARID(0),
        .SAXIACPARLEN(0),
        .SAXIACPARLOCK(0),
        .SAXIACPARPROT(0),
        .SAXIACPARQOS(0),
        .SAXIACPARREADY(),
        .SAXIACPARSIZE(0),
        .SAXIACPARUSER(0),
        .SAXIACPARVALID(0),
        .SAXIACPAWADDR(0),
        .SAXIACPAWBURST(0),
        .SAXIACPAWCACHE(0),
        .SAXIACPAWID(0),
        .SAXIACPAWLEN(0),
        .SAXIACPAWLOCK(0),
        .SAXIACPAWPROT(0),
        .SAXIACPAWQOS(0),
        .SAXIACPAWREADY(),
        .SAXIACPAWSIZE(0),
        .SAXIACPAWUSER(0),
        .SAXIACPAWVALID(0),
        .SAXIACPBID(),
        .SAXIACPBREADY(0),
        .SAXIACPBRESP(),
        .SAXIACPBVALID(),
        .SAXIACPRDATA(),
        .SAXIACPRID(),
        .SAXIACPRLAST(),
        .SAXIACPRREADY(0),
        .SAXIACPRRESP(),
        .SAXIACPRVALID(),
        .SAXIACPWDATA(0),
        .SAXIACPWID(0),
        .SAXIACPWLAST(0),
        .SAXIACPWREADY(),
        .SAXIACPWSTRB(0),
        .SAXIACPWVALID(0),
        .SAXIGP0ACLK(0),
        .SAXIGP0ARADDR(0),
        .SAXIGP0ARBURST(0),
        .SAXIGP0ARCACHE(0),
        .SAXIGP0ARESETN(),
        .SAXIGP0ARID(0),
        .SAXIGP0ARLEN(0),
        .SAXIGP0ARLOCK(0),
        .SAXIGP0ARPROT(0),
        .SAXIGP0ARQOS(0),
        .SAXIGP0ARREADY(),
        .SAXIGP0ARSIZE(0),
        .SAXIGP0ARVALID(0),
        .SAXIGP0AWADDR(0),
        .SAXIGP0AWBURST(0),
        .SAXIGP0AWCACHE(0),
        .SAXIGP0AWID(0),
        .SAXIGP0AWLEN(0),
        .SAXIGP0AWLOCK(0),
        .SAXIGP0AWPROT(0),
        .SAXIGP0AWQOS(0),
        .SAXIGP0AWREADY(),
        .SAXIGP0AWSIZE(0),
        .SAXIGP0AWVALID(0),
        .SAXIGP0BID(),
        .SAXIGP0BREADY(0),
        .SAXIGP0BRESP(),
        .SAXIGP0BVALID(),
        .SAXIGP0RDATA(),
        .SAXIGP0RID(),
        .SAXIGP0RLAST(),
        .SAXIGP0RREADY(0),
        .SAXIGP0RRESP(),
        .SAXIGP0RVALID(),
        .SAXIGP0WDATA(0),
        .SAXIGP0WID(0),
        .SAXIGP0WLAST(0),
        .SAXIGP0WREADY(),
        .SAXIGP0WSTRB(0),
        .SAXIGP0WVALID(0),
        .SAXIGP1ACLK(0),
        .SAXIGP1ARADDR(0),
        .SAXIGP1ARBURST(0),
        .SAXIGP1ARCACHE(0),
        .SAXIGP1ARESETN(),
        .SAXIGP1ARID(0),
        .SAXIGP1ARLEN(0),
        .SAXIGP1ARLOCK(0),
        .SAXIGP1ARPROT(0),
        .SAXIGP1ARQOS(0),
        .SAXIGP1ARREADY(),
        .SAXIGP1ARSIZE(0),
        .SAXIGP1ARVALID(0),
        .SAXIGP1AWADDR(0),
        .SAXIGP1AWBURST(0),
        .SAXIGP1AWCACHE(0),
        .SAXIGP1AWID(0),
        .SAXIGP1AWLEN(0),
        .SAXIGP1AWLOCK(0),
        .SAXIGP1AWPROT(0),
        .SAXIGP1AWQOS(0),
        .SAXIGP1AWREADY(),
        .SAXIGP1AWSIZE(0),
        .SAXIGP1AWVALID(0),
        .SAXIGP1BID(),
        .SAXIGP1BREADY(0),
        .SAXIGP1BRESP(),
        .SAXIGP1BVALID(),
        .SAXIGP1RDATA(),
        .SAXIGP1RID(),
        .SAXIGP1RLAST(),
        .SAXIGP1RREADY(0),
        .SAXIGP1RRESP(),
        .SAXIGP1RVALID(),
        .SAXIGP1WDATA(0),
        .SAXIGP1WID(0),
        .SAXIGP1WLAST(0),
        .SAXIGP1WREADY(),
        .SAXIGP1WSTRB(0),
        .SAXIGP1WVALID(0),
        .SAXIHP0ACLK(0),
        .SAXIHP0ARADDR(0),
        .SAXIHP0ARBURST(0),
        .SAXIHP0ARCACHE(0),
        .SAXIHP0ARESETN(),
        .SAXIHP0ARID(0),
        .SAXIHP0ARLEN(0),
        .SAXIHP0ARLOCK(0),
        .SAXIHP0ARPROT(0),
        .SAXIHP0ARQOS(0),
        .SAXIHP0ARREADY(),
        .SAXIHP0ARSIZE(0),
        .SAXIHP0ARVALID(0),
        .SAXIHP0AWADDR(0),
        .SAXIHP0AWBURST(0),
        .SAXIHP0AWCACHE(0),
        .SAXIHP0AWID(0),
        .SAXIHP0AWLEN(0),
        .SAXIHP0AWLOCK(0),
        .SAXIHP0AWPROT(0),
        .SAXIHP0AWQOS(0),
        .SAXIHP0AWREADY(),
        .SAXIHP0AWSIZE(0),
        .SAXIHP0AWVALID(0),
        .SAXIHP0BID(),
        .SAXIHP0BREADY(0),
        .SAXIHP0BRESP(),
        .SAXIHP0BVALID(),
        .SAXIHP0RACOUNT(),
        .SAXIHP0RCOUNT(),
        .SAXIHP0RDATA(),
        .SAXIHP0RDISSUECAP1EN(0),
        .SAXIHP0RID(),
        .SAXIHP0RLAST(),
        .SAXIHP0RREADY(0),
        .SAXIHP0RRESP(),
        .SAXIHP0RVALID(),
        .SAXIHP0WACOUNT(),
        .SAXIHP0WCOUNT(),
        .SAXIHP0WDATA(0),
        .SAXIHP0WID(0),
        .SAXIHP0WLAST(0),
        .SAXIHP0WREADY(),
        .SAXIHP0WRISSUECAP1EN(0),
        .SAXIHP0WSTRB(0),
        .SAXIHP0WVALID(0),
        .SAXIHP1ACLK(0),
        .SAXIHP1ARADDR(0),
        .SAXIHP1ARBURST(0),
        .SAXIHP1ARCACHE(0),
        .SAXIHP1ARESETN(),
        .SAXIHP1ARID(0),
        .SAXIHP1ARLEN(0),
        .SAXIHP1ARLOCK(0),
        .SAXIHP1ARPROT(0),
        .SAXIHP1ARQOS(0),
        .SAXIHP1ARREADY(),
        .SAXIHP1ARSIZE(0),
        .SAXIHP1ARVALID(0),
        .SAXIHP1AWADDR(0),
        .SAXIHP1AWBURST(0),
        .SAXIHP1AWCACHE(0),
        .SAXIHP1AWID(0),
        .SAXIHP1AWLEN(0),
        .SAXIHP1AWLOCK(0),
        .SAXIHP1AWPROT(0),
        .SAXIHP1AWQOS(0),
        .SAXIHP1AWREADY(),
        .SAXIHP1AWSIZE(0),
        .SAXIHP1AWVALID(0),
        .SAXIHP1BID(),
        .SAXIHP1BREADY(0),
        .SAXIHP1BRESP(),
        .SAXIHP1BVALID(),
        .SAXIHP1RACOUNT(),
        .SAXIHP1RCOUNT(),
        .SAXIHP1RDATA(),
        .SAXIHP1RDISSUECAP1EN(0),
        .SAXIHP1RID(),
        .SAXIHP1RLAST(),
        .SAXIHP1RREADY(0),
        .SAXIHP1RRESP(),
        .SAXIHP1RVALID(),
        .SAXIHP1WACOUNT(),
        .SAXIHP1WCOUNT(),
        .SAXIHP1WDATA(0),
        .SAXIHP1WID(0),
        .SAXIHP1WLAST(0),
        .SAXIHP1WREADY(),
        .SAXIHP1WRISSUECAP1EN(0),
        .SAXIHP1WSTRB(0),
        .SAXIHP1WVALID(0),
        .SAXIHP2ACLK(0),
        .SAXIHP2ARADDR(0),
        .SAXIHP2ARBURST(0),
        .SAXIHP2ARCACHE(0),
        .SAXIHP2ARESETN(),
        .SAXIHP2ARID(0),
        .SAXIHP2ARLEN(0),
        .SAXIHP2ARLOCK(0),
        .SAXIHP2ARPROT(0),
        .SAXIHP2ARQOS(0),
        .SAXIHP2ARREADY(),
        .SAXIHP2ARSIZE(0),
        .SAXIHP2ARVALID(0),
        .SAXIHP2AWADDR(0),
        .SAXIHP2AWBURST(0),
        .SAXIHP2AWCACHE(0),
        .SAXIHP2AWID(0),
        .SAXIHP2AWLEN(0),
        .SAXIHP2AWLOCK(0),
        .SAXIHP2AWPROT(0),
        .SAXIHP2AWQOS(0),
        .SAXIHP2AWREADY(),
        .SAXIHP2AWSIZE(0),
        .SAXIHP2AWVALID(0),
        .SAXIHP2BID(),
        .SAXIHP2BREADY(0),
        .SAXIHP2BRESP(),
        .SAXIHP2BVALID(),
        .SAXIHP2RACOUNT(),
        .SAXIHP2RCOUNT(),
        .SAXIHP2RDATA(),
        .SAXIHP2RDISSUECAP1EN(0),
        .SAXIHP2RID(),
        .SAXIHP2RLAST(),
        .SAXIHP2RREADY(0),
        .SAXIHP2RRESP(),
        .SAXIHP2RVALID(),
        .SAXIHP2WACOUNT(),
        .SAXIHP2WCOUNT(),
        .SAXIHP2WDATA(0),
        .SAXIHP2WID(0),
        .SAXIHP2WLAST(0),
        .SAXIHP2WREADY(),
        .SAXIHP2WRISSUECAP1EN(0),
        .SAXIHP2WSTRB(0),
        .SAXIHP2WVALID(0),
        .SAXIHP3ACLK(0),
        .SAXIHP3ARADDR(0),
        .SAXIHP3ARBURST(0),
        .SAXIHP3ARCACHE(0),
        .SAXIHP3ARESETN(),
        .SAXIHP3ARID(0),
        .SAXIHP3ARLEN(0),
        .SAXIHP3ARLOCK(0),
        .SAXIHP3ARPROT(0),
        .SAXIHP3ARQOS(0),
        .SAXIHP3ARREADY(),
        .SAXIHP3ARSIZE(0),
        .SAXIHP3ARVALID(0),
        .SAXIHP3AWADDR(0),
        .SAXIHP3AWBURST(0),
        .SAXIHP3AWCACHE(0),
        .SAXIHP3AWID(0),
        .SAXIHP3AWLEN(0),
        .SAXIHP3AWLOCK(0),
        .SAXIHP3AWPROT(0),
        .SAXIHP3AWQOS(0),
        .SAXIHP3AWREADY(),
        .SAXIHP3AWSIZE(0),
        .SAXIHP3AWVALID(0),
        .SAXIHP3BID(),
        .SAXIHP3BREADY(0),
        .SAXIHP3BRESP(),
        .SAXIHP3BVALID(),
        .SAXIHP3RACOUNT(),
        .SAXIHP3RCOUNT(),
        .SAXIHP3RDATA(),
        .SAXIHP3RDISSUECAP1EN(0),
        .SAXIHP3RID(),
        .SAXIHP3RLAST(),
        .SAXIHP3RREADY(0),
        .SAXIHP3RRESP(),
        .SAXIHP3RVALID(),
        .SAXIHP3WACOUNT(),
        .SAXIHP3WCOUNT(),
        .SAXIHP3WDATA(0),
        .SAXIHP3WID(0),
        .SAXIHP3WLAST(0),
        .SAXIHP3WREADY(),
        .SAXIHP3WRISSUECAP1EN(0),
        .SAXIHP3WSTRB(0),
        .SAXIHP3WVALID(0));
    ClockTop pclockTop (
        .CLK(intrCLK),
        .nRST(intrnRST),
        .clockOut());
    // Extra assigments, not to output wires
    assign RULEgp0ar__RDY = pps$MAXIGP0ARVALID & MAXIGP0_O$AR__RDY;
    assign RULEgp0aw__RDY = pps$MAXIGP0AWVALID & MAXIGP0_O$AW__RDY;
    assign RULEgp0w__RDY = pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY;
    assign RULEinit__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
