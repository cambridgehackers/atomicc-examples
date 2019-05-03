`include "connect.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    input wire indication$heard__ENA,
    input wire [31:0]indication$heard$meth,
    input wire [31:0]indication$heard$v,
    output wire indication$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [95:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign indication$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = { indication$heard$v , indication$heard$meth , 32'd1 };
    assign pipe$enq__ENA = indication$heard__ENA;
endmodule 

`default_nettype wire    // set back to default value
