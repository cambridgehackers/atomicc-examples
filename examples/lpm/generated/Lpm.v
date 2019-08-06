`include "lpm.generated.vh"

`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    input wire request$enter__ENA,
    input wire [32 - 1:0]request$enter$x,
    output wire request$enter__RDY,
    output wire outQ$enq__ENA,
    output wire [32 - 1:0]outQ$enq$v,
    input wire outQ$enq__RDY);
    wire [16 - 1:0]RULE$enter$agg_2e_tmp$IPA;
    wire [3 - 1:0]RULE$enter$agg_2e_tmp$state;
    wire [4 - 1:0]RULE$enter$agg_2e_tmp$ticket;
    wire [4 - 1:0]RULE$enter$ticket;
    wire [32 - 1:0]RULE$enter$x;
    wire RULE$enter__RDY;
    wire [32 - 1:0]RULE$exitr$x;
    wire RULE$exitr__RDY;
    wire [16 - 1:0]RULE$recirc$agg_2e_tmp$IPA;
    wire [3 - 1:0]RULE$recirc$agg_2e_tmp$state;
    wire [4 - 1:0]RULE$recirc$agg_2e_tmp$ticket;
    wire [32 - 1:0]RULE$recirc$x;
    wire [16 - 1:0]RULE$recirc$y$IPA;
    wire [3 - 1:0]RULE$recirc$y$state;
    wire [4 - 1:0]RULE$recirc$y$ticket;
    wire RULE$recirc__RDY;
    wire [23 - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__ENA;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire [23 - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire [32 - 1:0]inQ$in$enq$v;
    wire inQ$in$enq__RDY;
    wire inQ$out$deq__RDY;
    wire [32 - 1:0]inQ$out$first;
    wire inQ$out$first__RDY;
    wire [32 - 1:0]mem$ifc$req$v;
    wire mem$ifc$req__ENA;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__ENA;
    wire mem$ifc$resAccept__RDY;
    wire [32 - 1:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    BufTicket compBuf (.CLK(CLK), .nRST(nRST),
        .tickIfc$getTicket(),
        .tickIfc$getTicket__RDY(),
        .tickIfc$allocateTicket__ENA(0),
        .tickIfc$allocateTicket__RDY());
    Fifo1Base#(32) inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$enter__ENA),
        .in$enq$v(inQ$in$enq$v),
        .in$enq__RDY(inQ$in$enq__RDY),
        .out$deq__ENA(RULE$enter__RDY),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    FifoB1Base#(23) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .ifc$req__ENA(mem$ifc$req__ENA),
        .ifc$req$v(mem$ifc$req$v),
        .ifc$req__RDY(mem$ifc$req__RDY),
        .ifc$resAccept__ENA(mem$ifc$resAccept__ENA),
        .ifc$resAccept__RDY(mem$ifc$resAccept__RDY),
        .ifc$resValue(mem$ifc$resValue),
        .ifc$resValue__RDY(mem$ifc$resValue__RDY));
    assign fifo$in$enq$v = ( RULE$recirc__RDY ? { RULE$recirc$agg_2e_tmp$state , RULE$recirc$agg_2e_tmp$IPA , RULE$recirc$agg_2e_tmp$ticket } : 23'd0 ) | ( RULE$enter__RDY ? { RULE$enter$agg_2e_tmp$state , RULE$enter$agg_2e_tmp$IPA , RULE$enter$agg_2e_tmp$ticket } : 23'd0 );
    assign fifo$in$enq__ENA = RULE$recirc__RDY || RULE$enter__RDY;
    assign fifo$out$deq__ENA = RULE$recirc__RDY || RULE$exitr__RDY;
    assign inQ$in$enq$v = request$enter$x;
    assign mem$ifc$req$v = ( RULE$recirc__RDY ? ( RULE$recirc$x + ( ( RULE$recirc$y$state == 1 ) ? RULE$recirc$y$IPA[ 15 : 8 ] : RULE$recirc$y$IPA[ 7 : 0 ] ) ) : 32'd0 ) | ( RULE$enter__RDY ? ( 32'd0 + RULE$enter$x[ 31 : 16 ] ) : 32'd0 );
    assign mem$ifc$req__ENA = RULE$recirc__RDY || RULE$enter__RDY;
    assign mem$ifc$resAccept__ENA = RULE$recirc__RDY || RULE$exitr__RDY;
    assign outQ$enq$v = RULE$exitr$x;
    assign outQ$enq__ENA = RULE$exitr__RDY;
    assign request$enter__RDY = inQ$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$enter$agg_2e_tmp$IPA = RULE$enter$x[ 15 : 0 ];
    assign RULE$enter$agg_2e_tmp$state = 3'd0;
    assign RULE$enter$agg_2e_tmp$ticket = RULE$enter$ticket;
    assign RULE$enter$ticket = 4'd0;
    assign RULE$enter$x = inQ$out$first;
    assign RULE$enter__RDY = !( RULE$recirc__RDY || ( !( inQ$out$first__RDY && inQ$out$deq__RDY && fifo$in$enq__RDY && mem$ifc$req__RDY ) ) );
    assign RULE$exitr$x = mem$ifc$resValue;
    assign RULE$exitr__RDY = !( RULE$recirc__RDY || ( !( mem$ifc$resValue__RDY && fifo$out$first__RDY && mem$ifc$resAccept__RDY && fifo$out$deq__RDY && outQ$enq__RDY ) ) || ( !( ( mem$ifc$resValue & 1 ) == 1 ) ) );
    assign RULE$recirc$agg_2e_tmp$IPA = RULE$recirc$y$IPA;
    assign RULE$recirc$agg_2e_tmp$state = RULE$recirc$y$state + 3'd1;
    assign RULE$recirc$agg_2e_tmp$ticket = RULE$recirc$y$ticket;
    assign RULE$recirc$x = mem$ifc$resValue;
    assign RULE$recirc$y$IPA = fifo$out$first[ 16 - 1 + 4 : 4 ];
    assign RULE$recirc$y$state = fifo$out$first[ 3 - 1 + 20 : 20 ];
    assign RULE$recirc$y$ticket = fifo$out$first[ 4 - 1 : 0 ];
    assign RULE$recirc__RDY = !( ( ( mem$ifc$resValue & 1 ) == 1 ) || ( !( mem$ifc$resValue__RDY && fifo$out$first__RDY && mem$ifc$resAccept__RDY && mem$ifc$req__RDY && fifo$out$deq__RDY && fifo$in$enq__RDY ) ) );
endmodule 

`default_nettype wire    // set back to default value
