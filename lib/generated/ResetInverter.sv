`include "resetInverter.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    logic CLK;
    logic nRST;
    assign RESET_OUT = RESET_IN == 0;
endmodule

`default_nettype wire    // set back to default value
