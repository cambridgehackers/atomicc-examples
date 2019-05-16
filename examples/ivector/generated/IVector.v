`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    output wire out$heard__ENA,
    output wire [31:0]out$heard$meth,
    output wire [31:0]out$heard$v,
    input wire out$heard__RDY,
    input wire in$say__ENA,
    input wire [31:0]in$say$meth,
    input wire [31:0]in$say$v,
    output wire in$say__RDY);
    genvar  __inst$Genvar1;
    reg [31:0]vsize;
    wire [95:0]in$enq$v;
    wire [31:0]in$enq$v$a;
    wire [31:0]in$enq$v$b;
    wire [31:0]in$enq$v$c;
    wire in$enq__RDY;
    wire [31:0]in$say__ENA$temp$a;
    wire [31:0]in$say__ENA$temp$c;
    wire out$deq__RDY;
    wire out$first__RDY;
    for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin : fifo
      wire in$enq__ENA;
      wire [95:0]in$enq$v;
      wire in$enq__RDY;
      wire out$deq__ENA;
      wire out$deq__RDY;
      wire [95:0]out$first;
      wire out$first__RDY;
      FifoPong data (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(in$enq__RDY),
        .out$deq__ENA(out$deq__ENA),
        .out$deq__RDY(out$deq__RDY),
        .out$first(out$first),
        .out$first__RDY(out$first__RDY));
    end;
    assign fifo[0].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[0].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd0 );
    assign fifo[0].out$deq__ENA = ( fifo[ 0 ] . out$first__RDY ) & ( fifo[ 0 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[1].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[1].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd1 );
    assign fifo[1].out$deq__ENA = ( fifo[ 1 ] . out$first__RDY ) & ( fifo[ 1 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[2].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[2].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd2 );
    assign fifo[2].out$deq__ENA = ( fifo[ 2 ] . out$first__RDY ) & ( fifo[ 2 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[3].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[3].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd3 );
    assign fifo[3].out$deq__ENA = ( fifo[ 3 ] . out$first__RDY ) & ( fifo[ 3 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[4].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[4].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd4 );
    assign fifo[4].out$deq__ENA = ( fifo[ 4 ] . out$first__RDY ) & ( fifo[ 4 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[5].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[5].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd5 );
    assign fifo[5].out$deq__ENA = ( fifo[ 5 ] . out$first__RDY ) & ( fifo[ 5 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[6].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[6].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd6 );
    assign fifo[6].out$deq__ENA = ( fifo[ 6 ] . out$first__RDY ) & ( fifo[ 6 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[7].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[7].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd7 );
    assign fifo[7].out$deq__ENA = ( fifo[ 7 ] . out$first__RDY ) & ( fifo[ 7 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[8].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[8].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd8 );
    assign fifo[8].out$deq__ENA = ( fifo[ 8 ] . out$first__RDY ) & ( fifo[ 8 ] . out$deq__RDY ) & out$heard__RDY;
    assign fifo[9].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };
    assign fifo[9].in$enq__ENA = in$say__ENA & in$say__RDY & ( in$say$meth == 32'd9 );
    assign fifo[9].out$deq__ENA = ( fifo[ 9 ] . out$first__RDY ) & ( fifo[ 9 ] . out$deq__RDY ) & out$heard__RDY;
    assign in$enq$v = { in$enq$v$c , in$enq$v$b , in$enq$v$a };
    assign in$say__RDY = ( fifo[ 0 ] . in$enq__RDY ) & ( fifo[ 1 ] . in$enq__RDY ) & ( fifo[ 2 ] . in$enq__RDY ) & ( fifo[ 3 ] . in$enq__RDY ) & ( fifo[ 4 ] . in$enq__RDY ) & ( fifo[ 5 ] . in$enq__RDY ) & ( fifo[ 6 ] . in$enq__RDY ) & ( fifo[ 7 ] . in$enq__RDY ) & ( fifo[ 8 ] . in$enq__RDY ) & ( fifo[ 9 ] . in$enq__RDY );
    assign out$heard$meth = ( ( ( fifo[ 1 ] . out$first__RDY ) & ( fifo[ 1 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd1 : 32'd0 ) | ( ( ( fifo[ 2 ] . out$first__RDY ) & ( fifo[ 2 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd2 : 32'd0 ) | ( ( ( fifo[ 3 ] . out$first__RDY ) & ( fifo[ 3 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd3 : 32'd0 ) | ( ( ( fifo[ 4 ] . out$first__RDY ) & ( fifo[ 4 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd4 : 32'd0 ) | ( ( ( fifo[ 5 ] . out$first__RDY ) & ( fifo[ 5 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd5 : 32'd0 ) | ( ( ( fifo[ 6 ] . out$first__RDY ) & ( fifo[ 6 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd6 : 32'd0 ) | ( ( ( fifo[ 7 ] . out$first__RDY ) & ( fifo[ 7 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd7 : 32'd0 ) | ( ( ( fifo[ 8 ] . out$first__RDY ) & ( fifo[ 8 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd8 : 32'd0 ) | ( ( ( fifo[ 9 ] . out$first__RDY ) & ( fifo[ 9 ] . out$deq__RDY ) & out$heard__RDY ) ? 32'd9 : 32'd0 );
    assign out$heard$v = ( ( ( fifo[ 0 ] . out$first__RDY ) & ( fifo[ 0 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[0].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 1 ] . out$first__RDY ) & ( fifo[ 1 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[1].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 2 ] . out$first__RDY ) & ( fifo[ 2 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[2].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 3 ] . out$first__RDY ) & ( fifo[ 3 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[3].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 4 ] . out$first__RDY ) & ( fifo[ 4 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[4].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 5 ] . out$first__RDY ) & ( fifo[ 5 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[5].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 6 ] . out$first__RDY ) & ( fifo[ 6 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[6].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 7 ] . out$first__RDY ) & ( fifo[ 7 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[7].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 8 ] . out$first__RDY ) & ( fifo[ 8 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[8].out$first[ 63 : 32 ] : 32'd0 ) | ( ( ( fifo[ 9 ] . out$first__RDY ) & ( fifo[ 9 ] . out$deq__RDY ) & out$heard__RDY ) ? fifo[9].out$first[ 63 : 32 ] : 32'd0 );
    assign out$heard__ENA = ( fifo[ 9 ] . out$first__RDY ) & ( fifo[ 9 ] . out$deq__RDY );
    // Extra assigments, not to output wires
    assign fifo[0].in$enq$v = { in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a };

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
