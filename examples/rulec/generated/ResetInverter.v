`include "zynqTop.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    wire CLK;
    wire nRST;
    wire RULEinit$100__ENA;
    wire RULEinit$100__RDY;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    assign RESET_OUT = !RESET_IN;
    assign RULEinit$100__ENA = 1;
    assign RULEinit__ENA = 1;
    // Extra assigments, not to output wires
    assign RULEinit$100__RDY = 1;
    assign RULEinit__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
