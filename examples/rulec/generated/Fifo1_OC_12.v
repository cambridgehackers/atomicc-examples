`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1_OC_12 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire out$first,
    output wire out$first__RDY);
    reg element$data;
    reg full;
    assign in$enq__RDY = !full;
    assign out$deq__RDY = full;
    assign out$first = { element$data };
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            { element$data } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value