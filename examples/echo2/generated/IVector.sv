`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    IVectorRequest.server request,
    IVectorIndication.client indication);
    PipeIn#(.width(32 + 32 + ( 32 * 20 ))) fifo$in();
    PipeOut#(.width(32 + 32 + ( 32 * 20 ))) fifo$out();
    FifoPong#(.width(32 + 32 + ( 32 * 20 ))) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    // Extra assigments, not to output wires
    assign fifo$in.enq$v = request.say$v;
    assign fifo$in.enq__ENA = request.say__ENA;
    assign fifo$out.deq__ENA = fifo$out.first__RDY && indication.heard__RDY;
    assign indication.heard$v = fifo$out.first;
    assign indication.heard__ENA = fifo$out.deq__RDY && fifo$out.first__RDY;
    assign request.say__RDY = fifo$in.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
