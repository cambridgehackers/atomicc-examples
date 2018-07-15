`include "precision.generated.vh"

`default_nettype none
module Fifo1_OC_2 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [9:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [9:0]out$first,
    output wire out$first__RDY);
    reg [5:0]element$a;
    reg [3:0]element$b;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$b  , element$a  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            { element$b  , element$a  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
