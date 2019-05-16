`include "ivector.generated.vh"

`default_nettype none
module FifoPong (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [95:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [95:0]out$first,
    output wire out$first__RDY);
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire element1$out$first__RDY;
    wire [95:0]element2$out$first;
    wire [31:0]out$first$retval$a;
    wire [31:0]out$first$retval$b;
    wire [31:0]out$first$retval$c;
    Fifo1Base#(96) element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(!( pong | ( !in$enq__ENA ) )),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(!( pong | ( !out$deq__ENA ) )),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    Fifo1Base#(96) element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(0),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(),
        .out$deq__ENA(0),
        .out$deq__RDY(),
        .out$first(element2$out$first),
        .out$first__RDY());
    assign in$enq__RDY = !( pong | ( !element1$in$enq__RDY ) );
    assign out$deq__RDY = !( pong | ( !element1$out$deq__RDY ) );
    assign out$first = { out$first$retval$c , out$first$retval$b , out$first$retval$a };
    assign out$first__RDY = !( pong | ( !element1$out$first__RDY ) );
    // Extra assigments, not to output wires
    assign out$first$retval$a = ( 0 ? element2$out$first[ 31 : 0 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 31 : 0 ] : 32'd0 );
    assign out$first$retval$b = ( 0 ? element2$out$first[ 63 : 32 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 63 : 32 ] : 32'd0 );
    assign out$first$retval$c = ( 0 ? element2$out$first[ 95 : 64 ] : 32'd0 ) | ( ( !( pong | ( !element1$out$first__RDY ) ) ) ? element1$out$first[ 95 : 64 ] : 32'd0 );

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
