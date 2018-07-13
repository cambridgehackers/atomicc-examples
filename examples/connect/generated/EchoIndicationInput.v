`include "connect.generated.vh"

module EchoIndicationInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    assign indication$heard$meth = pipe$enq$v[63:32] ;
    assign indication$heard$v = pipe$enq$v[95:64] ;
    assign indication$heard__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;
    assign pipe$enq__RDY = indication$heard__RDY ;
endmodule 

