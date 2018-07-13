`include "lpm.generated.vh"

module Fifo2 (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg [31:0]element0$a;
    reg [31:0]element0$b;
    reg [31:0]element0$c;
    reg [31:0]element1$a;
    reg [31:0]element1$b;
    reg [31:0]element1$c;
    reg [31:0]rindex;
    reg [31:0]windex;
    assign in$enq__RDY = ( ( windex  + 1 ) % 2 ) != rindex ;
    assign out$deq__RDY = rindex  != windex ;
    assign out$first = ( rindex  == 32'd0 ) ? { element0$c  , element0$b  , element0$a  } : { element1$c  , element1$b  , element1$a  };
    assign out$first__RDY = rindex  != windex ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element0$a <= 0;
        element0$b <= 0;
        element0$c <= 0;
        element1$a <= 0;
        element1$b <= 0;
        element1$c <= 0;
        rindex <= 0;
        windex <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            windex  <= ( windex + 1 ) % 2;
            if (windex == 32'd0)
            { element0$c  , element0$b  , element0$a  } <= in$enq$v;
            if (windex == 32'd1)
            { element1$c  , element1$b  , element1$a  } <= in$enq$v;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            rindex  <= ( rindex + 1 ) % 2;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

