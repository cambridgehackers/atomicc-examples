`include "rulec.generated.vh"

`default_nettype none
module CONNECTNET2 (
    input wire IN1,
    input wire IN2,
    output wire OUT1,
    output wire OUT2);
    wire CLK;
    wire nRST;
    wire RULEassign__ENA;
    wire RULEassign__RDY;
    assign OUT1 = IN1;
    assign OUT2 = IN2;
    assign RULEassign__ENA = 1;
    // Extra assigments, not to output wires
    assign RULEassign__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
