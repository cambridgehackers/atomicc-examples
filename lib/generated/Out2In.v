`include "out2in.generated.vh"

`default_nettype none
module Out2In (input wire CLK, input wire nRST,
    output wire in$deq__ENA,
    input wire in$deq__RDY,
    input wire [32 - 1:0]in$first,
    input wire in$first__RDY,
    output wire out$enq__ENA,
    output wire [32 - 1:0]out$enq$v,
    input wire out$enq__RDY);
    wire RULE$copyRule__RDY;
    assign in$deq__ENA = RULE$copyRule__RDY;
    assign out$enq$v = in$first;
    assign out$enq__ENA = RULE$copyRule__RDY;
    // Extra assigments, not to output wires
    assign RULE$copyRule__RDY = in$first__RDY && out$enq__RDY && in$deq__RDY;
endmodule 

`default_nettype wire    // set back to default value
