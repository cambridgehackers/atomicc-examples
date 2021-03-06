`include "atomicc.generated.vh"
`default_nettype none
module LfsrEquiv (input wire CLK, input wire nRST,
    input wire shiftBit__ENA,
    input wire shiftBit$v,
    output wire shiftBit__RDY,
    output wire outBit,
    output wire outBit__RDY);
    reg o_data;
    logic RULE$updateRule__ENA;
    logic fib$outBit;
    logic fib$outBit__RDY;
    logic fib$shiftBit__RDY;
    logic gal$outBit;
    logic gal$outBit__RDY;
    logic gal$shiftBit__RDY;
    LfsrFib#(.LN(8),.TAPS(45)) fib (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(shiftBit__ENA),
        .shiftBit$v(shiftBit__ENA && shiftBit$v),
        .shiftBit__RDY(fib$shiftBit__RDY),
        .outBit(fib$outBit),
        .outBit__RDY(fib$outBit__RDY));
    LfsrGal#(.LN(8),.TAPS(45)) gal (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(shiftBit__ENA),
        .shiftBit$v(shiftBit__ENA && shiftBit$v),
        .shiftBit__RDY(gal$shiftBit__RDY),
        .outBit(gal$outBit),
        .outBit__RDY(gal$outBit__RDY));
    assign outBit = o_data;
    assign outBit__RDY = 1'd1;
    assign shiftBit__RDY = fib$shiftBit__RDY && gal$shiftBit__RDY;
    // Extra assigments, not to output wires
    assign RULE$updateRule__ENA = fib$outBit__RDY && gal$outBit__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        o_data <= 1'd0;
      end // nRST
      else begin
        if (fib$outBit__RDY && gal$outBit__RDY && RULE$updateRule__ENA) begin // RULE$updateRule__ENA
            o_data <= fib$outBit ^ gal$outBit;
        end; // End of RULE$updateRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
