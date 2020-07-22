`include "dblpipe.generated.vh"

`default_nettype none
module DblPipe (input wire CLK, input wire nRST,
    input wire shiftBit__ENA,
    input wire shiftBit$v,
    output wire shiftBit__RDY,
    output wire outBit,
    output wire outBit__RDY);
    reg o_data;
    wire RULE$updateRule__RDY;
    wire one$outBit;
    wire one$outBit__RDY;
    wire one$shiftBit$v;
    wire one$shiftBit__ENA;
    wire one$shiftBit__RDY;
    wire two$outBit;
    wire two$outBit__RDY;
    wire two$shiftBit$v;
    wire two$shiftBit__ENA;
    wire two$shiftBit__RDY;
    LfsrFib#(.LN(8),.TAPS(45)) one (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(one$shiftBit__ENA),
        .shiftBit$v(one$shiftBit$v),
        .shiftBit__RDY(one$shiftBit__RDY),
        .outBit(one$outBit),
        .outBit__RDY(one$outBit__RDY));
    LfsrFib#(.LN(8),.TAPS(45)) two (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(two$shiftBit__ENA),
        .shiftBit$v(two$shiftBit$v),
        .shiftBit__RDY(two$shiftBit__RDY),
        .outBit(two$outBit),
        .outBit__RDY(two$outBit__RDY));
    assign one$shiftBit$v = shiftBit$v;
    assign one$shiftBit__ENA = shiftBit__ENA && two$shiftBit__RDY;
    assign outBit = o_data;
    assign outBit__RDY = 1;
    assign shiftBit__RDY = one$shiftBit__RDY && two$shiftBit__RDY;
    assign two$shiftBit$v = shiftBit$v;
    assign two$shiftBit__ENA = shiftBit__ENA && one$shiftBit__RDY;
    // Extra assigments, not to output wires
    assign RULE$updateRule__RDY = one$outBit__RDY && two$outBit__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        o_data <= 0;
      end // nRST
      else begin
        if (RULE$updateRule__RDY) begin // RULE$updateRule__ENA
            o_data <= one$outBit ^ two$outBit;
        end; // End of RULE$updateRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
