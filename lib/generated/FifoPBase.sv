`include "atomicc.generated.vh"
`default_nettype none
module FifoPBase #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeIn.client out);
    PipeOut#(.width(width)) base$in();
    PipeIn#(.width(width)) base$out();
    PipeIn#(.width(width)) fifo$in();
    PipeOut#(.width(width)) fifo$out();
    Fifo1Base#(.width(width)) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(base$in));
    Out2InBase#(.width(width)) base (.CLK(CLK), .nRST(nRST),
        .in(base$in),
        .out(out));
    // Extra assigments, not to output wires
    assign fifo$in.enq$v = in.enq$v;
    assign fifo$in.enq__ENA = in.enq__ENA;
    assign in.enq__RDY = fifo$in.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
