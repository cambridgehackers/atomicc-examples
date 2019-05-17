`include "mux.generated.vh"

`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [127:0]in$enq$v,
    input wire [15:0]in$enq$length,
    output wire in$enq__RDY,
    input wire forward$enq__ENA,
    input wire [127:0]forward$enq$v,
    input wire [15:0]forward$enq$length,
    output wire forward$enq__RDY,
    output wire out$enq__ENA,
    output wire [127:0]out$enq$v,
    output wire [15:0]out$enq$length,
    input wire out$enq__RDY);
    wire forwardFifo$in$enq__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    wire forwardFifol$in$enq__RDY;
    wire forwardFifol$out$deq__RDY;
    wire [15:0]forwardFifol$out$first;
    wire forwardFifol$out$first__RDY;
    Fifo1Base#(128) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA & forwardFifol$in$enq__RDY),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forwardFifo$in$enq__RDY),
        .out$deq__ENA(forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifol$out$deq__RDY),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    Fifo1Base#(16) forwardFifol (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA & forwardFifo$in$enq__RDY),
        .in$enq$v(forward$enq$length),
        .in$enq__RDY(forwardFifol$in$enq__RDY),
        .out$deq__ENA(forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY),
        .out$deq__RDY(forwardFifol$out$deq__RDY),
        .out$first(forwardFifol$out$first),
        .out$first__RDY(forwardFifol$out$first__RDY));
    assign forward$enq__RDY = forwardFifo$in$enq__RDY & forwardFifol$in$enq__RDY;
    assign in$enq__RDY = !( forwardFifo$out$first__RDY | ( !out$enq__RDY ) );
    assign out$enq$length = ( ( forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY & forwardFifol$out$deq__RDY ) ? forwardFifol$out$first : 16'd0 ) | ( ( !( forwardFifo$out$first__RDY | ( !( out$enq__RDY & in$enq__ENA ) ) ) ) ? in$enq$length : 16'd0 );
    assign out$enq$v = ( ( forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY & forwardFifol$out$deq__RDY ) ? forwardFifo$out$first : 128'd0 ) | ( ( !( forwardFifo$out$first__RDY | ( !( out$enq__RDY & in$enq__ENA ) ) ) ) ? in$enq$v : 128'd0 );
    assign out$enq__ENA = ( forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & forwardFifo$out$deq__RDY & forwardFifol$out$deq__RDY ) | ( ( !forwardFifo$out$first__RDY ) & in$enq__ENA );
endmodule 

`default_nettype wire    // set back to default value
