
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

  wire [31 : 0] mg0ARADDR, mg0AWADDR, mg0WDATA, mg0RDATA, read$enq$v, write$enq$v, zzIntrChannel;
  wire [11 : 0] mg0ARID, mg0AWID, mg0WID;
  wire [9 : 0] reqPortal$base, reqArs$count, readburstCount, write$count, write_req$count, writeburstCount;
  wire [5 : 0] mg0RID, reqPortal$id, reqArs$id, write$id, write_req$id, mg0BRESP;
  wire [4 : 0] write$addr, write_req$addr, writeAddrupdate, reqPortal$addr, reqArs$addr, readAddrupdate;
  wire [3 : 0] ps7_ps7_foo_FCLKCLK, fclkRESETN, mg0ARLEN, mg0AWLEN;

  wire mg0ARVALID, mg0AWVALID, mg0RREADY, mg0BREADY, mg0WLAST, mg0WVALID;
  wire mg0AWREADY, mg0WREADY, reqArs$DeqRDY, mg0RVALID, CMRdone$DeqRDY, interrupt_0__read;
  wire reqwriteData$EnqRDY, write_req$EnqRDY, reqws$EnqRDY;
  wire write$enq__RDY, read$enq__ENA, ReadData$EnqRDY;
  wire reqPortal$DeqRDY, reqPortal$EnqRDY, read_req$EnqRDY;
  wire reqrsDeqRDY, reqrs$EnqRDY, reqwriteDataDeqRDY, reqwsDeqRDY;
  wire readFirstNext, writeFirstNext, CMRdone$EnqRDY, reqPortal$last;
  wire write$DeqRDY, write$EnqRDY, write_req$DeqRDY, write$last;
  wire RULEwriteDone, RULEwrite, RULEAW, RULEW, RULER, RULEreadResp, RULEread, RULEreqdone;

  reg CMRlastWriteDataSeen, ctrlPort_0_interruptEnableReg, writeFirst, writeLast;
  reg readFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
  reg [31 : 0] requestValue, portalCtrlInfo;
  reg [9 : 0] readCount, writeCount;
  reg [4 : 0] readAddr, writeAddr;

  FIFO1 #(.width(1), .guarded(1)) reqrs(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(0), .ENQ(mg0ARVALID),
        .D_OUT(), .DEQ(RULEread && (!selectRIndReq || reqPortal$last)),
        .FULL_N(reqrs$EnqRDY), .EMPTY_N(reqrsDeqRDY));
  FIFO1 #(.width(21), .guarded(1)) reqArs(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ mg0ARADDR[4:0], { 4'd0, mg0ARLEN + 4'd1, 2'd0 }, mg0ARID[5:0]}), .ENQ(mg0ARVALID),
        .D_OUT({reqArs$addr, reqArs$count, reqArs$id}),
        .DEQ(RULEreadResp && readFirstNext), .FULL_N(read_req$EnqRDY), .EMPTY_N(reqArs$DeqRDY));
  FIFO1 #(.width(22), .guarded(1)) reqPortal(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({readAddrupdate, readburstCount, reqArs$id, readFirstNext}), .ENQ(RULEreadResp),
        .D_OUT({reqPortal$addr, reqPortal$base, reqPortal$id, reqPortal$last}),
        .DEQ(RULEread), .FULL_N(reqPortal$EnqRDY), .EMPTY_N(reqPortal$DeqRDY));
  FIFO1 #(.width(38), .guarded(1)) ReadData(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({portalRControl ? portalCtrlInfo : requestValue, reqPortal$id}), .ENQ(RULEread),
        .D_OUT({mg0RDATA, mg0RID}), .DEQ(RULER),
        .FULL_N(ReadData$EnqRDY), .EMPTY_N(mg0RVALID));
  FIFO1 #(.width(21), .guarded(1)) write_req(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({mg0AWADDR[4:0], { 4'd0, mg0AWLEN + 4'd1, 2'd0 }, mg0AWID[5:0] }), .ENQ(RULEAW),
        .D_OUT({write_req$addr, write_req$count, write_req$id}),
        .DEQ(RULEwriteDone && writeFirstNext), .FULL_N(write_req$EnqRDY), .EMPTY_N(write_req$DeqRDY));
  FIFO1 #(.width(1), .guarded(1)) reqws(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(0), .ENQ(RULEAW),
        .D_OUT(), .DEQ(RULEreqdone), .FULL_N(reqws$EnqRDY), .EMPTY_N(reqwsDeqRDY));
  FIFO1 #(.width(32), .guarded(1)) reqwriteData(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(mg0WDATA), .ENQ(RULEW),
        .D_OUT(write$enq$v), .DEQ(RULEwrite), .FULL_N(reqwriteData$EnqRDY), .EMPTY_N(reqwriteDataDeqRDY));
  FIFO1 #(.width(22), .guarded(1)) write(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ writeAddrupdate, writeburstCount, write_req$id, writeFirstNext }), .ENQ(RULEwriteDone),
        .D_OUT({write$addr, write$count, write$id, write$last}),
        .DEQ(RULEwrite), .FULL_N(write$EnqRDY), .EMPTY_N(write$DeqRDY));
  FIFO1 #(.width(6), .guarded(1)) CMRdone(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN( write$id), .ENQ(RULEreqdone),
        .D_OUT(mg0BRESP), .DEQ(mg0BREADY), .FULL_N(CMRdone$EnqRDY), .EMPTY_N(CMRdone$DeqRDY));

  BUFG ps7_fclk_0_c(.I(ps7_ps7_foo_FCLKCLK[0]), .O(CLK));
  BUFG ps7_freset_0_r(.I(fclkRESETN[0]), .O(nRST));
ZynqTop ps7_ps7_foo (.CLK(CLK), .nRST(nRST),
        .FCLKCLK(ps7_ps7_foo_FCLKCLK), .FCLKRESETN(fclkRESETN), .FCLKCLKTRIGN(),
        .IRQF2P({ 19'b0, interrupt_0__read}),
        .MAXIGP0_O$AR$addr(mg0ARADDR[31:0]), .MAXIGP0_O$AR$id(mg0ARID), .MAXIGP0_O$AR$len(mg0ARLEN),
        .MAXIGP0_O$AR__ENA(mg0ARVALID), .MAXIGP0_O$AR__RDY(!reqArs$DeqRDY),

        .MAXIGP0_I$R$data(mg0RDATA), .MAXIGP0_I$R$resp(0), .MAXIGP0_I$R$last(1),
        .MAXIGP0_I$R$id({6'b0, mg0RID}), .MAXIGP0_I$R__RDY(mg0RREADY), .MAXIGP0_I$R__ENA(mg0RVALID),

        .MAXIGP0_O$AW$addr(mg0AWADDR[31:0]), .MAXIGP0_O$AW$id(mg0AWID), .MAXIGP0_O$AW$len(mg0AWLEN),
        .MAXIGP0_O$AW__ENA(mg0AWVALID), .MAXIGP0_O$AW__RDY(mg0AWREADY),

        .MAXIGP0_O$W$data(mg0WDATA), .MAXIGP0_O$W$id(mg0WID), .MAXIGP0_O$W$last(mg0WLAST),
        .MAXIGP0_O$W__ENA(mg0WVALID), .MAXIGP0_O$W__RDY(mg0WREADY),

        .MAXIGP0_I$B$resp(0), .MAXIGP0_I$B$id({ 6'd0, mg0BRESP}),
        .MAXIGP0_I$B__ENA(CMRdone$DeqRDY && mg0BREADY), .MAXIGP0_I$B__RDY(mg0BREADY),
        .DDRA(DDR_Addr), .DDRBA(DDR_BankAddr), .DDRCASB(DDR_CAS_n),
        .DDRCKE(DDR_CKE), .DDRCKN(DDR_Clk_n), .DDRCKP(DDR_Clk_p),
        .DDRCSB(DDR_CS_n), .DDRDM(DDR_DM), .DDRDQ(DDR_DQ),
        .DDRDQSN(DDR_DQS_n), .DDRDQSP(DDR_DQS_p), .DDRDRSTB(DDR_DRSTB),
        .DDRODT(DDR_ODT), .DDRRASB(DDR_RAS_n), .DDRVRN(FIXED_IO_ddr_vrn),
        .DDRVRP(FIXED_IO_ddr_vrp), .DDRWEB(DDR_WEB), .PSCLK(FIXED_IO_ps_clk),
        .PSPORB(FIXED_IO_ps_porb), .PSSRSTB(FIXED_IO_ps_srstb), .MIO(MIO),
    .DDRARB(0), .IRQP2F());

  assign RULEread = reqPortal$DeqRDY && ReadData$EnqRDY && reqrsDeqRDY;
  assign RULEreadResp = reqArs$DeqRDY && reqPortal$EnqRDY;
  assign RULER = mg0RREADY && mg0RVALID;
  assign RULEW = mg0WVALID && mg0WREADY;
  assign RULEAW = mg0AWVALID && mg0AWREADY;
  assign RULEwrite = reqwriteDataDeqRDY && write$DeqRDY && (!write$last || CMRdone$EnqRDY)
            && (!selectWIndReq || portalWControl);
  assign RULEwriteDone = write_req$DeqRDY && write$EnqRDY ;
  assign RULEreqdone = RULEwrite && write$last;

  assign mg0AWREADY = reqws$EnqRDY && write_req$EnqRDY;
  assign mg0WREADY = !CMRlastWriteDataSeen && reqwriteData$EnqRDY ;

  assign readAddrupdate = readFirst ?  reqArs$addr : readAddr ;
  assign readburstCount = readFirst ?  { 2'd0, reqArs$count[9:2] } : readCount ;

  assign zzIntrChannel = {31'd0, selectRIndReq ? 1'd0 : read$enq__ENA};
  assign interrupt_0__read = read$enq__ENA && ctrlPort_0_interruptEnableReg;
  assign readFirstNext = readFirst ? reqArs$count == 4  : readLast ;
  assign writeFirstNext = writeFirst ?  write_req$count == 4 : writeLast ;
  assign writeAddrupdate = writeFirst ?  write_req$addr : writeAddr ;
  assign writeburstCount = writeFirst ?  { 2'd0, write_req$count[9:2] } : writeCount ;

  always@(reqPortal$addr or read$enq$v or write$enq__RDY)
  begin
    case (reqPortal$addr)
      0: requestValue = read$enq$v;
      4: requestValue = { 31'd0, write$enq__RDY};
      default: requestValue = 32'd0;
    endcase
  end
  always@(reqPortal$addr or ctrlPort_0_interruptEnableReg or zzIntrChannel or selectRIndReq)
  begin
    case (reqPortal$addr)
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
        if (mg0ARVALID) begin
            portalRControl <= mg0ARADDR[11:5] == 7'd0;
            selectRIndReq <= mg0ARADDR[12];
        end
        if (RULEAW) begin
            portalWControl <= mg0AWADDR[11:5] == 7'd0;
            selectWIndReq <= mg0AWADDR[12];
        end
        if (RULEwrite && portalWControl && write$addr == 4)
          ctrlPort_0_interruptEnableReg <= write$enq$v[0];
        if (RULEW && mg0WLAST || RULEAW)
          CMRlastWriteDataSeen <= !RULEAW;
        if (RULEreadResp) begin
          readAddr <= readAddrupdate + 4 ;
          readCount <= readburstCount - 1 ;
          readFirst <= readFirstNext;
          readLast <= readburstCount == 2 ;
        end

        if (RULEwriteDone) begin
          writeAddr <= writeAddrupdate + 4 ;
          writeCount <= writeburstCount - 1 ;
          writeFirst <= writeFirstNext ;
          writeLast <= writeburstCount == 2 ;
        end
      end
  end

UserTop user(.CLK(CLK), .nRST(nRST),
  .write$enq__ENA(RULEwrite && !portalWControl), .write$enq$v(write$enq$v), .write$enq$last(write$addr != 0),
  .write$enq__RDY(write$enq__RDY),
  .read$enq__RDY(RULEread && !portalRControl), .read$enq$v(read$enq$v), .read$enq$last(), .read$enq__ENA(read$enq__ENA));
endmodule  // mkZynqTop
