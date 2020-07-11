`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [((32 + 32) + (32 * 20)) - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire ind$heard__ENA,
    output wire [((32 + 32) + (32 * 20)) - 1:0]ind$heard$v,
    input wire ind$heard__RDY);
    wire [32 - 1:0]RULE$respond$agg_2e_tmp$a;
    wire [32 - 1:0]RULE$respond$agg_2e_tmp$b;
    wire [32 - 1:0]RULE$respond$agg_2e_tmp$c;
    wire [((32 + 32) + (32 * 20)) - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire [((32 + 32) + (32 * 20)) - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire [32 - 1:0]request$say$agg_2e_tmp$a;
    wire [32 - 1:0]request$say$agg_2e_tmp$b;
    wire [32 - 1:0]request$say$agg_2e_tmp$c;
    FifoPong fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign fifo$in$enq$v = { request$say$agg_2e_tmp$c , request$say$agg_2e_tmp$b , request$say$agg_2e_tmp$a };
    assign fifo$out$deq__ENA = fifo$out$first__RDY && ind$heard__RDY;
    assign ind$heard$v = { RULE$respond$agg_2e_tmp$c , RULE$respond$agg_2e_tmp$b , RULE$respond$agg_2e_tmp$a };
    assign ind$heard__ENA = fifo$out$deq__RDY && fifo$out$first__RDY;
    assign request$say__RDY = fifo$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond$agg_2e_tmp$a = fifo$out$first[ 32 - 1 : 0 ];
    assign RULE$respond$agg_2e_tmp$b = fifo$out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond$agg_2e_tmp$c = fifo$out$first[ 32 - 1 + 64 : 64 ];
    assign request$say$agg_2e_tmp$a = request$say$v[ 32 - 1 : 0 ];
    assign request$say$agg_2e_tmp$b = request$say$v[ 32 - 1 + 32 : 32 ];
    assign request$say$agg_2e_tmp$c = request$say$v[ 32 - 1 + 64 : 64 ];
endmodule 

`default_nettype wire    // set back to default value
