`include "bscan.generated.vh"

`default_nettype none
module Bscan #(
    parameter integer id = 3,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server toBscan,
    PipeIn.client fromBscan);
    reg delayedIndication;
    reg delayedRequest;
    logic _fromBscan$enqS__ENA;
    logic _toBscan$enqS__RDY;
    logic bscan$CAPTURE;
    logic bscan$SEL;
    logic bscan$SHIFT;
    logic bscan$TCK;
    logic bscan$TDI;
    logic bscan$TDO;
    logic bscan$UPDATE;
    logic bscan_mytck$I;
    logic bscan_mytck$O;
    logic localBscan$CLK;
    logic localBscan$TDI;
    logic localBscan$TDO;
    logic localBscan$capture;
    PipeIn#(.width(width)) localBscan$fromBscan();
    logic localBscan$nRST;
    logic localBscan$shift;
    PipeIn#(.width(width)) localBscan$toBscan();
    logic localBscan$update;
    PipeIn#(.width(width)) readBscan();
    BSCANE2#(.JTAG_CHAIN(id)) bscan (
        .CAPTURE(bscan$CAPTURE),
        .DRCK(),
        .RESET(),
        .RUNTEST(),
        .SEL(bscan$SEL),
        .SHIFT(bscan$SHIFT),
        .TCK(bscan$TCK),
        .TDI(bscan$TDI),
        .TDO(bscan$TDO),
        .TMS(),
        .UPDATE(bscan$UPDATE));
    BUFG bscan_mytck (
        .I(bscan$TCK),
        .O(bscan_mytck$O));
    BscanLocal#(.width(width)) localBscan (
        .CLK(bscan_mytck$O),
        .nRST(nRST),
        .capture(!( ( bscan$SEL & bscan$CAPTURE ) == 0 )),
        .shift(!( ( bscan$SEL & bscan$SHIFT ) == 0 )),
        .update(!( ( bscan$SEL & bscan$UPDATE ) == 0 )),
        .TDO(bscan$TDO),
        .TDI(bscan$TDI),
        .toBscan(localBscan$toBscan),
        .fromBscan(readBscan));
    SyncFF fromBscan$enq__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(fromBscan.enq__ENA),
        .in(_fromBscan$enqS__ENA));
    SyncFF toBscan$enq__RDYSyncFF (.CLK(CLK), .nRST(nRST),
        .out(toBscan.enq__RDY),
        .in(_toBscan$enqS__RDY));
    assign bscan_mytck$I = bscan$TCK;
    assign localBscan$CLK = bscan_mytck$O;
    assign localBscan$TDI = bscan$TDI;
    assign localBscan$capture = !( ( bscan$SEL & bscan$CAPTURE ) == 0 );
    assign localBscan$nRST = nRST;
    assign localBscan$shift = !( ( bscan$SEL & bscan$SHIFT ) == 0 );
    assign localBscan$update = !( ( bscan$SEL & bscan$UPDATE ) == 0 );
    // Extra assigments, not to output wires
    assign fromBscan.enq$v = readBscan.enq__ENA ? readBscan.enq$v : 0;
    assign _fromBscan$enqS__ENA = readBscan.enq__ENA;
    assign localBscan$TDO = bscan$TDO;
    assign localBscan$toBscan.enq$v = toBscan.enq__ENA ? toBscan.enq$v : 0;
    assign localBscan$toBscan.enq__ENA = toBscan.enq__ENA;
    assign readBscan.enq__RDY = !( ( 0 == ( delayedIndication ^ 1 ) ) || ( !fromBscan.enq__RDY ) );
    assign _toBscan$enqS__RDY = !( ( 0 == ( delayedRequest ^ 1 ) ) || ( !localBscan$toBscan.enq__RDY ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        delayedIndication <= 0;
        delayedRequest <= 0;
      end // nRST
      else begin
        // RULE$delay1__ENA
            delayedIndication <= readBscan.enq__ENA != 0;
            delayedRequest <= toBscan.enq__ENA != 0;
        // End of RULE$delay1__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
