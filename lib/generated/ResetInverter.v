`include "resetInverter.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    wire CLK;
    wire nRST;
    assign RESET_OUT = !RESET_IN;
endmodule 

`default_nettype wire    // set back to default value
