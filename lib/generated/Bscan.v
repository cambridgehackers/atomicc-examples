`include "bscan.generated.vh"

`default_nettype none
module Bscan #(
    parameter integer id = 3,
    parameter integer width = 64)(
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
    wire localBscan$CLK;
    wire localBscan$TDI;
    wire localBscan$TDO;
    wire localBscan$capture;
    wire localBscan$nRST;
    wire localBscan$shift;
    wire localBscan$update;
    wire tckbuf$I;
    wire tckbuf$O;
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
    BscanLocal#(64) localBscan (
        .toBscan$enq__ENA(toBscan$enq__ENA),
        .toBscan$enq$v(toBscan$enq$v),
        .toBscan$enq__RDY(toBscan$enq__RDY),
        .fromBscan$enq__ENA(fromBscan$enq__ENA),
        .fromBscan$enq$v(fromBscan$enq$v),
        .fromBscan$enq__RDY(fromBscan$enq__RDY),
        .CLK(localBscan$CLK),
        .nRST(localBscan$nRST),
        .capture(localBscan$capture),
        .shift(localBscan$shift),
        .update(localBscan$update),
        .TDO(localBscan$TDO),
        .TDI(localBscan$TDI));
    assign localBscan$CLK = tckbuf$O;
    assign localBscan$TDI = bscan$TDI;
    assign localBscan$capture = bscan$SEL && bscan$CAPTURE;
    assign localBscan$nRST = nRST;
    assign localBscan$shift = bscan$SEL && bscan$SHIFT;
    assign localBscan$update = bscan$SEL && bscan$UPDATE;
    assign tckbuf$I = bscan$TCK;
    // Extra assigments, not to output wires
    assign localBscan$TDO = bscan$TDO;
endmodule 

`default_nettype wire    // set back to default value
