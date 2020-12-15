`include "externalPin.generated.vh"

`default_nettype none
module ExternalPin #(
    parameter integer width = 32)(
    input wire [width - 1:0]in,
    output wire [width - 1:0]out);
    logic CLK;
    logic nRST;
    assign out = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
endmodule

`default_nettype wire    // set back to default value
