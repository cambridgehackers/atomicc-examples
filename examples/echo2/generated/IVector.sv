`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    IVectorRequest.server request,
    IndIF.client ind);
    ValuePair RULE$respond$agg_2e_tmp;
    PipeIn#(.width(32 + 32 + ( 32 * 20 ))) fifo$in();
    PipeOut#(.width(32 + 32 + ( 32 * 20 ))) fifo$out();
    ValuePair request$say$agg_2e_tmp;
    FifoPong fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    // Extra assigments, not to output wires
    assign RULE$respond$agg_2e_tmp = fifo$out.first;
    assign fifo$in.enq$v = request.say$v;
    assign fifo$in.enq__ENA = request.say__ENA;
    assign fifo$out.deq__ENA = fifo$out.first__RDY && ind.heard__RDY;
    assign ind.heard$v = fifo$out.first;
    assign ind.heard__ENA = fifo$out.deq__RDY && fifo$out.first__RDY;
    assign request.say$agg_2e_tmp = request.say$v;
    assign request.say__RDY = fifo$in.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
