`include "atomicc.generated.vh"
`default_nettype none
module Fifo1Base #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg [width - 1:0]element;
    reg full;
    // Extra assigments, not to output wires
    assign in.enq__RDY = !full;
    assign out.deq__RDY = full;
    assign out.first = element;
    assign out.first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= (width) ' ('d0);
        full <= 1'd0;
      end // nRST
      else begin
        if (( !full ) && in.enq__ENA) begin // in.enq__ENA
            element <= in.enq$v;
            full <= 1'd1;
        end; // End of in.enq__ENA
        if (full && out.deq__ENA) begin // out.deq__ENA
            full <= 1'd0;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
