`include "connect.generated.vh"

`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [127:0]in$enq$v,
    output wire in$enq__RDY,
    input wire forward$enq__ENA,
    input wire [127:0]forward$enq$v,
    output wire forward$enq__RDY,
    output wire out$enq__ENA,
    output wire [127:0]out$enq$v,
    input wire out$enq__RDY);
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    Fifo1Base#(128) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(forwardFifo$out$first__RDY & out$enq__RDY),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    assign in$enq__RDY = out$enq__RDY;
    assign out$enq$v = ( ( forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY ) ? forwardFifo$out$first : 0 ) | ( in$enq__ENA ? in$enq$v : 0 );
    assign out$enq__ENA = ( forwardFifo$out$first__RDY & forwardFifo$out$deq__RDY ) | in$enq__ENA;
endmodule 

`default_nettype wire    // set back to default value
