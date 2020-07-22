`include "lfsrequiv.generated.vh"

`default_nettype none
module LfsrFib #(
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
            sreg <= { ( sreg[ 0 ] & TAPS ) ^ shiftBit$v , sreg[ ( LN - 1 ) : 1 ] };
        end; // End of shiftBit__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
