`include "atomicc.generated.vh"
`default_nettype none
module ___M2PPackIndication (input wire CLK, input wire nRST,
    PackIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.heard__RDY = pipe.enq__RDY;
    assign pipe.enq$v = { 16'd0 , 16'd5 , 8'd0 , method.heard$v , method.heard$writeCount , method.heard$readCount , method.heard$seqno , 32'd0 , 16'd96 };
    assign pipe.enq__ENA = method.heard__ENA;
endmodule

`default_nettype wire    // set back to default value
