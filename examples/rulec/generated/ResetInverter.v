`include "zynqTop.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    wire CLK;
    wire nRST;
    wire RULEinit$100__ENA;
    wire RULEinit__ENA;
    assign RULEinit$100__ENA = 1;
    assign RULEinit__ENA = 1;
    assign RESET_OUT = ( !RESET_IN ) & ( !RESET_IN );
endmodule 

`default_nettype wire    // set back to default value
