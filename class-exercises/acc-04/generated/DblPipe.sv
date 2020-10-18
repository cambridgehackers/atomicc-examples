`include "dblpipe.generated.vh"

`default_nettype none
module DblPipe (input wire CLK, input wire nRST,
    input wire shiftBit__ENA,
    input wire shiftBit$v,
    output wire shiftBit__RDY,
    output wire outBit,
    output wire outBit__RDY);
    reg o_data;
    logic one$outBit;
    logic one$outBit__RDY;
    logic one$shiftBit__RDY;
    logic two$outBit;
    logic two$outBit__RDY;
    logic two$shiftBit__RDY;
    LfsrFib#(.LN(8),.TAPS(45)) one (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(shiftBit__ENA),
        .shiftBit$v(shiftBit__ENA && 1'(shiftBit$v)),
        .shiftBit__RDY(one$shiftBit__RDY),
        .outBit(one$outBit),
        .outBit__RDY(one$outBit__RDY));
    LfsrFib#(.LN(8),.TAPS(45)) two (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(shiftBit__ENA),
        .shiftBit$v(shiftBit__ENA && 1'(shiftBit$v)),
        .shiftBit__RDY(two$shiftBit__RDY),
        .outBit(two$outBit),
        .outBit__RDY(two$outBit__RDY));
    assign outBit = o_data;
    assign outBit__RDY = 1'd1;
    assign shiftBit__RDY = one$shiftBit__RDY && two$shiftBit__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        o_data <= 0;
      end // nRST
      else begin
        if (one$outBit__RDY && two$outBit__RDY) begin // RULE$updateRule__ENA
            o_data <= one$outBit ^ two$outBit;
        end; // End of RULE$updateRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
