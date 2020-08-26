`include "connect.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoIndication.client indication);
    // Extra assigments, not to output wires
    assign indication.heard$meth = pipe.enq$v$data$heard$meth;
    assign indication.heard$v = pipe.enq$v$data$heard$v;
    assign indication.heard__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v$tag == 1 );
    assign pipe.enq__RDY = indication.heard__RDY || ( !( pipe.enq$v$tag == 1 ) );
endmodule

`default_nettype wire    // set back to default value
