`include "connect.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoIndication.client indication);
    EchoIndication_data temp$pipe$enq$v;
    // Extra assigments, not to output wires
    assign indication.heard$meth = temp$pipe$enq$v.data$heard$meth;
    assign indication.heard$v = temp$pipe$enq$v.data$heard$v;
    assign indication.heard__ENA = pipe.enq__ENA && pipe.enq__RDY && ( temp$pipe$enq$v.tag == 1 );
    assign pipe.enq__RDY = indication.heard__RDY || ( !( temp$pipe$enq$v.tag == 1 ) );
    assign temp$pipe$enq$v = pipe.enq$v;
endmodule

`default_nettype wire    // set back to default value
