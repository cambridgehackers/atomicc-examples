`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1_OC_23 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [14:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [14:0]out$first,
    output wire out$first__RDY);
    Fifo1Base_OC_25 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(in$enq__RDY),
        .out$deq__ENA(out$deq__ENA),
        .out$deq__RDY(out$deq__RDY),
        .out$first(out$first),
        .out$first__RDY(out$first__RDY));
endmodule 

`default_nettype wire    // set back to default value