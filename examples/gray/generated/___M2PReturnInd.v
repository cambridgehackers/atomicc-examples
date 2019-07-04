`include "gray.generated.vh"

`default_nettype none
module ___M2PReturnInd #(
    parameter integer width = 4)(
    input wire CLK, input wire nRST,
    input wire method$value__ENA,
    input wire [width - 1:0]method$value$v,
    output wire method$value__RDY,
    output wire pipe$enq__ENA,
    output wire [128 - 1:0]pipe$enq$v,
    output wire [16 - 1:0]pipe$enq$length,
    input wire pipe$enq__RDY);
    assign method$value__RDY = pipe$enq__RDY;
    assign pipe$enq$length = 16'd1;
    assign pipe$enq$v = { method$value$v, 16'd0, 16'd5};
    assign pipe$enq__ENA = method$value__ENA;
endmodule 

`default_nettype wire    // set back to default value
