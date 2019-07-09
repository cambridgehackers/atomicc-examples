`include "mux.generated.vh"

`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [128 - 1:0]in$enq$v,
    input wire [16 - 1:0]in$enq$length,
    output wire in$enq__RDY,
    input wire forward$enq__ENA,
    input wire [128 - 1:0]forward$enq$v,
    input wire [16 - 1:0]forward$enq$length,
    output wire forward$enq__RDY,
    output wire out$enq__ENA,
    output wire [128 - 1:0]out$enq$v,
    output wire [16 - 1:0]out$enq$length,
    input wire out$enq__RDY);
    wire RULE$fifoRule__RDY;
    wire forwardFifo$in$enq__ENA;
    wire forwardFifo$in$enq__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [128 - 1:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    wire forwardFifol$in$enq__ENA;
    wire forwardFifol$in$enq__RDY;
    wire forwardFifol$out$deq__RDY;
    wire [16 - 1:0]forwardFifol$out$first;
    wire forwardFifol$out$first__RDY;
    Fifo1Base#(128) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forwardFifo$in$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forwardFifo$in$enq__RDY),
        .out$deq__ENA(RULE$fifoRule__RDY),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    Fifo1Base#(16) forwardFifol (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forwardFifol$in$enq__ENA),
        .in$enq$v(forward$enq$length),
        .in$enq__RDY(forwardFifol$in$enq__RDY),
        .out$deq__ENA(RULE$fifoRule__RDY),
        .out$deq__RDY(forwardFifol$out$deq__RDY),
        .out$first(forwardFifol$out$first),
        .out$first__RDY(forwardFifol$out$first__RDY));
    assign forward$enq__RDY = forwardFifo$in$enq__RDY & forwardFifol$in$enq__RDY;
    assign forwardFifo$in$enq__ENA = forward$enq__ENA & forward$enq__RDY;
    assign forwardFifol$in$enq__ENA = forward$enq__ENA & forward$enq__RDY;
    assign in$enq__RDY = !( forwardFifo$out$first__RDY | ( !out$enq__RDY ) );
    assign out$enq$length = ( RULE$fifoRule__RDY ? forwardFifol$out$first : 16'd0 ) | ( ( in$enq__ENA & in$enq__RDY ) ? in$enq$length : 16'd0 );
    assign out$enq$v = ( RULE$fifoRule__RDY ? forwardFifo$out$first : 128'd0 ) | ( ( in$enq__ENA & in$enq__RDY ) ? in$enq$v : 128'd0 );
    assign out$enq__ENA = RULE$fifoRule__RDY | ( in$enq__ENA & in$enq__RDY );
    // Extra assigments, not to output wires
    assign RULE$fifoRule__RDY = forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY & forwardFifol$out$deq__RDY;
endmodule 

`default_nettype wire    // set back to default value
