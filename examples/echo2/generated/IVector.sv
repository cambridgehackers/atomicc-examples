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
    assign RULE$respond$agg_2e_tmp.a = fifo$out.first[ 32 - 1 : 0 ];
    assign RULE$respond$agg_2e_tmp.b = fifo$out.first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond$agg_2e_tmp.c = fifo$out.first[ 32 - 1 + 64 : 64 ];
    assign fifo$in.enq$v = request.say$agg_2e_tmp;
    assign fifo$in.enq__ENA = request.say__ENA;
    assign fifo$out.deq__ENA = fifo$out.first__RDY && ind.heard__RDY;
    assign ind.heard$v = RULE$respond$agg_2e_tmp;
    assign ind.heard__ENA = fifo$out.deq__RDY && fifo$out.first__RDY;
    assign request.say$agg_2e_tmp.a = request.say$v[ 32 - 1 : 0 ];
    assign request.say$agg_2e_tmp.b = request.say$v[ 32 - 1 + 32 : 32 ];
    assign request.say$agg_2e_tmp.c = request.say$v[ 32 - 1 + 64 : 64 ];
    assign request.say__RDY = fifo$in.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
