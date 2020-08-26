`include "connect.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    EchoIndication.server indication,
    PipeIn.client pipe);
    EchoIndication_data indication$heard$ind;
    // Extra assigments, not to output wires
    assign indication$heard$ind.data$heard$meth = indication.heard$meth;
    assign indication$heard$ind.data$heard$v = indication.heard$v;
    assign indication$heard$ind.tag = 32'd1;
    assign indication.heard__RDY = pipe.enq__RDY;
    assign pipe.enq$v = indication.heard$ind;
    assign pipe.enq__ENA = indication.heard__ENA;
endmodule

`default_nettype wire    // set back to default value
