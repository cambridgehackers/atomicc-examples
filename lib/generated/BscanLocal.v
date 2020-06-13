`include "bscan.generated.vh"

`default_nettype none
module BscanLocal #(
    parameter integer width = 64)(
    input wire toBscan$enq__ENA,
    input wire [width - 1:0]toBscan$enq$v,
    output wire toBscan$enq__RDY,
    output wire fromBscan$enq__ENA,
    output wire [width - 1:0]fromBscan$enq$v,
    input wire fromBscan$enq__RDY,
    input wire CLK,
    input wire nRST,
    input wire capture,
    input wire shift,
    input wire update,
    output wire TDO,
    input wire TDI);
    reg notReady;
    reg [width - 1:0]shiftReg;
    wire RULE$shiftRule__RDY;
    wire RULE$updateRule__RDY;
    assign TDO = shiftReg[ 0 : 0 ];
    assign fromBscan$enq$v = shiftReg;
    assign fromBscan$enq__ENA = RULE$updateRule__RDY;
    assign toBscan$enq__RDY = !( notReady || ( !capture ) );
    // Extra assigments, not to output wires
    assign RULE$shiftRule__RDY = shift;
    assign RULE$updateRule__RDY = update && fromBscan$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        notReady <= 0;
        shiftReg <= 0;
      end // nRST
      else begin
        if (RULE$shiftRule__RDY) begin // RULE$shiftRule__ENA
            shiftReg <= { TDI , shiftReg[ ( width - 1 ) : 1 ] };
        end; // End of RULE$shiftRule__ENA
        if (RULE$updateRule__RDY) begin // RULE$updateRule__ENA
            notReady <= 0;
        end; // End of RULE$updateRule__ENA
        if (toBscan$enq__ENA && toBscan$enq__RDY) begin // toBscan$enq__ENA
            shiftReg <= toBscan$enq$v;
            notReady <= 1;
        end; // End of toBscan$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
