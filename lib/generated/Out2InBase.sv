`include "out2in.generated.vh"

`default_nettype none
module Out2InBase #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeOut.client in,
    PipeIn.client out);
    logic RULE$copyRule__RDY;
    // Extra assigments, not to output wires
    assign RULE$copyRule__RDY = in.first__RDY && out.enq__RDY && in.deq__RDY;
    assign in.deq__ENA = in.first__RDY && out.enq__RDY;
    assign out.enq$v = in.first;
    assign out.enq__ENA = in.first__RDY && in.deq__RDY;
endmodule

`default_nettype wire    // set back to default value
