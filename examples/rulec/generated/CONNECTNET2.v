`include "rulec.generated.vh"

module CONNECTNET2 (
    input IN1,
    input IN2,
    output OUT1,
    output OUT2);
    wire CLK, nRST;
    wire assign__ENA;
    wire assign__RDY;
    assign assign__ENA = assign__RDY ;
    assign assign__RDY = 1;
    assign OUT1 = IN1 ;
    assign OUT2 = IN2 ;
endmodule 

