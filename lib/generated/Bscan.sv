`include "bscan.generated.vh"

`default_nettype none
module Bscan #(
    parameter integer id = 3,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server toBscan,
    PipeIn.client fromBscan);
    wire bscan$CAPTURE;
    wire bscan$SEL;
    wire bscan$SHIFT;
    wire bscan$TCK;
    wire bscan$TDI;
    wire bscan$TDO;
    wire bscan$UPDATE;
    wire fromBscan$enqS__ENA;
    wire localBscan$capture;
    wire localBscan$shift;
    PipeIn#(.width(width)) localBscan$toBscan();
    wire localBscan$update;
    PipeIn#(.width(width)) readBscan();
    wire tckbuf$O;
    wire toBscan$enqS__RDY;
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
    BUFG tckbuf (
        .I(bscan$TCK),
        .O(tckbuf$O));
    BscanLocal#(.width(width)) localBscan (
        .CLK(tckbuf$O),
        .nRST(nRST),
        .capture(localBscan$capture),
        .shift(localBscan$shift),
        .update(localBscan$update),
        .TDO(bscan$TDO),
        .TDI(bscan$TDI),
        .toBscan(localBscan$toBscan),
        .fromBscan(readBscan));
    SyncFF fromBscan$enq__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(fromBscan.enq__ENA),
        .in(fromBscan$enqS__ENA));
    SyncFF toBscan$enq__RDYSyncFF (.CLK(CLK), .nRST(nRST),
        .out(toBscan.enq__RDY),
        .in(toBscan$enqS__RDY));
    assign localBscan$capture = !( ( bscan$SEL & bscan$CAPTURE ) == 0 );
    assign localBscan$shift = !( ( bscan$SEL & bscan$SHIFT ) == 0 );
    assign localBscan$update = !( ( bscan$SEL & bscan$UPDATE ) == 0 );
    // Extra assigments, not to output wires
    assign fromBscan.enq$v = readBscan.enq$v;
    assign fromBscan$enqS__ENA = readBscan.enq__ENA;
    assign localBscan$toBscan.enq$v = toBscan.enq$v;
    assign localBscan$toBscan.enq__ENA = toBscan.enq__ENA;
    assign readBscan.enq__RDY = fromBscan.enq__RDY;
    assign toBscan$enqS__RDY = localBscan$toBscan.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
