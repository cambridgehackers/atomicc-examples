`include "resetInverter.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    logic CLK;
    logic nRST;
    assign RESET_OUT = ( !RESET_IN ) && 1'd1;
endmodule

`default_nettype wire    // set back to default value
