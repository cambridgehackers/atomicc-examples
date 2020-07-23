`include "lfsrequiv.generated.vh"

`default_nettype none
module LfsrEquiv (input wire CLK, input wire nRST,
    input wire shiftBit__ENA,
    input wire shiftBit$v,
    output wire shiftBit__RDY,
    output wire outBit,
    output wire outBit__RDY);
    reg o_data;
    wire RULE$updateRule__RDY;
    wire fib$outBit;
    wire fib$outBit__RDY;
    wire fib$shiftBit$v;
    wire fib$shiftBit__ENA;
    wire fib$shiftBit__RDY;
    wire gal$outBit;
    wire gal$outBit__RDY;
    wire gal$shiftBit$v;
    wire gal$shiftBit__ENA;
    wire gal$shiftBit__RDY;
    LfsrFib#(.LN(8),.TAPS(45)) fib (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(fib$shiftBit__ENA),
        .shiftBit$v(fib$shiftBit$v),
        .shiftBit__RDY(fib$shiftBit__RDY),
        .outBit(fib$outBit),
        .outBit__RDY(fib$outBit__RDY));
    LfsrGal#(.LN(8),.TAPS(45)) gal (.CLK(CLK), .nRST(nRST),
        .shiftBit__ENA(gal$shiftBit__ENA),
        .shiftBit$v(gal$shiftBit$v),
        .shiftBit__RDY(gal$shiftBit__RDY),
        .outBit(gal$outBit),
        .outBit__RDY(gal$outBit__RDY));
    assign fib$shiftBit$v = shiftBit$v;
    assign fib$shiftBit__ENA = shiftBit__ENA && gal$shiftBit__RDY;
    assign gal$shiftBit$v = shiftBit$v;
    assign gal$shiftBit__ENA = shiftBit__ENA && fib$shiftBit__RDY;
    assign outBit = o_data;
    assign outBit__RDY = 1;
    assign shiftBit__RDY = fib$shiftBit__RDY && gal$shiftBit__RDY;
    // Extra assigments, not to output wires
    assign RULE$updateRule__RDY = fib$outBit__RDY && gal$outBit__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        o_data <= 0;
      end // nRST
      else begin
        if (RULE$updateRule__RDY) begin // RULE$updateRule__ENA
            o_data <= fib$outBit ^ gal$outBit;
        end; // End of RULE$updateRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value