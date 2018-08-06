`include "zynqTop.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    wire CLK;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire nRST;
    assign RESET_OUT = !RESET_IN;
    // Extra assigments, not to output wires
    assign RULEinit__ENA = 1;
    assign RULEinit__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
