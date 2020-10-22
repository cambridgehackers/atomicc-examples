`include "out2in.generated.vh"

`default_nettype none
module Out2InLast #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeOutLast.client in,
    PipeInLast.client out);
    // Extra assigments, not to output wires
    assign in.deq__ENA = in.first__RDY && in.last__RDY && out.enq__RDY;
    assign out.enq$last = ( in.first__RDY && in.last__RDY && in.deq__RDY ) ? in.last : 0;
    assign out.enq$v = ( in.first__RDY && in.last__RDY && in.deq__RDY ) ? in.first : 0;
    assign out.enq__ENA = in.first__RDY && in.last__RDY && in.deq__RDY;
endmodule

`default_nettype wire    // set back to default value
