`include "bscan.generated.vh"

`default_nettype none
module BscanLocal #(
    parameter integer width = 32)(
    input wire CLK,
    input wire nRST,
    input wire capture,
    input wire shift,
    input wire update,
    output wire TDO,
    input wire TDI,
    input wire [width - 1:0]toBscan,
    output wire [width - 1:0]fromBscan);
    reg [width - 1:0]shiftReg;
    logic RULE$shiftRule__ENA;
    assign TDO = shiftReg[ 0 : 0 ];
    assign fromBscan = shiftReg;
    // Extra assigments, not to output wires
    assign RULE$shiftRule__ENA = shift;

    always @( posedge CLK) begin
      if (!nRST) begin
        shiftReg <= 0;
      end // nRST
      else begin
        // RULE$init__ENA
            if (capture)
            shiftReg <= toBscan;
        // End of RULE$init__ENA
        if (shift && RULE$shiftRule__ENA) begin // RULE$shiftRule__ENA
            shiftReg <= { TDI , shiftReg[ ( width - 1 ) : 1 ] };
        end; // End of RULE$shiftRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
