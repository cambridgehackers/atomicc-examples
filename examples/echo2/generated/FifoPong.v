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
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [703:0]element2$out$first;
    wire element2$out$first__RDY;
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
    assign in$enq__RDY = ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
    assign out$deq__RDY = ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
    assign out$first = { out$first$retval$c19 , out$first$retval$c18 , out$first$retval$c17 , out$first$retval$c16 , out$first$retval$c15 , out$first$retval$c14 , out$first$retval$c13 , out$first$retval$c12 , out$first$retval$c11 , out$first$retval$c10 , out$first$retval$c9 , out$first$retval$c8 , out$first$retval$c7 , out$first$retval$c6 , out$first$retval$c5 , out$first$retval$c4 , out$first$retval$c3 , out$first$retval$c2 , out$first$retval$c1 , out$first$retval$c0 , out$first$retval$b , out$first$retval$a };
    assign out$first__RDY = ( ( pong ^ 1 ) | element2$out$first__RDY ) & ( pong | element1$out$first__RDY );
    Fifo1_OC_3 element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( pong ^ 1 ) & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(( pong ^ 1 ) & out$deq__ENA),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    Fifo1_OC_3 element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(pong & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element2$in$enq__RDY),
        .out$deq__ENA(pong & out$deq__ENA),
        .out$deq__RDY(element2$out$deq__RDY),
        .out$first(element2$out$first),
        .out$first__RDY(element2$out$first__RDY));
    // Extra assigments, not to output wires
    assign out$first$retval$a = ( out$first__RDY & pong ) ? element2$out$first[31:0] : element1$out$first[31:0];
    assign out$first$retval$b = ( out$first__RDY & pong ) ? element2$out$first[63:32] : element1$out$first[63:32];
    assign out$first$retval$c0 = ( out$first__RDY & pong ) ? element2$out$first[95:64] : element1$out$first[95:64];
    assign out$first$retval$c1 = ( out$first__RDY & pong ) ? element2$out$first[127:96] : element1$out$first[127:96];
    assign out$first$retval$c10 = ( out$first__RDY & pong ) ? element2$out$first[415:384] : element1$out$first[415:384];
    assign out$first$retval$c11 = ( out$first__RDY & pong ) ? element2$out$first[447:416] : element1$out$first[447:416];
    assign out$first$retval$c12 = ( out$first__RDY & pong ) ? element2$out$first[479:448] : element1$out$first[479:448];
    assign out$first$retval$c13 = ( out$first__RDY & pong ) ? element2$out$first[511:480] : element1$out$first[511:480];
    assign out$first$retval$c14 = ( out$first__RDY & pong ) ? element2$out$first[543:512] : element1$out$first[543:512];
    assign out$first$retval$c15 = ( out$first__RDY & pong ) ? element2$out$first[575:544] : element1$out$first[575:544];
    assign out$first$retval$c16 = ( out$first__RDY & pong ) ? element2$out$first[607:576] : element1$out$first[607:576];
    assign out$first$retval$c17 = ( out$first__RDY & pong ) ? element2$out$first[639:608] : element1$out$first[639:608];
    assign out$first$retval$c18 = ( out$first__RDY & pong ) ? element2$out$first[671:640] : element1$out$first[671:640];
    assign out$first$retval$c19 = ( out$first__RDY & pong ) ? element2$out$first[703:672] : element1$out$first[703:672];
    assign out$first$retval$c2 = ( out$first__RDY & pong ) ? element2$out$first[159:128] : element1$out$first[159:128];
    assign out$first$retval$c3 = ( out$first__RDY & pong ) ? element2$out$first[191:160] : element1$out$first[191:160];
    assign out$first$retval$c4 = ( out$first__RDY & pong ) ? element2$out$first[223:192] : element1$out$first[223:192];
    assign out$first$retval$c5 = ( out$first__RDY & pong ) ? element2$out$first[255:224] : element1$out$first[255:224];
    assign out$first$retval$c6 = ( out$first__RDY & pong ) ? element2$out$first[287:256] : element1$out$first[287:256];
    assign out$first$retval$c7 = ( out$first__RDY & pong ) ? element2$out$first[319:288] : element1$out$first[319:288];
    assign out$first$retval$c8 = ( out$first__RDY & pong ) ? element2$out$first[351:320] : element1$out$first[351:320];
    assign out$first$retval$c9 = ( out$first__RDY & pong ) ? element2$out$first[383:352] : element1$out$first[383:352];

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA & out$deq__RDY) begin
            pong <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
