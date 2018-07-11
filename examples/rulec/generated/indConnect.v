`include "rulec.generated.vh"

module indConnect (input CLK, input nRST,
    input indication$enq__ENA,
    input [127:0]indication$enq$v,
    output indication$enq__RDY,
    output rad$enq__ENA,
    output [127:0]rad$enq$v,
    output [15:0]rad$enq$length,
    input rad$enq__RDY);
    wire CLK, nRST;
    assign indication$enq__RDY = rad$enq__RDY ;
    assign rad$enq$length = indication$enq$v  - 1;
    assign rad$enq$v = indication$enq$v ;
    assign rad$enq__ENA = indication$enq__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$enq__ENA & indication$enq__RDY) begin
            $display( "indConnect.enq v %llx len %lx" , indication$enq$v , ( indication$enq$v - 1 ) );
        end; // End of indication$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

