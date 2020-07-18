`include "fifo.generated.vh"

`default_nettype none
module FifoPBase #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width - 1:0]in$enq$v,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [width - 1:0]out$enq$v,
    input wire out$enq__RDY);
    wire base$in$deq__ENA;
    wire [width - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [width - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    Fifo1Base#(.width(width)) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(base$in$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    Out2InBase#(.width(width)) base (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(base$in$deq__ENA),
        .in$deq__RDY(fifo$out$deq__RDY),
        .in$first(fifo$out$first),
        .in$first__RDY(fifo$out$first__RDY),
        .out$enq__ENA(out$enq__ENA),
        .out$enq$v(out$enq$v),
        .out$enq__RDY(out$enq__RDY));
    assign fifo$in$enq$v = in$enq$v;
    assign in$enq__RDY = fifo$in$enq__RDY;
endmodule 

`default_nettype wire    // set back to default value
