`include "atomicc.generated.vh"
`default_nettype none
module ExternalPin #(
    parameter integer width = 32)(
    input wire [width - 1:0]in,
    output wire [width - 1:0]out);
    logic CLK;
    logic [width - 1:0]dummy;
    logic nRST;
    assign out = dummy;
endmodule

`default_nettype wire    // set back to default value
