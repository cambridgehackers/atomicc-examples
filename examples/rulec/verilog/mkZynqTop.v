
`include "ProjectDefines.vh"
`default_nettype none
module mkZynqTop #(parameter width = 64) (
  inout wire [14 : 0] DDR_Addr, inout wire [2 : 0] DDR_BankAddr,
  inout wire DDR_CAS_n, inout wire DDR_CKE, inout wire DDR_CS_n, inout wire DDR_Clk_n, inout wire DDR_Clk_p,
  inout wire [3 : 0] DDR_DM, inout wire [31 : 0] DDR_DQ,
  inout wire [3 : 0] DDR_DQS_n, inout wire [3 : 0] DDR_DQS_p,
  inout wire DDR_DRSTB, inout wire DDR_ODT, inout wire DDR_RAS_n,
  inout wire FIXED_IO_ddr_vrn, inout wire FIXED_IO_ddr_vrp, inout wire DDR_WEB, inout wire [53 : 0] MIO,
  inout wire FIXED_IO_ps_clk, inout wire FIXED_IO_ps_porb, inout wire FIXED_IO_ps_srstb);

  wire CLK, nRST;

  wire ctclock$clockOut;
  ClockTop pclockTop ( .userCLK(CLK), .usernRST(nRST), .clockOut(ctclock$clockOut));

  wire [31 : 0] maxigp0ARADDR, maxigp0AWADDR, maxigp0WDATA, maxigp0RDATA;
  wire [11 : 0] maxigp0ARID, maxigp0AWID, maxigp0WID;
  wire [13 : 0] maxigp0BRESP;
  wire [5 : 0] maxigp0RID;
  wire [3 : 0] ps7_ps7_foo_FCLKCLK, fclkRESETN, maxigp0ARLEN, maxigp0AWLEN;
  wire maxigp0ARVALID, maxigp0AWVALID, maxigp0RREADY, maxigp0BREADY, maxigp0WLAST, maxigp0WVALID;
  wire maxigp0AWREADY, maxigp0WREADY, read_reqFifo_EMPTY_N, maxigp0RVALID, RDY_WriteDone, interrupt_0__read;
  wire reqwriteDataFifo_FULL_N, write_reqFifo_FULL_N, reqws_FULL_N;
  reg CMRlastWriteDataSeen;
  assign maxigp0AWREADY = reqws_FULL_N && write_reqFifo_FULL_N;
  assign maxigp0WREADY = !CMRlastWriteDataSeen && reqwriteDataFifo_FULL_N ;
  BUFG ps7_fclk_0_c(.I(ps7_ps7_foo_FCLKCLK[0]), .O(CLK));
  BUFG ps7_freset_0_r(.I(fclkRESETN[0]), .O(nRST));
ZynqTop ps7_ps7_foo (.CLK(CLK), .nRST(nRST),
        .FCLKCLK(ps7_ps7_foo_FCLKCLK), .FCLKRESETN(fclkRESETN),
        .IRQF2P({ 19'b0, interrupt_0__read}),

        .MAXIGP0ARADDR(maxigp0ARADDR[31:0]), .MAXIGP0ARID(maxigp0ARID), .MAXIGP0ARLEN(maxigp0ARLEN),
        .MAXIGP0ARVALID(maxigp0ARVALID), .MAXIGP0ARREADY(!read_reqFifo_EMPTY_N),

        .MAXIGP0RDATA(maxigp0RDATA), .MAXIGP0RRESP(0), .MAXIGP0RLAST(1),
        .MAXIGP0RID({6'b0, maxigp0RID}), .MAXIGP0RREADY(maxigp0RREADY), .MAXIGP0RVALID(maxigp0RVALID),

        .MAXIGP0AWADDR(maxigp0AWADDR[31:0]), .MAXIGP0AWID(maxigp0AWID), .MAXIGP0AWLEN(maxigp0AWLEN),
        .MAXIGP0AWVALID(maxigp0AWVALID), .MAXIGP0AWREADY(maxigp0AWREADY),

        .MAXIGP0WDATA(maxigp0WDATA), .MAXIGP0WID(maxigp0WID), .MAXIGP0WLAST(maxigp0WLAST),
        .MAXIGP0WVALID(maxigp0WVALID), .MAXIGP0WREADY(maxigp0WREADY),

        .MAXIGP0BRESP(maxigp0BRESP[13:12]), .MAXIGP0BID(maxigp0BRESP[11:0]),
        .MAXIGP0BVALID(RDY_WriteDone && maxigp0BREADY), .MAXIGP0BREADY(maxigp0BREADY),
        .DDRA(DDR_Addr), .DDRBA(DDR_BankAddr), .DDRCASB(DDR_CAS_n),
        .DDRCKE(DDR_CKE), .DDRCKN(DDR_Clk_n), .DDRCKP(DDR_Clk_p),
        .DDRCSB(DDR_CS_n), .DDRDM(DDR_DM), .DDRDQ(DDR_DQ),
        .DDRDQSN(DDR_DQS_n), .DDRDQSP(DDR_DQS_p), .DDRDRSTB(DDR_DRSTB),
        .DDRODT(DDR_ODT), .DDRRASB(DDR_RAS_n), .DDRVRN(FIXED_IO_ddr_vrn),
        .DDRVRP(FIXED_IO_ddr_vrp), .DDRWEB(DDR_WEB), .PSCLK(FIXED_IO_ps_clk),
        .PSPORB(FIXED_IO_ps_porb), .PSSRSTB(FIXED_IO_ps_srstb), .MIO(MIO),
    .DDRARB(0), .IRQP2F(),
    .MAXIGP0ARBURST(), .MAXIGP0ARCACHE(), .MAXIGP0ARESETN(), .MAXIGP0ARLOCK(),
    .MAXIGP0ARPROT(), .MAXIGP0ARQOS(), .MAXIGP0ARSIZE(), 
    .MAXIGP0AWBURST(), .MAXIGP0AWCACHE(), .MAXIGP0AWLOCK(), .MAXIGP0AWPROT(),
    .MAXIGP0AWQOS(), .MAXIGP0AWSIZE(), .MAXIGP0WSTRB(), .MAXIGP0ACLK(CLK));

  reg ctrlPort_0_interruptEnableReg;
  reg readFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
  reg [31 : 0] requestValue, portalCtrlInfo;
  reg [9 : 0] readCount;
  reg [4 : 0] readAddr;

  wire write$enq__RDY, read$enq__ENA, RDY_requestEnq, ReadDataFifo_FULL_N;
  wire reqPortal_EMPTY_N, reqPortal_FULL_N, read_reqFifo_FULL_N;
  wire reqrs_EMPTY_N, reqrs_FULL_N, reqwriteDataFifo_EMPTY_N, reqws_EMPTY_N;
  wire readFirstNext, readAddr_EN, RULEread, reqPortal_D_OUT_last;
  wire [31 : 0]read$enq$v, write$enq$v, zzIntrChannel;
  wire [9 : 0] reqPortal_D_OUT_base, read_reqFifo_D_OUT_count, readburstCount;
  wire [5 : 0] reqPortal_D_OUT_id, read_reqFifo_D_OUT_id;
  wire [4 : 0] reqPortal_D_OUT_addr, read_reqFifo_D_OUT_addr, readAddrupdate;
  wire [1 : 0] selectIndication, selectRequest;
  assign zzIntrChannel = {31'd0, selectRIndReq ? 1'd0 : read$enq__ENA};

  assign interrupt_0__read = read$enq__ENA && ctrlPort_0_interruptEnableReg;
  assign readFirstNext = readFirst ? read_reqFifo_D_OUT_count == 4  : readLast ;
  assign RULEread = reqPortal_EMPTY_N && ReadDataFifo_FULL_N && reqrs_EMPTY_N;

  always@(reqPortal_D_OUT_addr or read$enq$v or write$enq__RDY)
  begin
    case (reqPortal_D_OUT_addr)
      0: requestValue = read$enq$v;
      4: requestValue = { 31'd0, write$enq__RDY};
      default: requestValue = 32'd0;
    endcase
  end
  always@(reqPortal_D_OUT_addr or ctrlPort_0_interruptEnableReg or zzIntrChannel or selectRIndReq)
  begin
    case (reqPortal_D_OUT_addr)
      0: portalCtrlInfo = {31'd0,  zzIntrChannel != 0}; // PORTAL_CTRL_INTERRUPT_STATUS 0
      //4: portalCtrlInfo = 0;//{31'd0, ctrlPort_0_interruptEnableReg; // PORTAL_CTRL_INTERRUPT_ENABLE 1
      8: portalCtrlInfo = 1;                         // PORTAL_CTRL_NUM_TILES        2
      5'h0C: portalCtrlInfo = zzIntrChannel;         // PORTAL_CTRL_IND_QUEUE_STATUS 3
      5'h10: portalCtrlInfo = selectRIndReq ? 6 : 5; // PORTAL_CTRL_PORTAL_ID        4
      5'h14: portalCtrlInfo = 2;                     // PORTAL_CTRL_NUM_PORTALS      5
      //5'h18: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_MSB      6
      //5'h1C: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_LSB      7
      default: portalCtrlInfo = 32'h005A05A0;
    endcase
  end

  assign readAddr_EN = read_reqFifo_EMPTY_N && reqPortal_FULL_N;

  FIFO1 #(.width(2), .guarded(1)) reqrs(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(maxigp0ARADDR[6:5] - 2'd1), .ENQ(maxigp0ARVALID),
        .D_OUT(selectIndication), .DEQ(RULEread && (!selectRIndReq || reqPortal_D_OUT_last)),
        .FULL_N(reqrs_FULL_N), .EMPTY_N(reqrs_EMPTY_N));
  always@(posedge CLK) begin
        if (maxigp0ARVALID) begin
            portalRControl <= maxigp0ARADDR[11:5] == 7'd0;
            selectRIndReq <= maxigp0ARADDR[12];
        end
  end
  FIFO1 #(.width(21), .guarded(1)) reqArs(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ maxigp0ARADDR[4:0], { 4'd0, maxigp0ARLEN + 4'd1, 2'd0 }, maxigp0ARID[5:0]}), .ENQ(maxigp0ARVALID),
        .D_OUT({read_reqFifo_D_OUT_addr, read_reqFifo_D_OUT_count, read_reqFifo_D_OUT_id}),
        .DEQ(readAddr_EN && readFirstNext), .FULL_N(read_reqFifo_FULL_N), .EMPTY_N(read_reqFifo_EMPTY_N));
  assign readAddrupdate = readFirst ?  read_reqFifo_D_OUT_addr : readAddr ;
  assign readburstCount = readFirst ?  { 2'd0, read_reqFifo_D_OUT_count[9:2] } : readCount ;
  FIFO2 #(.width(22), .guarded(1)) reqPortal(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({readAddrupdate, readburstCount, read_reqFifo_D_OUT_id, readFirstNext}), .ENQ(readAddr_EN),
        .D_OUT({reqPortal_D_OUT_addr, reqPortal_D_OUT_base, reqPortal_D_OUT_id, reqPortal_D_OUT_last}),
        .DEQ(RULEread), .FULL_N(reqPortal_FULL_N), .EMPTY_N(reqPortal_EMPTY_N));
  FIFO2 #(.width(38), .guarded(1)) ReadDataFifo(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({portalRControl ? portalCtrlInfo : requestValue, reqPortal_D_OUT_id}), .ENQ(RULEread),
        .D_OUT({maxigp0RDATA, maxigp0RID}), .DEQ(maxigp0RREADY && maxigp0RVALID),
        .FULL_N(ReadDataFifo_FULL_N), .EMPTY_N(maxigp0RVALID));

//write
  reg writeFirst, writeLast;
  reg [9 : 0] writeCount;
  reg [4 : 0] writeAddr;

  wire writeAddr_EN, writeFirstNext, WriteDone_FULL_N, RULEwrite, EN_WriteReq, EN_WriteData;
  wire writeFifo_EMPTY_N, writeFifo_FULL_N, write_reqFifo_EMPTY_N, reqdoneFifo_ENQ; wire writeFifo_D_OUT_last;
  wire [9 : 0] writeFifo_D_OUT_count, write_reqFifo_D_OUT_count, writeburstCount;
  wire [5 : 0] writeFifo_D_OUT_id, write_reqFifo_D_OUT_id;
  wire [4 : 0] writeFifo_D_OUT_addr, write_reqFifo_D_OUT_addr, writeAddrupdate;

assign RDY_requestEnq = 0; // MISSING ASSIGN
  assign EN_WriteReq = maxigp0AWVALID && maxigp0AWREADY;
  assign RULEwrite = reqwriteDataFifo_EMPTY_N && writeFifo_EMPTY_N && (!writeFifo_D_OUT_last || WriteDone_FULL_N)
            && (!selectWIndReq || portalWControl || (reqws_EMPTY_N && RDY_requestEnq));
  assign writeAddr_EN = write_reqFifo_EMPTY_N && writeFifo_FULL_N ;

  assign reqdoneFifo_ENQ = RULEwrite && writeFifo_D_OUT_last;
  assign writeFirstNext = writeFirst ?  write_reqFifo_D_OUT_count == 4 : writeLast ;
  FIFO1 #(.width(21), .guarded(1)) write_reqFifo(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({maxigp0AWADDR[4:0], { 4'd0, maxigp0AWLEN + 4'd1, 2'd0 }, maxigp0AWID[5:0] }), .ENQ(EN_WriteReq),
        .D_OUT({write_reqFifo_D_OUT_addr, write_reqFifo_D_OUT_count, write_reqFifo_D_OUT_id}),
        .DEQ(writeAddr_EN && writeFirstNext), .FULL_N(write_reqFifo_FULL_N), .EMPTY_N(write_reqFifo_EMPTY_N));
  FIFO1 #(.width(2), .guarded(1)) reqws(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(maxigp0AWADDR[6:5] - 2'd1), .ENQ(EN_WriteReq),
        .D_OUT(selectRequest), .DEQ(reqdoneFifo_ENQ), .FULL_N(reqws_FULL_N), .EMPTY_N(reqws_EMPTY_N));
  always@(posedge CLK) begin
        if (EN_WriteReq) begin
            portalWControl <= maxigp0AWADDR[11:5] == 7'd0;
            selectWIndReq <= maxigp0AWADDR[12];
        end
  end
  assign EN_WriteData = maxigp0WVALID && maxigp0WREADY;
  FIFO2 #(.width(32), .guarded(1)) reqwriteDataFifo(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(maxigp0WDATA), .ENQ(EN_WriteData),
        .D_OUT(write$enq$v), .DEQ(RULEwrite), .FULL_N(reqwriteDataFifo_FULL_N), .EMPTY_N(reqwriteDataFifo_EMPTY_N));
  assign writeAddrupdate = writeFirst ?  write_reqFifo_D_OUT_addr : writeAddr ;
  assign writeburstCount = writeFirst ?  { 2'd0, write_reqFifo_D_OUT_count[9:2] } : writeCount ;
  FIFO2 #(.width(22), .guarded(1)) writeFifo(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ writeAddrupdate, writeburstCount, write_reqFifo_D_OUT_id, writeFirstNext }), .ENQ(writeAddr_EN),
        .D_OUT({writeFifo_D_OUT_addr, writeFifo_D_OUT_count, writeFifo_D_OUT_id, writeFifo_D_OUT_last}),
        .DEQ(RULEwrite), .FULL_N(writeFifo_FULL_N), .EMPTY_N(writeFifo_EMPTY_N));
  FIFO1 #(.width(14), .guarded(1)) CMRdoneFifo(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN( { 8'd0, writeFifo_D_OUT_id}), .ENQ(reqdoneFifo_ENQ),
        .D_OUT(maxigp0BRESP), .DEQ(maxigp0BREADY), .FULL_N(WriteDone_FULL_N), .EMPTY_N(RDY_WriteDone));

  always@(posedge CLK)
  begin
    if (nRST == 0)
      begin
        ctrlPort_0_interruptEnableReg <=  1'd0;
        CMRlastWriteDataSeen <=  1'd0;
        readAddr <= 0;
        readCount <= 0;
        readFirst <= 1'd1;
        readLast <= 1'd0;
        writeAddr <= 0;
        writeCount <= 0;
        writeFirst <= 1'd1;
        writeLast <= 1'd0;
      end
    else
      begin
        if (RULEwrite && portalWControl && writeFifo_D_OUT_addr == 4)
          ctrlPort_0_interruptEnableReg <= write$enq$v[0];
        if (EN_WriteData && maxigp0WLAST || EN_WriteReq)
          CMRlastWriteDataSeen <= !EN_WriteReq;
        if (readAddr_EN) begin
          readAddr <= readAddrupdate + 4 ;
          readCount <= readburstCount - 1 ;
          readFirst <= readFirstNext;
          readLast <= readburstCount == 2 ;
        end

        if (writeAddr_EN) begin
          writeAddr <= writeAddrupdate + 4 ;
          writeCount <= writeburstCount - 1 ;
          writeFirst <= writeFirstNext ;
          writeLast <= writeburstCount == 2 ;
        end
      end
  end

UserTop user(.CLK(CLK), .nRST(nRST),
  .write$enq__ENA(RULEwrite && !portalWControl), .write$enq$v(write$enq$v), .write$enq$last(writeFifo_D_OUT_addr != 0),
  .write$enq__RDY(write$enq__RDY),
  .read$enq__RDY(RULEread && !portalRControl), .read$enq$v(read$enq$v), .read$enq$last(), .read$enq__ENA(read$enq__ENA));
endmodule  // mkZynqTop
