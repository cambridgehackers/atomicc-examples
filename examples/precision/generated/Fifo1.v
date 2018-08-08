`include "precision.generated.vh"

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
    assign in$enq__RDY = 1;
    assign out$deq__RDY = 1;
    assign out$first = { element$data3 , element$data2 , element$data1 , element$data0 };
    assign out$first__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin // in$enq__ENA
            { element$data3 , element$data2 , element$data1 , element$data0 } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin // out$deq__ENA
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
