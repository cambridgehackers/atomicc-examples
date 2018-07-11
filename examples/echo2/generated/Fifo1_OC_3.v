`include "ivector.generated.vh"

module Fifo1_OC_3 (input CLK, input nRST,
    input in$enq__ENA,
    input [703:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [703:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c0;
    reg [31:0]element$c1;
    reg [31:0]element$c10;
    reg [31:0]element$c11;
    reg [31:0]element$c12;
    reg [31:0]element$c13;
    reg [31:0]element$c14;
    reg [31:0]element$c15;
    reg [31:0]element$c16;
    reg [31:0]element$c17;
    reg [31:0]element$c18;
    reg [31:0]element$c19;
    reg [31:0]element$c2;
    reg [31:0]element$c3;
    reg [31:0]element$c4;
    reg [31:0]element$c5;
    reg [31:0]element$c6;
    reg [31:0]element$c7;
    reg [31:0]element$c8;
    reg [31:0]element$c9;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$c19  , element$c18  , element$c17  , element$c16  , element$c15  , element$c14  , element$c13  , element$c12  , element$c11  , element$c10  , element$c9  , element$c8  , element$c7  , element$c6  , element$c5  , element$c4  , element$c3  , element$c2  , element$c1  , element$c0  , element$b  , element$a  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c0 <= 0;
        element$c1 <= 0;
        element$c10 <= 0;
        element$c11 <= 0;
        element$c12 <= 0;
        element$c13 <= 0;
        element$c14 <= 0;
        element$c15 <= 0;
        element$c16 <= 0;
        element$c17 <= 0;
        element$c18 <= 0;
        element$c19 <= 0;
        element$c2 <= 0;
        element$c3 <= 0;
        element$c4 <= 0;
        element$c5 <= 0;
        element$c6 <= 0;
        element$c7 <= 0;
        element$c8 <= 0;
        element$c9 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            { element$c19  , element$c18  , element$c17  , element$c16  , element$c15  , element$c14  , element$c13  , element$c12  , element$c11  , element$c10  , element$c9  , element$c8  , element$c7  , element$c6  , element$c5  , element$c4  , element$c3  , element$c2  , element$c1  , element$c0  , element$b  , element$a  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

