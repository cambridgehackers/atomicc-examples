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
    assign out$first = { out$first$retval$c1 , out$first$retval$c0 , out$first$retval$b , out$first$retval$a };
    assign out$first__RDY = ( element2$out$first__RDY & ( pong | element1$out$first__RDY ) ) | ( ( !element2$out$first__RDY ) & ( !( pong | ( !element1$out$first__RDY ) ) ) );
    // Extra assigments, not to output wires
    assign out$first$retval$a = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 : 0 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 : 0 ] : 32'd0 );
    assign out$first$retval$b = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 32 : 32 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 32 : 32 ] : 32'd0 );
    assign out$first$retval$c0 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 64 : 64 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 64 : 64 ] : 32'd0 );
    assign out$first$retval$c1 = ( ( out$first__RDY & pong ) ? element2$out$first[ 32 - 1 + 96 : 96 ] : 32'd0 ) | ( ( !( pong | ( !out$first__RDY ) ) ) ? element1$out$first[ 32 - 1 + 96 : 96 ] : 32'd0 );

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
