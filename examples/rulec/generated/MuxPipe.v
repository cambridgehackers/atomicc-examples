`include "zynqTop.generated.vh"

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
    wire RULEfifoRule__ENA;
    wire RULEfifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(out$enq__RDY),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY());
    assign in$enq__RDY = out$enq__RDY;
    assign out$enq$v = ( forwardFifo$out$deq__RDY & out$enq__RDY ) ? { forwardFifo$out$first[ 127 : 96 ] , forwardFifo$out$first[ 95 : 64 ] , forwardFifo$out$first[ 63 : 32 ] , forwardFifo$out$first[ 31 : 0 ] } : in$enq$v;
    assign out$enq__ENA = forwardFifo$out$deq__RDY || in$enq__ENA;
    // Extra assigments, not to output wires
    assign RULEfifoRule__ENA = forwardFifo$out$deq__RDY & out$enq__RDY;
    assign RULEfifoRule__RDY = forwardFifo$out$deq__RDY & out$enq__RDY;
endmodule 

`default_nettype wire    // set back to default value
