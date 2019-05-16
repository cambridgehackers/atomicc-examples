`include "ivector.generated.vh"

`default_nettype none
module FifoPong (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [703:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [703:0]out$first,
    output wire out$first__RDY);
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [703:0]element1$out$first;
    wire element1$out$first__RDY;
    wire [703:0]element2$out$first;
    wire [31:0]out$first$retval$a;
    wire [31:0]out$first$retval$b;
    wire [31:0]out$first$retval$c0;
    wire [31:0]out$first$retval$c1;
    wire [31:0]out$first$retval$c10;
    wire [31:0]out$first$retval$c11;
    wire [31:0]out$first$retval$c12;
    wire [31:0]out$first$retval$c13;
    wire [31:0]out$first$retval$c14;
    wire [31:0]out$first$retval$c15;
    wire [31:0]out$first$retval$c16;
    wire [31:0]out$first$retval$c17;
    wire [31:0]out$first$retval$c18;
    wire [31:0]out$first$retval$c19;
    wire [31:0]out$first$retval$c2;
    wire [31:0]out$first$retval$c3;
    wire [31:0]out$first$retval$c4;
    wire [31:0]out$first$retval$c5;
    wire [31:0]out$first$retval$c6;
    wire [31:0]out$first$retval$c7;
    wire [31:0]out$first$retval$c8;
    wire [31:0]out$first$retval$c9;
    Fifo1Base#(704) element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(!( pong | ( !in$enq__ENA ) )),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(!( pong | ( !out$deq__ENA ) )),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    Fifo1Base#(704) element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(0),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(),
        .out$deq__ENA(0),
        .out$deq__RDY(),
        .out$first(element2$out$first),
        .out$first__RDY());
    assign in$enq__RDY = !( pong | ( !element1$in$enq__RDY ) );
    assign out$deq__RDY = !( pong | ( !element1$out$deq__RDY ) );
    assign out$first = { out$first$retval$c19 , out$first$retval$c18 , out$first$retval$c17 , out$first$retval$c16 , out$first$retval$c15 , out$first$retval$c14 , out$first$retval$c13 , out$first$retval$c12 , out$first$retval$c11 , out$first$retval$c10 , out$first$retval$c9 , out$first$retval$c8 , out$first$retval$c7 , out$first$retval$c6 , out$first$retval$c5 , out$first$retval$c4 , out$first$retval$c3 , out$first$retval$c2 , out$first$retval$c1 , out$first$retval$c0 , out$first$retval$b , out$first$retval$a };
    assign out$first__RDY = !( pong | ( !element1$out$first__RDY ) );
    // Extra assigments, not to output wires
    assign out$first$retval$a = ( 0 ? element2$out$first[ 31 : 0 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 31 : 0 ] : 32'd0 );
    assign out$first$retval$b = ( 0 ? element2$out$first[ 63 : 32 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 63 : 32 ] : 32'd0 );
    assign out$first$retval$c0 = ( 0 ? element2$out$first[ 95 : 64 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 95 : 64 ] : 32'd0 );
    assign out$first$retval$c1 = ( 0 ? element2$out$first[ 127 : 96 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 127 : 96 ] : 32'd0 );
    assign out$first$retval$c10 = ( 0 ? element2$out$first[ 415 : 384 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 415 : 384 ] : 32'd0 );
    assign out$first$retval$c11 = ( 0 ? element2$out$first[ 447 : 416 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 447 : 416 ] : 32'd0 );
    assign out$first$retval$c12 = ( 0 ? element2$out$first[ 479 : 448 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 479 : 448 ] : 32'd0 );
    assign out$first$retval$c13 = ( 0 ? element2$out$first[ 511 : 480 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 511 : 480 ] : 32'd0 );
    assign out$first$retval$c14 = ( 0 ? element2$out$first[ 543 : 512 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 543 : 512 ] : 32'd0 );
    assign out$first$retval$c15 = ( 0 ? element2$out$first[ 575 : 544 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 575 : 544 ] : 32'd0 );
    assign out$first$retval$c16 = ( 0 ? element2$out$first[ 607 : 576 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 607 : 576 ] : 32'd0 );
    assign out$first$retval$c17 = ( 0 ? element2$out$first[ 639 : 608 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 639 : 608 ] : 32'd0 );
    assign out$first$retval$c18 = ( 0 ? element2$out$first[ 671 : 640 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 671 : 640 ] : 32'd0 );
    assign out$first$retval$c19 = ( 0 ? element2$out$first[ 703 : 672 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 703 : 672 ] : 32'd0 );
    assign out$first$retval$c2 = ( 0 ? element2$out$first[ 159 : 128 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 159 : 128 ] : 32'd0 );
    assign out$first$retval$c3 = ( 0 ? element2$out$first[ 191 : 160 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 191 : 160 ] : 32'd0 );
    assign out$first$retval$c4 = ( 0 ? element2$out$first[ 223 : 192 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 223 : 192 ] : 32'd0 );
    assign out$first$retval$c5 = ( 0 ? element2$out$first[ 255 : 224 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 255 : 224 ] : 32'd0 );
    assign out$first$retval$c6 = ( 0 ? element2$out$first[ 287 : 256 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 287 : 256 ] : 32'd0 );
    assign out$first$retval$c7 = ( 0 ? element2$out$first[ 319 : 288 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 319 : 288 ] : 32'd0 );
    assign out$first$retval$c8 = ( 0 ? element2$out$first[ 351 : 320 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 351 : 320 ] : 32'd0 );
    assign out$first$retval$c9 = ( 0 ? element2$out$first[ 383 : 352 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 383 : 352 ] : 32'd0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (!( pong | ( !element1$out$deq__RDY ) | ( !out$deq__ENA ) )) begin // out$deq__ENA
            pong <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
