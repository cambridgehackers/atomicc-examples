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
    wire [999999 - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__RDY;
    Fifo1Base#(.width(999999)) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(out$deq__ENA),
        .out$deq__RDY(out$deq__RDY),
        .out$first(out$first),
        .out$first__RDY(out$first__RDY));
    Out2InBase#(.width(999999)) base (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(),
        .in$deq__RDY(0),
        .in$first(0),
        .in$first__RDY(0),
        .out$enq__ENA(),
        .out$enq$v(),
        .out$enq__RDY(0));
    assign fifo$in$enq$v = in$enq$v;
    assign in$enq__RDY = fifo$in$enq__RDY;
    assign out$enq$v = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign out$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
endmodule 

`default_nettype wire    // set back to default value
