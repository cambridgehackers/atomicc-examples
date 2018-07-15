`include "zynqTop.generated.vh"

`default_nettype none
module ResetInverter (
    input wire RESET_IN,
    output wire RESET_OUT);
    wire CLK;
    wire nRST;
    wire init__ENA;
    assign init__ENA = 1;
    assign RESET_OUT = !RESET_IN ;
endmodule 

`default_nettype wire    // set back to default value
