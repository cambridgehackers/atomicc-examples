`include "bscant.generated.vh"

`default_nettype none
module ___M2PBtestIndication (input wire CLK, input wire nRST,
    input wire method$heard__ENA,
    input wire [32 - 1:0]method$heard$v,
    input wire [8 - 1:0]method$heard$writeCount,
    input wire [8 - 1:0]method$heard$readCount,
    input wire [8 - 1:0]method$heard$seqno,
    output wire method$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [(16 + 128) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign method$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = { method$heard$seqno, method$heard$readCount, method$heard$writeCount, method$heard$v, 8'd0, 16'd0, 16'd5, 16'd3};
    assign pipe$enq__ENA = method$heard__ENA;
endmodule 

`default_nettype wire    // set back to default value
