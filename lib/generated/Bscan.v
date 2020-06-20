`include "bscan.generated.vh"

`default_nettype none
module Bscan #(
    parameter integer id = 3,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    input wire toBscan$enq__ENA,
    input wire [width - 1:0]toBscan$enq$v,
    output wire toBscan$enq__RDY,
    output wire fromBscan$enq__ENA,
    output wire [width - 1:0]fromBscan$enq$v,
    input wire fromBscan$enq__RDY);
    wire bscan$CAPTURE;
    wire bscan$SEL;
    wire bscan$SHIFT;
    wire bscan$TCK;
    wire bscan$TDI;
    wire bscan$TDO;
    wire bscan$UPDATE;
    wire fromBscan$enqS__ENA;
    wire localBscan$CLK;
    wire localBscan$TDI;
    wire localBscan$TDO;
    wire localBscan$capture;
    wire localBscan$nRST;
    wire localBscan$shift;
    wire [32 - 1:0]localBscan$toBscan$enq$v;
    wire localBscan$toBscan$enq__RDY;
    wire localBscan$update;
    wire tckbuf$I;
    wire tckbuf$O;
    wire toBscan$enqS__RDY;
    BSCANE2#(.JTAG_CHAIN(3)) bscan (
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
        .I(tckbuf$I),
        .O(tckbuf$O));
    BscanLocal#(32) localBscan (
        .toBscan$enq__ENA(toBscan$enq__ENA),
        .toBscan$enq$v(localBscan$toBscan$enq$v),
        .toBscan$enq__RDY(localBscan$toBscan$enq__RDY),
        .fromBscan$enq__ENA(fromBscan$enqS__ENA),
        .fromBscan$enq$v(fromBscan$enq$v),
        .fromBscan$enq__RDY(fromBscan$enq__RDY),
        .CLK(localBscan$CLK),
        .nRST(localBscan$nRST),
        .capture(localBscan$capture),
        .shift(localBscan$shift),
        .update(localBscan$update),
        .TDO(localBscan$TDO),
        .TDI(localBscan$TDI));
    SyncFF fromBscan$enq__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(fromBscan$enq__ENA),
        .in(fromBscan$enqS__ENA));
    SyncFF toBscan$enq__RDYSyncFF (.CLK(CLK), .nRST(nRST),
        .out(toBscan$enq__RDY),
        .in(toBscan$enqS__RDY));
    assign localBscan$CLK = tckbuf$O;
    assign localBscan$TDI = bscan$TDI;
    assign localBscan$capture = bscan$SEL && bscan$CAPTURE;
    assign localBscan$nRST = nRST;
    assign localBscan$shift = bscan$SEL && bscan$SHIFT;
    assign localBscan$toBscan$enq$v = toBscan$enq$v;
    assign localBscan$update = bscan$SEL && bscan$UPDATE;
    assign tckbuf$I = bscan$TCK;
    assign toBscan$enqS__RDY = localBscan$toBscan$enq__RDY;
    // Extra assigments, not to output wires
    assign localBscan$TDO = bscan$TDO;
endmodule 

`default_nettype wire    // set back to default value
