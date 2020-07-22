`include "bscant.generated.vh"

`default_nettype none
module ___M2PBtestIndication (input wire CLK, input wire nRST,
    input wire method$heard__ENA,
    input wire [32 - 1:0]method$heard$v,
    output wire method$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [(16 + 128) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign method$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = { 16'd0, 16'd5, method$heard$v, 64'd0, 16'd2};
    assign pipe$enq__ENA = method$heard__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (method$heard__ENA && pipe$enq__RDY) begin // method$heard__ENA
            $display( "DISPLAYM2P %x" , { 16'd0, 16'd5, method$heard$v, 64'd0, 16'd2} );
        end; // End of method$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
