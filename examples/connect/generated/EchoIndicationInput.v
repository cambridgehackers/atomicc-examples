`include "connect.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [95:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$meth,
    output wire [31:0]indication$heard$v,
    input wire indication$heard__RDY);
    assign indication$heard$meth = pipe$enq$v[63:32];
    assign indication$heard$v = pipe$enq$v[95:64];
    assign indication$heard__ENA = ( pipe$enq$v[31:0] == 32'd1 ) & pipe$enq__ENA & pipe$enq__RDY;
    assign pipe$enq__RDY = ( pipe$enq$v[31:0] != 32'd1 ) | indication$heard__RDY;
endmodule 

`default_nettype wire    // set back to default value
