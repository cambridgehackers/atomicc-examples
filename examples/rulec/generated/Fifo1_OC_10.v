`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1_OC_10 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [20:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [20:0]out$first,
    output wire out$first__RDY);
    reg [4:0]element$addr;
    reg [9:0]element$count;
    reg [5:0]element$id;
    reg full;
    wire [20:0]element;
    wire in$enq__EXECUTE;
    wire out$deq__EXECUTE;
    assign in$enq__EXECUTE = in$enq__ENA & in$enq__RDY;
    assign in$enq__RDY = !full;
    assign out$deq__EXECUTE = out$deq__ENA & out$deq__RDY;
    assign out$deq__RDY = full;
    assign out$first = { element$addr , element$count , element$id };
    assign out$first__RDY = full;
    // Extra assigments, not to output wires
    assign element = { element$addr , element$count , element$id };

    always @( posedge CLK) begin
      if (!nRST) begin
        element$addr <= 0;
        element$count <= 0;
        element$id <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__EXECUTE) begin
            { element$addr , element$count , element$id } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__EXECUTE) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
