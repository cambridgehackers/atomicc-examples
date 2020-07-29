`include "lpm.generated.vh"

`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    input wire enter__ENA,
    input wire [32 - 1:0]enter$x,
    output wire enter__RDY,
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
    wire [32 - 1:0]mem$req$v;
    wire mem$req__ENA;
    wire mem$req__RDY;
    wire mem$resAccept__ENA;
    wire mem$resAccept__RDY;
    wire [32 - 1:0]mem$resValue;
    wire mem$resValue__RDY;
    BufTicket compBuf (.CLK(CLK), .nRST(nRST),
        .getTicket(),
        .getTicket__RDY(),
        .allocateTicket__ENA(0),
        .allocateTicket__RDY());
    Fifo1Base#(.width(32)) inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(enter__ENA),
        .in$enq$v(inQ$in$enq$v),
        .in$enq__RDY(inQ$in$enq__RDY),
        .out$deq__ENA(RULE$enter__RDY),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    FifoB1Base#(.width(23)) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .req__ENA(mem$req__ENA),
        .req$v(mem$req$v),
        .req__RDY(mem$req__RDY),
        .resAccept__ENA(mem$resAccept__ENA),
        .resAccept__RDY(mem$resAccept__RDY),
        .resValue(mem$resValue),
        .resValue__RDY(mem$resValue__RDY));
    assign enter__RDY = inQ$in$enq__RDY;
    assign fifo$in$enq$v = ( RULE$recirc__RDY ? { RULE$recirc$agg_2e_tmp$state , RULE$recirc$agg_2e_tmp$IPA , RULE$recirc$agg_2e_tmp$ticket } : 23'd0 ) | ( RULE$enter__RDY ? { RULE$enter$agg_2e_tmp$state , RULE$enter$agg_2e_tmp$IPA , RULE$enter$agg_2e_tmp$ticket } : 23'd0 );
    assign fifo$in$enq__ENA = RULE$recirc__RDY || RULE$enter__RDY;
    assign fifo$out$deq__ENA = RULE$recirc__RDY || RULE$exitr__RDY;
    assign inQ$in$enq$v = enter$x;
    assign mem$req$v = ( RULE$recirc__RDY ? ( RULE$recirc$x + ( ( RULE$recirc$y$state == 1 ) ? RULE$recirc$y$IPA[ 15 : 8 ] : RULE$recirc$y$IPA[ 7 : 0 ] ) ) : 32'd0 ) | ( RULE$enter__RDY ? ( 32'd0 + RULE$enter$x[ 31 : 16 ] ) : 32'd0 );
    assign mem$req__ENA = RULE$recirc__RDY || RULE$enter__RDY;
    assign mem$resAccept__ENA = RULE$recirc__RDY || RULE$exitr__RDY;
    assign outQ$enq$v = RULE$exitr$x;
    assign outQ$enq__ENA = RULE$exitr__RDY;
    // Extra assigments, not to output wires
    assign RULE$enter$agg_2e_tmp$IPA = RULE$enter$x[ 15 : 0 ];
    assign RULE$enter$agg_2e_tmp$state = 3'd0;
    assign RULE$enter$agg_2e_tmp$ticket = RULE$enter$ticket;
    assign RULE$enter$ticket = 4'd0;
    assign RULE$enter$x = inQ$out$first;
    assign RULE$enter__RDY = !( ( 0 == ( ( RULE$recirc__RDY != 0 ) ^ 1 ) ) || ( !( inQ$out$first__RDY && inQ$out$deq__RDY && fifo$in$enq__RDY && mem$req__RDY ) ) );
    assign RULE$exitr$x = mem$resValue;
    assign RULE$exitr__RDY = ( ( mem$resValue & 1 ) == 1 ) && ( RULE$recirc__RDY == 0 ) && mem$resValue__RDY && fifo$out$first__RDY && mem$resAccept__RDY && fifo$out$deq__RDY && outQ$enq__RDY;
    assign RULE$recirc$agg_2e_tmp$IPA = RULE$recirc$y$IPA;
    assign RULE$recirc$agg_2e_tmp$state = RULE$recirc$y$state + 3'd1;
    assign RULE$recirc$agg_2e_tmp$ticket = RULE$recirc$y$ticket;
    assign RULE$recirc$x = mem$resValue;
    assign RULE$recirc$y$IPA = fifo$out$first[ 16 - 1 + 4 : 4 ];
    assign RULE$recirc$y$state = fifo$out$first[ 3 - 1 + 20 : 20 ];
    assign RULE$recirc$y$ticket = fifo$out$first[ 4 - 1 : 0 ];
    assign RULE$recirc__RDY = !( ( 0 == ( ( ( mem$resValue & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out$first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out$deq__RDY && fifo$in$enq__RDY ) ) );
endmodule

`default_nettype wire    // set back to default value
