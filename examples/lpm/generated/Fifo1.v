`include "lpm.generated.vh"

`default_nettype none
module Fifo1 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [127:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [127:0]out$first,
    output wire out$first__RDY);
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    wire [127:0]element;
    wire in$enq__EXECUTE;
    wire out$deq__EXECUTE;
    assign in$enq__EXECUTE = in$enq__ENA & in$enq__RDY;
    assign in$enq__RDY = 1;
    assign out$deq__EXECUTE = out$deq__ENA & out$deq__RDY;
    assign out$deq__RDY = 1;
    assign out$first = { element$data3 , element$data2 , element$data1 , element$data0 };
    assign out$first__RDY = 1;
    // Extra assigments, not to output wires
    assign element = { element$data3 , element$data2 , element$data1 , element$data0 };

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__EXECUTE) begin
            { element$data3 , element$data2 , element$data1 , element$data0 } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__EXECUTE) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
