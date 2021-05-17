`include "atomicc.generated.vh"
`default_nettype none
module Bscan #(
    parameter integer id = 99,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server toBscan,
    PipeIn.client fromBscan);
    logic bscan$CAPTURE;
    logic bscan$SEL;
    logic bscan$SHIFT;
    logic bscan$TCK;
    logic bscan$TDI;
    logic bscan$TDO;
    logic bscan$UPDATE;
    logic bscan_mytck$O;
    logic captureF$CLK;
    logic captureF$in;
    logic captureF$nRST;
    logic captureF$out;
    logic localBscan$capture_out;
    logic localBscan$update;
    logic updateF$CLK;
    logic updateF$in;
    logic updateF$nRST;
    logic updateF$out;
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
        .capture(( ( bscan$SEL & bscan$CAPTURE ) != 0 ) && 1'd1),
        .shift(( ( bscan$SEL & bscan$SHIFT ) != 0 ) && 1'd1),
        .update(localBscan$update),
        .capture_out(localBscan$capture_out),
        .TDO(bscan$TDO),
        .TDI(bscan$TDI),
        .toBscan(toBscan.enq__ENA ? toBscan.enq$v : ( ( width ) ' ( 'd0 ) )),
        .fromBscan(fromBscan.enq$v));
    SyncFF updateF (
        .CLK(updateF$CLK),
        .nRST(updateF$nRST),
        .out(updateF$out),
        .in(updateF$in));
    SyncFF captureF (
        .CLK(captureF$CLK),
        .nRST(captureF$nRST),
        .out(captureF$out),
        .in(captureF$in));
    assign captureF$CLK = CLK;
    assign captureF$in = localBscan$capture_out;
    assign captureF$nRST = nRST;
    assign localBscan$update = ( ( bscan$SEL & bscan$UPDATE ) != 0 ) && 1'd1;
    assign updateF$CLK = CLK;
    assign updateF$in = localBscan$update;
    assign updateF$nRST = nRST;
    // Extra assigments, not to output wires
    assign captureF$out = toBscan.enq__RDY;
    assign updateF$out = fromBscan.enq__ENA;
endmodule

`default_nettype wire    // set back to default value
