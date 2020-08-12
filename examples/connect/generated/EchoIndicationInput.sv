`include "connect.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [(32 + (32 + 32)) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$meth,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    assign indication$heard$meth = pipe$enq$v$data$heard$meth;
    assign indication$heard$v = pipe$enq$v$data$heard$v;
    assign indication$heard__ENA = pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v$tag == 1 );
    assign pipe$enq__RDY = indication$heard__RDY || ( !( pipe$enq$v$tag == 1 ) );
endmodule

`default_nettype wire    // set back to default value
