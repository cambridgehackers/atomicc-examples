`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1_OC_16 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [31:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [31:0]out$first,
    output wire out$first__RDY);
    reg [31:0]element$data;
    reg full;
    wire [31:0]element;
    wire in$enq__EXECUTE;
    wire out$deq__EXECUTE;
    assign in$enq__EXECUTE = in$enq__ENA & in$enq__RDY;
    assign in$enq__RDY = !full;
    assign out$deq__EXECUTE = out$deq__ENA & out$deq__RDY;
    assign out$deq__RDY = full;
    assign out$first = { element$data };
    assign out$first__RDY = full;
    // Extra assigments, not to output wires
    assign element = { element$data };

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__EXECUTE) begin
            { element$data } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__EXECUTE) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
