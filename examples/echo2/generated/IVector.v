`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [703:0]request$say$v,
    output wire request$say__RDY,
    output wire ind$heard__ENA,
    output wire [703:0]ind$heard$v,
    input wire ind$heard__RDY);
    wire RULErespond__ENA;
    wire RULErespond__RDY;
    wire fifo$out$deq__RDY;
    wire [703:0]fifo$out$first;
    FifoPong fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say$v[ 703 : 672 ] , request$say$v[ 671 : 640 ] , request$say$v[ 639 : 608 ] , request$say$v[ 607 : 576 ] , request$say$v[ 575 : 544 ] , request$say$v[ 543 : 512 ] , request$say$v[ 511 : 480 ] , request$say$v[ 479 : 448 ] , request$say$v[ 447 : 416 ] , request$say$v[ 415 : 384 ] , request$say$v[ 383 : 352 ] , request$say$v[ 351 : 320 ] , request$say$v[ 319 : 288 ] , request$say$v[ 287 : 256 ] , request$say$v[ 255 : 224 ] , request$say$v[ 223 : 192 ] , request$say$v[ 191 : 160 ] , request$say$v[ 159 : 128 ] , request$say$v[ 127 : 96 ] , request$say$v[ 95 : 64 ] , request$say$v[ 63 : 32 ] , request$say$v[ 31 : 0 ] }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(ind$heard__RDY),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY());
    assign ind$heard$v = { fifo$out$first[ 703 : 672 ] , fifo$out$first[ 671 : 640 ] , fifo$out$first[ 639 : 608 ] , fifo$out$first[ 607 : 576 ] , fifo$out$first[ 575 : 544 ] , fifo$out$first[ 543 : 512 ] , fifo$out$first[ 511 : 480 ] , fifo$out$first[ 479 : 448 ] , fifo$out$first[ 447 : 416 ] , fifo$out$first[ 415 : 384 ] , fifo$out$first[ 383 : 352 ] , fifo$out$first[ 351 : 320 ] , fifo$out$first[ 319 : 288 ] , fifo$out$first[ 287 : 256 ] , fifo$out$first[ 255 : 224 ] , fifo$out$first[ 223 : 192 ] , fifo$out$first[ 191 : 160 ] , fifo$out$first[ 159 : 128 ] , fifo$out$first[ 127 : 96 ] , fifo$out$first[ 95 : 64 ] , fifo$out$first[ 63 : 32 ] , fifo$out$first[ 31 : 0 ] };
    assign ind$heard__ENA = fifo$out$deq__RDY;
    // Extra assigments, not to output wires
    assign RULErespond__ENA = fifo$out$deq__RDY & ind$heard__RDY;
    assign RULErespond__RDY = fifo$out$deq__RDY & ind$heard__RDY;
endmodule 

`default_nettype wire    // set back to default value
