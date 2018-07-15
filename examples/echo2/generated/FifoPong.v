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
    Fifo1_OC_3 element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( pong ^ 1 ) & in$enq__ENA & ( ( pong ^ 1 ) | element2$in$enq__RDY )),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(( pong ^ 1 ) & out$deq__ENA & ( ( pong ^ 1 ) | element2$out$deq__RDY )),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    Fifo1_OC_3 element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(pong & in$enq__ENA & ( pong | element1$in$enq__RDY )),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element2$in$enq__RDY),
        .out$deq__ENA(pong & out$deq__ENA & ( pong | element1$out$deq__RDY )),
        .out$deq__RDY(element2$out$deq__RDY),
        .out$first(element2$out$first),
        .out$first__RDY(element2$out$first__RDY));
    assign in$enq__RDY = ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
    assign out$deq__RDY = ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
    assign out$first = { pong ? element2$out$first[703:672] : element1$out$first[703:672] , pong ? element2$out$first[671:640] : element1$out$first[671:640] , pong ? element2$out$first[639:608] : element1$out$first[639:608] , pong ? element2$out$first[607:576] : element1$out$first[607:576] , pong ? element2$out$first[575:544] : element1$out$first[575:544] , pong ? element2$out$first[543:512] : element1$out$first[543:512] , pong ? element2$out$first[511:480] : element1$out$first[511:480] , pong ? element2$out$first[479:448] : element1$out$first[479:448] , pong ? element2$out$first[447:416] : element1$out$first[447:416] , pong ? element2$out$first[415:384] : element1$out$first[415:384] , pong ? element2$out$first[383:352] : element1$out$first[383:352] , pong ? element2$out$first[351:320] : element1$out$first[351:320] , pong ? element2$out$first[319:288] : element1$out$first[319:288] , pong ? element2$out$first[287:256] : element1$out$first[287:256] , pong ? element2$out$first[255:224] : element1$out$first[255:224] , pong ? element2$out$first[223:192] : element1$out$first[223:192] , pong ? element2$out$first[191:160] : element1$out$first[191:160] , pong ? element2$out$first[159:128] : element1$out$first[159:128] , pong ? element2$out$first[127:96] : element1$out$first[127:96] , pong ? element2$out$first[95:64] : element1$out$first[95:64] , pong ? element2$out$first[63:32] : element1$out$first[63:32] , pong ? element2$out$first[31:0] : element1$out$first[31:0] };
    assign out$first__RDY = ( ( pong ^ 1 ) | element2$out$first__RDY ) & ( pong | element1$out$first__RDY );

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
