`include "connectNet2.generated.vh"

`default_nettype none
module CONNECTNET2 (
    input wire IN1,
    input wire IN2,
    output wire OUT1,
    output wire OUT2);
    wire CLK;
    wire nRST;
    assign OUT1 = IN1;
    assign OUT2 = IN2;
endmodule 

`default_nettype wire    // set back to default value
