`include "echo.generated.vh"

module Fifo1_OC_3 (input CLK, input nRST,
    input in$enq__ENA,
    input [31:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = element ;
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            element  <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

