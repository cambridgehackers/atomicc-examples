`include "atomicc.generated.vh"
`include "lpm.generated.vh"
`default_nettype none
module ___M2PLpmIndication (input wire CLK, input wire nRST,
    LpmIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.out__RDY = pipe.enq__RDY;
    assign pipe.enq$v = { 16'd0 , 16'd5 , method.out$data , 64'd0 , 16'd64 };
    assign pipe.enq__ENA = method.out__ENA;
endmodule

`default_nettype wire    // set back to default value
