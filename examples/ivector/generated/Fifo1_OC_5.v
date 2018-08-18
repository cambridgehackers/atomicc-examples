`include "ivector.generated.vh"

`default_nettype none
module Fifo1_OC_5 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [95:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [95:0]out$first,
    output wire out$first__RDY);
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c;
    reg full;
    assign in$enq__RDY = !full;
    assign out$deq__RDY = full;
    assign out$first = { element$c , element$b , element$a };
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & ( !full )) begin // in$enq__ENA
            { element$c , element$b , element$a } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & full) begin // out$deq__ENA
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
