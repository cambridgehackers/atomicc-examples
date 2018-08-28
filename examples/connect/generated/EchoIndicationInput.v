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
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$heard$meth;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$heard$v;
    wire [31:0]pipe$enq__ENA$v_2e_addr$tag;
    assign indication$heard$meth = pipe$enq__ENA$v_2e_addr$data$heard$meth;
    assign indication$heard$v = pipe$enq__ENA$v_2e_addr$data$heard$v;
    assign indication$heard__ENA = ( pipe$enq__ENA$v_2e_addr$tag == 32'd1 ) & pipe$enq__ENA;
    assign pipe$enq__RDY = indication$heard__RDY;
endmodule 

`default_nettype wire    // set back to default value
