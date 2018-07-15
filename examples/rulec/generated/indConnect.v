`include "rulec.generated.vh"

`default_nettype none
module indConnect (input wire CLK, input wire nRST,
    input wire indication$enq__ENA,
    input wire [127:0]indication$enq$v,
    output wire indication$enq__RDY,
    output wire rad$enq__ENA,
    output wire [127:0]rad$enq$v,
    output wire [15:0]rad$enq$length,
    input wire rad$enq__RDY);
    assign indication$enq__RDY = rad$enq__RDY;
    assign rad$enq$length = indication$enq$v - 1;
    assign rad$enq$v = indication$enq$v;
    assign rad$enq__ENA = indication$enq__ENA;

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

`default_nettype wire    // set back to default value
