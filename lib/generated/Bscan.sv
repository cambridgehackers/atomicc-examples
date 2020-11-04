`include "bscan.generated.vh"

`default_nettype none
module Bscan #(
    parameter integer id = 3,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server toBscan,
    PipeIn.client fromBscan);
    reg captureFlag1;
    reg captureFlag2;
    reg updateFlag1;
    reg updateFlag2;
    reg updateFlag3;
    logic bscan$CAPTURE;
    logic bscan$SEL;
    logic bscan$SHIFT;
    logic bscan$TCK;
    logic bscan$TDI;
    logic bscan$TDO;
    logic bscan$UPDATE;
    logic bscan_mytck$O;
    logic localBscan$capture;
    logic [width - 1:0]localBscan$fromBscan;
    logic localBscan$update;
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
        .update(( ( bscan$SEL & bscan$UPDATE ) != 0 ) && 1'd1),
        .TDO(bscan$TDO),
        .TDI(bscan$TDI),
        .toBscan(toBscan.enq__ENA ? toBscan.enq$v : 0),
        .fromBscan(localBscan$fromBscan));
    assign localBscan$capture = ( ( bscan$SEL & bscan$CAPTURE ) != 0 ) && 1'd1;
    assign localBscan$update = ( ( bscan$SEL & bscan$UPDATE ) != 0 ) && 1'd1;
    // Extra assigments, not to output wires
    assign fromBscan.enq$v = ( ( !updateFlag3 ) && updateFlag2 ) ? localBscan$fromBscan : 0;
    assign fromBscan.enq__ENA = ( !updateFlag3 ) && updateFlag2;
    assign toBscan.enq__RDY = captureFlag2;

    always @( posedge CLK) begin
      if (!nRST) begin
        captureFlag1 <= 0;
        captureFlag2 <= 0;
        updateFlag1 <= 0;
        updateFlag2 <= 0;
        updateFlag3 <= 0;
      end // nRST
      else begin
        // RULE$init__ENA
            updateFlag1 <= localBscan$update;
            updateFlag2 <= updateFlag1;
            updateFlag3 <= updateFlag2;
            captureFlag1 <= localBscan$capture;
            captureFlag2 <= captureFlag1;
        // End of RULE$init__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
