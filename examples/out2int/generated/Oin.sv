`include "out2int.generated.vh"

`default_nettype none
module Oin (input wire CLK, input wire nRST,
    OinRequest.server request,
    OinIndication.client indication);
    PipeIn#(.width(32)) first$in();
    PipeOut#(.width(32)) pipe$in();
    PipeIn#(.width(32)) pipe$out();
    PipeOut#(.width(32)) second$out();
    Fifo1Base#(.width(32)) first (.CLK(CLK), .nRST(nRST),
        .in(first$in),
        .out(pipe$in));
    Fifo1Base#(.width(32)) second (.CLK(CLK), .nRST(nRST),
        .in(pipe$out),
        .out(second$out));
    Out2InBase#(.width(32)) pipe (.CLK(CLK), .nRST(nRST),
        .in(pipe$in),
        .out(pipe$out));
    // Extra assigments, not to output wires
    assign first$in.enq$v = request.say$v;
    assign first$in.enq__ENA = request.say__ENA;
    assign indication.heard$v = second$out.first;
    assign indication.heard__ENA = second$out.first__RDY && second$out.deq__RDY;
    assign request.say__RDY = first$in.enq__RDY;
    assign second$out.deq__ENA = second$out.first__RDY && indication.heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request.say__ENA && request.say__RDY) begin // request.say__ENA
            $display( "REQUESTSAY v %x" , request.say$v );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
