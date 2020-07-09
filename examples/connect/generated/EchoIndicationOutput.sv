`include "connect.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    input wire indication$heard__ENA,
    input wire [32 - 1:0]indication$heard$meth,
    input wire [32 - 1:0]indication$heard$v,
    output wire indication$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [(32 + (32 + 32)) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    wire [32 - 1:0]indication$heard$ind$data$heard$meth;
    wire [32 - 1:0]indication$heard$ind$data$heard$v;
    wire [32 - 1:0]indication$heard$ind$tag;
    assign indication$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = { indication$heard$ind$data$heard$v , indication$heard$ind$data$heard$meth , indication$heard$ind$tag };
    assign pipe$enq__ENA = indication$heard__ENA;
    // Extra assigments, not to output wires
    assign indication$heard$ind$data$heard$meth = indication$heard$meth;
    assign indication$heard$ind$data$heard$v = indication$heard$v;
    assign indication$heard$ind$tag = 32'd1;
endmodule 

`default_nettype wire    // set back to default value
