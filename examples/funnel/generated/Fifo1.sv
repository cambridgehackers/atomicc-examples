`include "funnel.generated.vh"

`default_nettype none
module Fifo1 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [32 - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [32 - 1:0]out$first,
    output wire out$first__RDY);
    wire [32 - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__ENA;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire [32 - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    Fifo1Base#(.width(32)) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign fifo$in$enq$v = in$enq$v;
    assign fifo$in$enq__ENA = in$enq__ENA && BasicBlockCond__ZN5Fifo1IiACCS32ACCEE6in$enqEiACCS32ACCE_entry;
    assign fifo$out$deq__ENA = out$deq__ENA && BasicBlockCond__ZN5Fifo1IiACCS32ACCEE7out$deqEv_entry;
    assign in$enq__RDY = fifo$in$enq__RDY || ( !BasicBlockCond__ZN5Fifo1IiACCS32ACCEE6in$enqEiACCS32ACCE_entry );
    assign out$deq__RDY = fifo$out$deq__RDY || ( !BasicBlockCond__ZN5Fifo1IiACCS32ACCEE7out$deqEv_entry );
    assign out$first = BasicBlockCond__ZN5Fifo1IiACCS32ACCEE9out$firstEv_entry ? fifo$out$first : 32'd0;
    assign out$first__RDY = fifo$out$first__RDY || ( !BasicBlockCond__ZN5Fifo1IiACCS32ACCEE9out$firstEv_entry );
endmodule

`default_nettype wire    // set back to default value
