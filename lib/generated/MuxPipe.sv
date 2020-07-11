`include "mux.generated.vh"

`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [(16 + 128) - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire forward$enq__ENA,
    input wire [(16 + 128) - 1:0]forward$enq$v,
    output wire forward$enq__RDY,
    output wire out$enq__ENA,
    output wire [(16 + 128) - 1:0]out$enq$v,
    input wire out$enq__RDY);
    wire [128 - 1:0]RULE$fifoRule$agg_2e_tmp$data;
    wire [16 - 1:0]RULE$fifoRule$agg_2e_tmp$length;
    wire RULE$fifoRule__RDY;
    wire [144 - 1:0]forwardFifo$in$enq$v;
    wire forwardFifo$in$enq__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [144 - 1:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    Fifo1Base#(.width(144)) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forwardFifo$in$enq$v),
        .in$enq__RDY(forwardFifo$in$enq__RDY),
        .out$deq__ENA(RULE$fifoRule__RDY),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    Fifo1Base#(.width(16)) forwardFifol (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(0),
        .in$enq$v(0),
        .in$enq__RDY(),
        .out$deq__ENA(0),
        .out$deq__RDY(),
        .out$first(),
        .out$first__RDY());
    assign forward$enq__RDY = forwardFifo$in$enq__RDY;
    assign forwardFifo$in$enq$v = forward$enq$v;
    assign in$enq__RDY = !( forwardFifo$out$first__RDY || ( !out$enq__RDY ) );
    assign out$enq$v = ( ( in$enq__ENA && in$enq__RDY ) ? in$enq$v : 144'd0 ) | ( RULE$fifoRule__RDY ? { RULE$fifoRule$agg_2e_tmp$data , RULE$fifoRule$agg_2e_tmp$length } : 144'd0 );
    assign out$enq__ENA = ( in$enq__ENA && ( RULE$fifoRule__RDY || ( !forwardFifo$out$first__RDY ) ) ) || ( ( !in$enq__ENA ) && RULE$fifoRule__RDY );
    // Extra assigments, not to output wires
    assign RULE$fifoRule$agg_2e_tmp$data = forwardFifo$out$first[ 128 - 1 + 16 : 16 ];
    assign RULE$fifoRule$agg_2e_tmp$length = forwardFifo$out$first[ 16 - 1 : 0 ];
    assign RULE$fifoRule__RDY = ( in$enq__ENA == 0 ) && forwardFifo$out$first__RDY && out$enq__RDY && forwardFifo$out$deq__RDY;
endmodule 

`default_nettype wire    // set back to default value
