`include "reqarb.generated.vh"

`default_nettype none
module ReqArb (input wire CLK, input wire nRST,
    input wire a__ENA,
    input wire a$v,
    output wire a__RDY,
    input wire b__ENA,
    input wire b$v,
    output wire b__RDY,
    output wire out$a__ENA,
    output wire out$a$v,
    input wire out$a__RDY);
    assign a__RDY = ( !b__ENA ) && out$a__RDY;
    assign b__RDY = ( !a__ENA ) && out$a__RDY;
    assign out$a$v = ( a__ENA && ( a$v || ( b__ENA && b$v ) ) ) || ( ( !a__ENA ) && b__ENA && b$v );
    assign out$a__ENA = a__ENA | b__ENA;
endmodule

`default_nettype wire    // set back to default value
