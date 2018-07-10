`include "ivector.generated.vh"

module FifoPong (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire element2$out$first__RDY;
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
    assign in$enq__RDY = ( ( pong  ^ 1 ) | element2$in$enq__RDY  ) & ( pong  | element1$in$enq__RDY  );
    assign out$deq__RDY = ( ( pong  ^ 1 ) | element2$out$deq__RDY  ) & ( pong  | element1$out$deq__RDY  );
    assign out$first = { pong  ? element2$out$first[95:64]  : element1$out$first[95:64]  , pong  ? element2$out$first[63:32]  : element1$out$first[63:32]  , pong  ? element2$out$first[31:0]  : element1$out$first[31:0]  };
    assign out$first__RDY = ( ( pong  ^ 1 ) | element2$out$first__RDY  ) & ( pong  | element1$out$first__RDY  );

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA) begin
            pong  <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

