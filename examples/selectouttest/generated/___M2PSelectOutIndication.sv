`include "selectouttest.generated.vh"

`default_nettype none
module ___M2PSelectOutIndication (input wire CLK, input wire nRST,
    SelectOutIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.heard__RDY = pipe.enq__RDY;
    assign pipe.enq$v = method.heard__ENA ? { 16'd0 , 16'd5 , 24'd0 , method.heard$rindex , method.heard$v , 32'd0 , 16'd96 } : 0;
    assign pipe.enq__ENA = method.heard__ENA;
endmodule

`default_nettype wire    // set back to default value
