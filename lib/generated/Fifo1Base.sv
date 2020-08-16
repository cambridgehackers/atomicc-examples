`include "fifo.generated.vh"

`default_nettype none
module Fifo1Base #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg [width - 1:0]element;
    reg full;
    // Extra assigments, not to output wires
    assign in.enq__RDY = !( 0 == ( full ^ 1 ) );
    assign out.deq__RDY = !( 0 == full );
    assign out.first = element;
    assign out.first__RDY = !( 0 == full );

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in.enq__ENA && in.enq__RDY) begin // in.enq__ENA
$display("ENQ: %x", in.enq$v);
            element <= in.enq$v;
            full <= 1;
        end; // End of in.enq__ENA
        if (out.deq__ENA && out.deq__RDY) begin // out.deq__ENA
$display("DEQ: %x", element);
            full <= 0;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
