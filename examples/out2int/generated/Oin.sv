`include "out2int.generated.vh"

`default_nettype none
module Oin (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    wire [32 - 1:0]first$in$enq$v;
    wire first$in$enq__RDY;
    wire first$out$deq__RDY;
    wire [32 - 1:0]first$out$first;
    wire first$out$first__RDY;
    wire pipe$in$deq__ENA;
    wire [32 - 1:0]pipe$out$enq$v;
    wire pipe$out$enq__ENA;
    wire second$in$enq__RDY;
    wire second$out$deq__ENA;
    wire second$out$deq__RDY;
    wire second$out$first__RDY;
    Fifo1Base#(.width(32)) first (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v(first$in$enq$v),
        .in$enq__RDY(first$in$enq__RDY),
        .out$deq__ENA(pipe$in$deq__ENA),
        .out$deq__RDY(first$out$deq__RDY),
        .out$first(first$out$first),
        .out$first__RDY(first$out$first__RDY));
    Fifo1Base#(.width(32)) second (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(pipe$out$enq__ENA),
        .in$enq$v(pipe$out$enq$v),
        .in$enq__RDY(second$in$enq__RDY),
        .out$deq__ENA(second$out$deq__ENA),
        .out$deq__RDY(second$out$deq__RDY),
        .out$first(indication$heard$v),
        .out$first__RDY(second$out$first__RDY));
    Out2InBase#(.width(32)) pipe (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(pipe$in$deq__ENA),
        .in$deq__RDY(first$out$deq__RDY),
        .in$first(first$out$first),
        .in$first__RDY(first$out$first__RDY),
        .out$enq__ENA(pipe$out$enq__ENA),
        .out$enq$v(pipe$out$enq$v),
        .out$enq__RDY(second$in$enq__RDY));
    assign first$in$enq$v = request$say$v;
    assign indication$heard__ENA = second$out$first__RDY && second$out$deq__RDY;
    assign request$say__RDY = first$in$enq__RDY;
    assign second$out$deq__ENA = second$out$first__RDY && indication$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA && first$in$enq__RDY) begin // request$say__ENA
            $display( "REQUESTSAY v %x" , request$say$v );
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
