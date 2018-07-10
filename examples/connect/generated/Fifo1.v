`include "connect.generated.vh"

module Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$data3  , element$data2  , element$data1  , element$data0  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

