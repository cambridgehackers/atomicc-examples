`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1Base$__PARAM__$width$32 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [31:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [31:0]out$first,
    output wire out$first__RDY);
    reg [31:0]element;
    reg full;
    assign in$enq__RDY = !full;
    assign out$deq__RDY = full;
    assign out$first = element;
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & ( !full )) begin // in$enq__ENA
            element <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & full) begin // out$deq__ENA
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
