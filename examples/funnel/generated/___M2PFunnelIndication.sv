`include "funneltest.generated.vh"

`default_nettype none
module ___M2PFunnelIndication (input wire CLK, input wire nRST,
    FunnelIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.heard__RDY = pipe.enq__RDY;
    assign pipe.enq$v = { 16'd0 , 16'd5 , method.heard$v , 64'd0 , 16'd64 };
    assign pipe.enq__ENA = method.heard__ENA;
endmodule

`default_nettype wire    // set back to default value
