`include "echo.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire sout$say__ENA,
    input wire [32 - 1:0]sout$say$v,
    output wire sout$say__RDY,
    output wire ind$heard__ENA,
    output wire [32 - 1:0]ind$heard$v,
    input wire ind$heard__RDY);
    wire RULE$respond_rule__RDY;
    wire [32 - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    Fifo1Base#(32) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(RULE$respond_rule__RDY),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(ind$heard$v),
        .out$first__RDY(fifo$out$first__RDY));
    assign fifo$in$enq$v = sout$say$v;
    assign ind$heard__ENA = RULE$respond_rule__RDY;
    assign sout$say__RDY = fifo$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond_rule__RDY = fifo$out$deq__RDY && fifo$out$first__RDY && ind$heard__RDY;
endmodule 

`default_nettype wire    // set back to default value