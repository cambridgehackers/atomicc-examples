
`include "ProjectDefines.vh"
`default_nettype none
module mkZynqTop (
  inout wire [14 : 0] DDR_Addr, inout wire [2 : 0] DDR_BankAddr,
  inout wire DDR_CAS_n, inout wire DDR_CKE, inout wire DDR_CS_n, inout wire DDR_Clk_n, inout wire DDR_Clk_p,
  inout wire [3 : 0] DDR_DM, inout wire [31 : 0] DDR_DQ,
  inout wire [3 : 0] DDR_DQS_n, inout wire [3 : 0] DDR_DQS_p,
  inout wire DDR_DRSTB, inout wire DDR_ODT, inout wire DDR_RAS_n,
  inout wire FIXED_IO_ddr_vrn, inout wire FIXED_IO_ddr_vrp, inout wire DDR_WEB, inout wire [53 : 0] MIO,
  inout wire FIXED_IO_ps_clk, inout wire FIXED_IO_ps_porb, inout wire FIXED_IO_ps_srstb);

  wire CLK, nRST;

  wire [31 : 0] MAXIGP0_O$AR$addr, MAXIGP0_O$AW$addr, MAXIGP0_O$W$data, MAXIGP0_I$R$data, read$enq$v, write$enq$v;
  wire [11 : 0] MAXIGP0_O$AR$id, MAXIGP0_O$AW$id, MAXIGP0_O$W$id;
  wire [9 : 0] readBeat$base, reqArs$count, readburstCount, writeBeat$count, reqAws$count, writeburstCount;
  wire [5 : 0] MAXIGP0_I$R$id, readBeat$id, reqArs$id, writeBeat$id, reqAws$id, MAXIGP0_I$B$id;
  wire [4 : 0] writeBeat$addr, reqAws$addr, writeAddrupdate, readBeat$addr, reqArs$addr, readAddrupdate;
  wire [3 : 0] ps7_ps7_foo_FCLKCLK, fclkRESETN, MAXIGP0_O$AR$len, MAXIGP0_O$AW$len;

  wire MAXIGP0_O$AR__ENA, MAXIGP0_O$AW__ENA, MAXIGP0_I$R__RDY, MAXIGP0_I$B__RDY, MAXIGP0_O$W$last, MAXIGP0_O$W__ENA;
  wire MAXIGP0_O$AR__RDY, MAXIGP0_I$R__ENA, MAXIGP0_I$B__ENA, MAXIGP0_O$W__RDY, MAXIGP0_O$AW__RDY;
  wire write$enq__RDY, read$enq__ENA, readData$EnqRDY, zzIntrChannel;
  wire readBeat$DeqRDY, readBeat$EnqRDY, read_req$EnqRDY;
  wire writeDataDeqRDY, readFirstNext, writeFirstNext, CMRdone$EnqRDY, readBeat$last;
  wire writeBeat$DeqRDY, writeBeat$EnqRDY, reqAws$DeqRDY, writeBeat$last;

  wire RULEwriteNext, RULEwrite, RULEAW, RULEW, RULER, RULEreadNext, RULEread;

  reg intEnable, writeFirst, writeLast;
  reg readFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
  reg [31 : 0] requestValue, portalCtrlInfo;
  reg [9 : 0] readCount, writeCount;
  reg [4 : 0] readAddr, writeAddr;

  FIFO1 #(.width(21), .guarded(1)) reqArs(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ MAXIGP0_O$AR$addr[4:0], { 4'd0, MAXIGP0_O$AR$len + 4'd1, 2'd0 }, MAXIGP0_O$AR$id[5:0]}), .ENQ(MAXIGP0_O$AR__ENA),
        .D_OUT({reqArs$addr, reqArs$count, reqArs$id}),
        .DEQ(RULEreadNext && readFirstNext), .FULL_N(read_req$EnqRDY), .EMPTY_N(MAXIGP0_O$AR__RDY));
  FIFO1 #(.width(22), .guarded(1)) readBeat(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({readAddrupdate, readburstCount, reqArs$id, readFirstNext}), .ENQ(RULEreadNext),
        .D_OUT({readBeat$addr, readBeat$base, readBeat$id, readBeat$last}),
        .DEQ(RULEread), .FULL_N(readBeat$EnqRDY), .EMPTY_N(readBeat$DeqRDY));
  FIFO1 #(.width(38), .guarded(1)) readData(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({portalRControl ? portalCtrlInfo : requestValue, readBeat$id}), .ENQ(RULEread),
        .D_OUT({MAXIGP0_I$R$data, MAXIGP0_I$R$id}), .DEQ(RULER),
        .FULL_N(readData$EnqRDY), .EMPTY_N(MAXIGP0_I$R__ENA));

  FIFO1 #(.width(21), .guarded(1)) reqAws(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({MAXIGP0_O$AW$addr[4:0], { 4'd0, MAXIGP0_O$AW$len + 4'd1, 2'd0 }, MAXIGP0_O$AW$id[5:0] }), .ENQ(RULEAW),
        .D_OUT({reqAws$addr, reqAws$count, reqAws$id}),
        .DEQ(RULEwriteNext && writeFirstNext), .FULL_N(MAXIGP0_O$AW__RDY), .EMPTY_N(reqAws$DeqRDY));
  FIFO1 #(.width(32), .guarded(1)) writeData(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN(MAXIGP0_O$W$data), .ENQ(RULEW),
        .D_OUT(write$enq$v), .DEQ(RULEwrite), .FULL_N(MAXIGP0_O$W__RDY), .EMPTY_N(writeDataDeqRDY));
  FIFO1 #(.width(22), .guarded(1)) writeBeat(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN({ writeAddrupdate, writeburstCount, reqAws$id, writeFirstNext }), .ENQ(RULEwriteNext),
        .D_OUT({writeBeat$addr, writeBeat$count, writeBeat$id, writeBeat$last}),
        .DEQ(RULEwrite), .FULL_N(writeBeat$EnqRDY), .EMPTY_N(writeBeat$DeqRDY));
  FIFO1 #(.width(6), .guarded(1)) CMRdone(.RST(nRST), .CLK(CLK), .CLR(0),
        .D_IN( writeBeat$id), .ENQ(RULEwrite && writeBeat$last),
        .D_OUT(MAXIGP0_I$B$id), .DEQ(MAXIGP0_I$B__RDY), .FULL_N(CMRdone$EnqRDY), .EMPTY_N(MAXIGP0_I$B__ENA));

  BUFG ps7_fclk_0_c(.I(ps7_ps7_foo_FCLKCLK[0]), .O(CLK));
  BUFG ps7_freset_0_r(.I(fclkRESETN[0]), .O(nRST));
ZynqTop ps7_ps7_foo (.CLK(CLK), .nRST(nRST),
        .FCLKCLK(ps7_ps7_foo_FCLKCLK), .FCLKRESETN(fclkRESETN), .FCLKCLKTRIGN(),
        .interrupt(read$enq__ENA && intEnable),
        .MAXIGP0_O$AR$addr(MAXIGP0_O$AR$addr), .MAXIGP0_O$AR$id(MAXIGP0_O$AR$id), .MAXIGP0_O$AR$len(MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__ENA(MAXIGP0_O$AR__ENA), .MAXIGP0_O$AR__RDY(!MAXIGP0_O$AR__RDY),

        .MAXIGP0_I$R$data(MAXIGP0_I$R$data), .MAXIGP0_I$R$resp(0), .MAXIGP0_I$R$last(1),
        .MAXIGP0_I$R$id(MAXIGP0_I$R$id), .MAXIGP0_I$R__RDY(MAXIGP0_I$R__RDY), .MAXIGP0_I$R__ENA(MAXIGP0_I$R__ENA),

        .MAXIGP0_O$AW$addr(MAXIGP0_O$AW$addr), .MAXIGP0_O$AW$id(MAXIGP0_O$AW$id), .MAXIGP0_O$AW$len(MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__ENA(MAXIGP0_O$AW__ENA), .MAXIGP0_O$AW__RDY(MAXIGP0_O$AW__RDY),

        .MAXIGP0_O$W$data(MAXIGP0_O$W$data), .MAXIGP0_O$W$id(MAXIGP0_O$W$id), .MAXIGP0_O$W$last(MAXIGP0_O$W$last),
        .MAXIGP0_O$W__ENA(MAXIGP0_O$W__ENA), .MAXIGP0_O$W__RDY(MAXIGP0_O$W__RDY),

        .MAXIGP0_I$B$resp(0), .MAXIGP0_I$B$id(MAXIGP0_I$B$id),
        .MAXIGP0_I$B__ENA(MAXIGP0_I$B__ENA && MAXIGP0_I$B__RDY), .MAXIGP0_I$B__RDY(MAXIGP0_I$B__RDY),
        .DDR_Addr(DDR_Addr), .DDR_BankAddr(DDR_BankAddr), .DDR_CAS_n(DDR_CAS_n),
        .DDR_CKE(DDR_CKE), .DDR_Clk_n(DDR_Clk_n), .DDR_Clk_p(DDR_Clk_p),
        .DDR_CS_n(DDR_CS_n), .DDR_DM(DDR_DM), .DDR_DQ(DDR_DQ),
        .DDR_DQS_n(DDR_DQS_n), .DDR_DQS_p(DDR_DQS_p), .DDR_DRSTB(DDR_DRSTB),
        .DDR_ODT(DDR_ODT), .DDR_RAS_n(DDR_RAS_n), .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp), .DDR_WEB(DDR_WEB), .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb), .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb), .MIO(MIO));

  assign RULEread = readBeat$DeqRDY && readData$EnqRDY;
  assign RULEreadNext = MAXIGP0_O$AR__RDY && readBeat$EnqRDY;
  assign RULER = MAXIGP0_I$R__RDY && MAXIGP0_I$R__ENA;
  assign RULEW = MAXIGP0_O$W__ENA && MAXIGP0_O$W__RDY;
  assign RULEAW = MAXIGP0_O$AW__ENA && MAXIGP0_O$AW__RDY;
  assign RULEwrite = writeDataDeqRDY && writeBeat$DeqRDY && (!writeBeat$last || CMRdone$EnqRDY)
            && (!selectWIndReq || portalWControl);
  assign RULEwriteNext = reqAws$DeqRDY && writeBeat$EnqRDY ;

  assign zzIntrChannel = !selectRIndReq && read$enq__ENA;
  assign readAddrupdate = readFirst ?  reqArs$addr : readAddr ;
  assign readburstCount = readFirst ?  { 2'd0, reqArs$count[9:2] } : readCount ;
  assign readFirstNext = readFirst ? reqArs$count == 4  : readLast ;

  assign writeAddrupdate = writeFirst ?  reqAws$addr : writeAddr ;
  assign writeburstCount = writeFirst ?  { 2'd0, reqAws$count[9:2] } : writeCount ;
  assign writeFirstNext = writeFirst ?  reqAws$count == 4 : writeLast ;

  always@(readBeat$addr or read$enq$v or write$enq__RDY)
  begin
    case (readBeat$addr)
      0: requestValue = read$enq$v;
      4: requestValue = write$enq__RDY;
      default: requestValue = 0;
    endcase
  end
  always@(readBeat$addr or intEnable or zzIntrChannel or selectRIndReq)
  begin
    case (readBeat$addr)
      0: portalCtrlInfo = zzIntrChannel; // PORTAL_CTRL_INTERRUPT_STATUS 0
      //4: portalCtrlInfo = 0;//{31'd0, intEnable; // PORTAL_CTRL_INTERRUPT_ENABLE 1
      8: portalCtrlInfo = 1;                         // PORTAL_CTRL_NUM_TILES        2
      5'h0C: portalCtrlInfo = zzIntrChannel;         // PORTAL_CTRL_IND_QUEUE_STATUS 3
      5'h10: portalCtrlInfo = selectRIndReq ? 6 : 5; // PORTAL_CTRL_PORTAL_ID        4
      5'h14: portalCtrlInfo = 2;                     // PORTAL_CTRL_NUM_PORTALS      5
      //5'h18: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_MSB      6
      //5'h1C: portalCtrlInfo = 0; // PORTAL_CTRL_COUNTER_LSB      7
      default: portalCtrlInfo = 0;
    endcase
  end

  always@(posedge CLK)
  begin
    if (nRST == 0)
      begin
        intEnable <=  1'd0;
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
        if (MAXIGP0_O$AR__ENA) begin
            portalRControl <= MAXIGP0_O$AR$addr[11:5] == 7'd0;
            selectRIndReq <= MAXIGP0_O$AR$addr[12];
        end
        if (RULEAW) begin
            portalWControl <= MAXIGP0_O$AW$addr[11:5] == 7'd0;
            selectWIndReq <= MAXIGP0_O$AW$addr[12];
        end
        if (RULEwrite && portalWControl && writeBeat$addr == 4)
          intEnable <= write$enq$v[0];
        if (RULEreadNext) begin
          readAddr <= readAddrupdate + 4 ;
          readCount <= readburstCount - 1 ;
          readFirst <= readFirstNext;
          readLast <= readburstCount == 2 ;
        end

        if (RULEwriteNext) begin
          writeAddr <= writeAddrupdate + 4 ;
          writeCount <= writeburstCount - 1 ;
          writeFirst <= writeFirstNext ;
          writeLast <= writeburstCount == 2 ;
        end
      end
  end

UserTop user(.CLK(CLK), .nRST(nRST),
  .write$enq__ENA(RULEwrite && !portalWControl), .write$enq$v(write$enq$v), .write$enq$last(writeBeat$addr != 0),
  .write$enq__RDY(write$enq__RDY),
  .read$enq__RDY(RULEread && !portalRControl), .read$enq$v(read$enq$v), .read$enq$last(), .read$enq__ENA(read$enq__ENA));
endmodule  // mkZynqTop
