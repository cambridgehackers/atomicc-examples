`include "connect.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoIndication.client indication);
    EchoIndication_data _pipe$enq$temp$v;
    // Extra assigments, not to output wires
    assign _pipe$enq$temp$v = pipe.enq$v;
    assign indication.heard$meth = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 ) ) ? _pipe$enq$temp$v.data$heard$meth : 0;
    assign indication.heard$v = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 ) ) ? _pipe$enq$temp$v.data$heard$v : 0;
    assign indication.heard__ENA = pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 );
    assign pipe.enq__RDY = indication.heard__RDY || ( _pipe$enq$temp$v.tag != 1 );
endmodule

`default_nettype wire    // set back to default value
