`include "fifo.generated.vh"

`default_nettype none
module FifoB1Base #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg [width - 1:0]element;
    reg full;
    wire [width - 1:0]enq_v;
    // Extra assigments, not to output wires
    assign enq_v = in.enq$v;
    assign in.enq__RDY = !( ( ( full ^ 1 ) | out.deq__ENA ) == 0 );
    assign out.deq__RDY = full || in.enq__ENA;
    assign out.first = full ? element : enq_v;
    assign out.first__RDY = full || in.enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in.enq__ENA && in.enq__RDY) begin // in.enq__ENA
            element <= in.enq$v;
            if (out.deq__ENA == 0)
            full <= 1;
        end; // End of in.enq__ENA
        if (out.deq__ENA && out.deq__RDY) begin // out.deq__ENA
            full <= 0;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
