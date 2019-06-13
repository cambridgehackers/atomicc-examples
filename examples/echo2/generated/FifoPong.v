`include "ivector.generated.vh"

`default_nettype none
module FifoPong (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [((32 + 32) + (32 * 20)) - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [((32 + 32) + (32 * 20)) - 1:0]out$first,
    output wire out$first__RDY);
    reg pong;
    wire element1$in$enq__ENA;
    wire element1$in$enq__RDY;
    wire element1$out$deq__ENA;
    wire element1$out$deq__RDY;
    wire [704 - 1:0]element1$out$first;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [704 - 1:0]element2$out$first;
    wire element2$out$first__RDY;
    wire [32 - 1:0]out$first$retval$a;
    wire [32 - 1:0]out$first$retval$b;
    wire [32 - 1:0]out$first$retval$c0;
    wire [32 - 1:0]out$first$retval$c1;
    wire [32 - 1:0]out$first$retval$c10;
    wire [32 - 1:0]out$first$retval$c11;
    wire [32 - 1:0]out$first$retval$c12;
    wire [32 - 1:0]out$first$retval$c13;
    wire [32 - 1:0]out$first$retval$c14;
    wire [32 - 1:0]out$first$retval$c15;
    wire [32 - 1:0]out$first$retval$c16;
    wire [32 - 1:0]out$first$retval$c17;
    wire [32 - 1:0]out$first$retval$c18;
    wire [32 - 1:0]out$first$retval$c19;
    wire [32 - 1:0]out$first$retval$c2;
    wire [32 - 1:0]out$first$retval$c3;
    wire [32 - 1:0]out$first$retval$c4;
    wire [32 - 1:0]out$first$retval$c5;
    wire [32 - 1:0]out$first$retval$c6;
    wire [32 - 1:0]out$first$retval$c7;
    wire [32 - 1:0]out$first$retval$c8;
    wire [32 - 1:0]out$first$retval$c9;
    Fifo1Base#(704) element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(element1$in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(element1$out$deq__ENA),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    Fifo1Base#(704) element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA & in$enq__RDY & pong),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element2$in$enq__RDY),
        .out$deq__ENA(out$deq__ENA & out$deq__RDY & pong),
        .out$deq__RDY(element2$out$deq__RDY),
        .out$first(element2$out$first),
        .out$first__RDY(element2$out$first__RDY));
    assign element1$in$enq__ENA = !( pong | ( !( in$enq__RDY & in$enq__ENA ) ) );
    assign element1$out$deq__ENA = !( pong | ( !( out$deq__RDY & out$deq__ENA ) ) );
    assign in$enq__RDY = ( element2$in$enq__RDY & ( pong | element1$in$enq__RDY ) ) | ( ( !element2$in$enq__RDY ) & ( !( pong | ( !element1$in$enq__RDY ) ) ) );
    assign out$deq__RDY = ( element2$out$deq__RDY & ( pong | element1$out$deq__RDY ) ) | ( ( !element2$out$deq__RDY ) & ( !( pong | ( !element1$out$deq__RDY ) ) ) );
    assign out$first = { out$first$retval$c19 , out$first$retval$c18 , out$first$retval$c17 , out$first$retval$c16 , out$first$retval$c15 , out$first$retval$c14 , out$first$retval$c13 , out$first$retval$c12 , out$first$retval$c11 , out$first$retval$c10 , out$first$retval$c9 , out$first$retval$c8 , out$first$retval$c7 , out$first$retval$c6 , out$first$retval$c5 , out$first$retval$c4 , out$first$retval$c3 , out$first$retval$c2 , out$first$retval$c1 , out$first$retval$c0 , out$first$retval$b , out$first$retval$a };
    assign out$first__RDY = ( element2$out$first__RDY & ( pong | element1$out$first__RDY ) ) | ( ( !element2$out$first__RDY ) & ( !( pong | ( !element1$out$first__RDY ) ) ) );
    // Extra assigments, not to output wires
    assign out$first$retval$a = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 : 0 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 : 0 ] : 32'd0 );
    assign out$first$retval$b = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 32 : 32 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 32 : 32 ] : 32'd0 );
    assign out$first$retval$c0 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 64 : 64 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 64 : 64 ] : 32'd0 );
    assign out$first$retval$c1 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 96 : 96 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 96 : 96 ] : 32'd0 );
    assign out$first$retval$c10 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 384 : 384 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 384 : 384 ] : 32'd0 );
    assign out$first$retval$c11 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 416 : 416 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 416 : 416 ] : 32'd0 );
    assign out$first$retval$c12 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 448 : 448 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 448 : 448 ] : 32'd0 );
    assign out$first$retval$c13 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 480 : 480 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 480 : 480 ] : 32'd0 );
    assign out$first$retval$c14 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 512 : 512 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 512 : 512 ] : 32'd0 );
    assign out$first$retval$c15 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 544 : 544 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 544 : 544 ] : 32'd0 );
    assign out$first$retval$c16 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 576 : 576 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 576 : 576 ] : 32'd0 );
    assign out$first$retval$c17 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 608 : 608 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 608 : 608 ] : 32'd0 );
    assign out$first$retval$c18 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 640 : 640 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 640 : 640 ] : 32'd0 );
    assign out$first$retval$c19 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 672 : 672 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 672 : 672 ] : 32'd0 );
    assign out$first$retval$c2 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 128 : 128 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 128 : 128 ] : 32'd0 );
    assign out$first$retval$c3 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 160 : 160 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 160 : 160 ] : 32'd0 );
    assign out$first$retval$c4 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 192 : 192 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 192 : 192 ] : 32'd0 );
    assign out$first$retval$c5 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 224 : 224 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 224 : 224 ] : 32'd0 );
    assign out$first$retval$c6 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 256 : 256 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 256 : 256 ] : 32'd0 );
    assign out$first$retval$c7 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 288 : 288 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 288 : 288 ] : 32'd0 );
    assign out$first$retval$c8 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 320 : 320 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 320 : 320 ] : 32'd0 );
    assign out$first$retval$c9 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 352 : 352 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 352 : 352 ] : 32'd0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA & out$deq__RDY) begin // out$deq__ENA
            pong <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
