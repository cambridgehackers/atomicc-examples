
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
  wire [31 : 0] requestValue, portalCtrlInfo;
  wire [11 : 0] MAXIGP0_O$AR$id, MAXIGP0_O$AW$id, MAXIGP0_O$W$id;
  wire [3 : 0] readBeat$base, readburstCount, writeBeat$count, writeburstCount;
  wire [5 : 0] MAXIGP0_I$R$id, readBeat$id, reqArs$id, writeBeat$id, reqAws$id, MAXIGP0_I$B$id;
  wire [4 : 0] writeBeat$addr, reqAws$addr, writeAddrupdate, readBeat$addr, reqArs$addr, readAddrupdate;
  wire [3 : 0] ps7_ps7_foo_FCLKCLK, fclkRESETN, MAXIGP0_O$AR$len, MAXIGP0_O$AW$len, reqArs$count, reqAws$count;

  wire MAXIGP0_O$AR__ENA, MAXIGP0_O$AW__ENA, MAXIGP0_I$R__RDY, MAXIGP0_I$B__RDY, MAXIGP0_O$W$last, MAXIGP0_O$W__ENA;
  wire MAXIGP0_O$AR__RDY, MAXIGP0_I$R__ENA, MAXIGP0_I$B__ENA, MAXIGP0_O$W__RDY, MAXIGP0_O$AW__RDY;
  wire write$enq__RDY, read$enq__ENA, readData$in$enq__RDY, zzIntrChannel;
  wire readBeat$out$deq__RDY, readBeat$in$enq__RDY, interrupt;
  wire writeData$out$deq__RDY, readLastNext, writeLastNext, writeDone$in$enq__RDY, readBeat$last;
  wire writeBeat$out$deq__RDY, writeBeat$in$enq__RDY, reqAws$out$deq__RDY, writeBeat$last, reqArs$out$deq__RDY;

  wire RULEwriteNext, RULElwrite, RULEreadNext, RULElread;

  BUFG ps7_fclk_0_c(.I(ps7_ps7_foo_FCLKCLK[0]), .O(CLK));
  BUFG ps7_freset_0_r(.I(fclkRESETN[0]), .O(nRST));
ZynqTop ps7_ps7_foo (.CLK(CLK), .nRST(nRST),
        .FCLKCLK(ps7_ps7_foo_FCLKCLK), .FCLKRESETN(fclkRESETN), .FCLKCLKTRIGN(),
        .interrupt(interrupt),
        .MAXIGP0_O$AR$addr(MAXIGP0_O$AR$addr), .MAXIGP0_O$AR$id(MAXIGP0_O$AR$id), .MAXIGP0_O$AR$len(MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__ENA(MAXIGP0_O$AR__ENA), .MAXIGP0_O$AR__RDY(MAXIGP0_O$AR__RDY),

        .MAXIGP0_I$R$data(MAXIGP0_I$R$data), .MAXIGP0_I$R$resp(0), .MAXIGP0_I$R$last(1),
        .MAXIGP0_I$R$id(MAXIGP0_I$R$id), .MAXIGP0_I$R__RDY(MAXIGP0_I$R__RDY), .MAXIGP0_I$R__ENA(MAXIGP0_I$R__ENA),

        .MAXIGP0_O$AW$addr(MAXIGP0_O$AW$addr), .MAXIGP0_O$AW$id(MAXIGP0_O$AW$id), .MAXIGP0_O$AW$len(MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__ENA(MAXIGP0_O$AW__ENA), .MAXIGP0_O$AW__RDY(MAXIGP0_O$AW__RDY),

        .MAXIGP0_O$W$data(MAXIGP0_O$W$data), .MAXIGP0_O$W$id(MAXIGP0_O$W$id), .MAXIGP0_O$W$last(MAXIGP0_O$W$last),
        .MAXIGP0_O$W__ENA(MAXIGP0_O$W__ENA), .MAXIGP0_O$W__RDY(MAXIGP0_O$W__RDY),

        .MAXIGP0_I$B$resp(0), .MAXIGP0_I$B$id(MAXIGP0_I$B$id),
        .MAXIGP0_I$B__ENA(MAXIGP0_I$B__ENA), .MAXIGP0_I$B__RDY(MAXIGP0_I$B__RDY),
        .DDR_Addr(DDR_Addr), .DDR_BankAddr(DDR_BankAddr), .DDR_CAS_n(DDR_CAS_n),
        .DDR_CKE(DDR_CKE), .DDR_Clk_n(DDR_Clk_n), .DDR_Clk_p(DDR_Clk_p),
        .DDR_CS_n(DDR_CS_n), .DDR_DM(DDR_DM), .DDR_DQ(DDR_DQ),
        .DDR_DQS_n(DDR_DQS_n), .DDR_DQS_p(DDR_DQS_p), .DDR_DRSTB(DDR_DRSTB),
        .DDR_ODT(DDR_ODT), .DDR_RAS_n(DDR_RAS_n), .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp), .DDR_WEB(DDR_WEB), .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb), .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb), .MIO(MIO));

  reg intEnable, writeNotFirst, writeLast, readNotFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
  reg [3 : 0] readCount, writeCount;
  reg [4 : 0] readAddr, writeAddr;

  Fifo1_OC_10 reqArs(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v({MAXIGP0_O$AR$addr[4:0], MAXIGP0_O$AR$len + 4'd1, MAXIGP0_O$AR$id[5:0]}),
        .in$enq__RDY(MAXIGP0_O$AR__RDY),
        .out$deq__ENA(RULEreadNext && readLastNext),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first({reqArs$addr, reqArs$count, reqArs$id}),
        .out$first__RDY());
  Fifo1_OC_10 reqAws(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v({MAXIGP0_O$AW$addr[4:0], MAXIGP0_O$AW$len + 4'd1, MAXIGP0_O$AW$id[5:0]}),
        .in$enq__RDY(MAXIGP0_O$AW__RDY),
        .out$deq__ENA(RULEwriteNext && writeLastNext),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first({reqAws$addr, reqAws$count, reqAws$id}),
        .out$first__RDY());
  Fifo1_OC_12 readBeat(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULEreadNext),
        .in$enq$v({readAddrupdate, readburstCount, reqArs$id, readLastNext}),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(RULElread),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first({readBeat$addr, readBeat$base, readBeat$id, readBeat$last}),
        .out$first__RDY());
  Fifo1_OC_12 writeBeat(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULEwriteNext),
        .in$enq$v({writeAddrupdate, writeburstCount, reqAws$id, writeLastNext}),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(RULElwrite),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first({writeBeat$addr, writeBeat$count, writeBeat$id, writeBeat$last}),
        .out$first__RDY());
  Fifo1_OC_14 readData(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULElread),
        .in$enq$v({portalRControl ? portalCtrlInfo : requestValue, readBeat$id}),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$R__RDY),
        .out$deq__RDY(MAXIGP0_I$R__ENA),
        .out$first({MAXIGP0_I$R$data, MAXIGP0_I$R$id}),
        .out$first__RDY());
  Fifo1_OC_16 writeData(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v(MAXIGP0_O$W$data),
        .in$enq__RDY(MAXIGP0_O$W__RDY),
        .out$deq__ENA(RULElwrite),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(write$enq$v),
        .out$first__RDY());
  Fifo1_OC_18 writeDone(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULElwrite && writeBeat$last),
        .in$enq$v(writeBeat$id),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$B__RDY),
        .out$deq__RDY(MAXIGP0_I$B__ENA),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY());

  UserTop user(.nRST(nRST), .CLK(CLK),
    .write$enq__ENA(RULElwrite && !portalWControl),
    .write$enq$v(write$enq$v), .write$enq$last(writeBeat$addr != 0),
    .write$enq__RDY(write$enq__RDY),
    .read$enq__ENA(read$enq__ENA),
    .read$enq$v(read$enq$v), .read$enq$last(),
    .read$enq__RDY(RULElread && !portalRControl));

  assign RULEreadNext = reqArs$out$deq__RDY && readBeat$in$enq__RDY;
  assign RULEwriteNext = reqAws$out$deq__RDY && writeBeat$in$enq__RDY ;
  assign RULElread = readBeat$out$deq__RDY && readData$in$enq__RDY;
  assign RULElwrite = writeData$out$deq__RDY && writeBeat$out$deq__RDY
            && (!writeBeat$last || writeDone$in$enq__RDY)
            && (!selectWIndReq || portalWControl);

  assign interrupt = read$enq__ENA && intEnable;
  assign zzIntrChannel = read$enq__ENA && !selectRIndReq;
  assign readAddrupdate = readNotFirst ? readAddr : reqArs$addr;
  assign readburstCount = readNotFirst ? readCount : reqArs$count;
  assign readLastNext = readNotFirst ? readLast : reqArs$count == 1;

  assign writeAddrupdate = writeNotFirst ? writeAddr : reqAws$addr;
  assign writeburstCount = writeNotFirst ? writeCount : reqAws$count;
  assign writeLastNext = writeNotFirst ? writeLast : reqAws$count == 1;

  assign requestValue = readBeat$addr == 0 ? read$enq$v : readBeat$addr == 4 ? write$enq__RDY : 0;
  assign portalCtrlInfo = readBeat$addr == 0 ? zzIntrChannel :
      readBeat$addr == 8 ? 1 :
      readBeat$addr == 5'h0C ? zzIntrChannel :
      readBeat$addr == 5'h10 ? (selectRIndReq ? 6 : 5) :
      readBeat$addr == 5'h14 ? 2 : 0;

  always@(posedge CLK)
  begin
    if (nRST == 0)
      begin
        intEnable <=  0;
        readAddr <= 0;
        readCount <= 0;
        readNotFirst <= 0;
        readLast <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeNotFirst <= 0;
        writeLast <= 0;
      end
    else
      begin
        if (MAXIGP0_O$AR__ENA && MAXIGP0_O$AR__RDY) begin
            portalRControl <= MAXIGP0_O$AR$addr[11:5] == 7'd0;
            selectRIndReq <= MAXIGP0_O$AR$addr[12];
        end
        if (MAXIGP0_O$AW__ENA && MAXIGP0_O$AW__RDY) begin
            portalWControl <= MAXIGP0_O$AW$addr[11:5] == 7'd0;
            selectWIndReq <= MAXIGP0_O$AW$addr[12];
        end
        if (RULEreadNext) begin
          readAddr <= readAddrupdate + 4 ;
          readCount <= readburstCount - 1 ;
          readNotFirst <= !readLastNext;
          readLast <= readburstCount == 2 ;
        end
        if (RULElwrite && portalWControl && writeBeat$addr == 4)
          intEnable <= write$enq$v[0];

        if (RULEwriteNext) begin
          writeAddr <= writeAddrupdate + 4 ;
          writeCount <= writeburstCount - 1 ;
          writeNotFirst <= !writeLastNext ;
          writeLast <= writeburstCount == 2 ;
        end
      end
  end
endmodule  // mkZynqTop
