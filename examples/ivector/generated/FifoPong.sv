`include "ivector.generated.vh"

`default_nettype none
module FifoPong #(
    parameter integer width = 96)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg pong;
    ValuePair _out$first$retval;
    PipeIn#(.width(width)) element1$in();
    PipeOut#(.width(width)) element1$out();
    PipeIn#(.width(width)) element2$in();
    PipeOut#(.width(width)) element2$out();
    Fifo1Base#(.width(width)) element1 (.CLK(CLK), .nRST(nRST),
        .in(element1$in),
        .out(element1$out));
    Fifo1Base#(.width(width)) element2 (.CLK(CLK), .nRST(nRST),
        .in(element2$in),
        .out(element2$out));
    // Extra assigments, not to output wires
    assign element1$in.enq$v = ( !( pong || ( !in.enq__ENA ) ) ) ? in.enq$v : 0;
    assign element1$in.enq__ENA = !( pong || ( !in.enq__ENA ) );
    assign element1$out.deq__ENA = !( pong || ( !out.deq__ENA ) );
    assign element2$in.enq$v = ( in.enq__ENA && pong ) ? in.enq$v : 0;
    assign element2$in.enq__ENA = in.enq__ENA && pong;
    assign element2$out.deq__ENA = out.deq__ENA && pong;
    assign in.enq__RDY = ( element2$in.enq__RDY && ( pong || element1$in.enq__RDY ) ) || ( ( !element2$in.enq__RDY ) && ( !( pong || ( !element1$in.enq__RDY ) ) ) );
    assign out.deq__RDY = ( element2$out.deq__RDY && ( pong || element1$out.deq__RDY ) ) || ( ( !element2$out.deq__RDY ) && ( !( pong || ( !element1$out.deq__RDY ) ) ) );
    assign out.first = _out$first$retval;
    assign out.first__RDY = ( element2$out.first__RDY && ( pong || element1$out.first__RDY ) ) || ( ( !element2$out.first__RDY ) && ( !( pong || ( !element1$out.first__RDY ) ) ) );
    always_comb begin
    _out$first$retval = 0;
    unique case(1'b1)
    pong: _out$first$retval = element2$out.first;
    !pong: _out$first$retval = element1$out.first;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out.deq__RDY && out.deq__ENA) begin // out.deq__ENA
            pong <= pong ^ 1'd1;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
