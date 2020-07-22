`include "lfsrequiv.generated.vh"

`default_nettype none
module LfsrGal #(
    parameter integer LN = 8,
    parameter integer TAPS = 45)(
    input wire CLK, input wire nRST,
    input wire shiftBit__ENA,
    input wire shiftBit$v,
    output wire shiftBit__RDY,
    output wire outBit,
    output wire outBit__RDY);
    reg [LN - 1:0]sreg;
    assign outBit = sreg[ 0 ];
    assign outBit__RDY = 1;
    assign shiftBit__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        sreg <= 0;
      end // nRST
      else begin
        if (shiftBit__ENA) begin // shiftBit__ENA
            if (!shiftBit$v)
            sreg <= { shiftBit$v , sreg[ ( LN - 1 ) : 1 ] };
            if (shiftBit$v)
            sreg <= { shiftBit$v , sreg[ ( LN - 1 ) : 1 ] } ^ TAPS;
        end; // End of shiftBit__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
