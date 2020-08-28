`include "reqarb.generated.vh"

`default_nettype none
module ReqArb (input wire CLK, input wire nRST,
    input wire a__ENA,
    input wire a$v,
    output wire a__RDY,
    input wire b__ENA,
    input wire b$v,
    output wire b__RDY,
    ReqCallout.client out);
    assign a__RDY = !( ( 0 == ( ( b__ENA != 0 ) ^ 1 ) ) || ( !out.a__RDY ) );
    assign b__RDY = !( ( 0 == ( ( a__ENA != 0 ) ^ 1 ) ) || ( !out.a__RDY ) );
    // Extra assigments, not to output wires
    assign out.a$v = ( ( a__ENA && a__RDY ) ? a$v : 1'd0 ) | ( ( b__ENA && b__RDY ) ? b$v : 1'd0 );
    assign out.a__ENA = ( a__ENA && ( a__RDY || ( b__ENA && b__RDY ) ) ) || ( ( !a__ENA ) && b__ENA && b__RDY );
endmodule

`default_nettype wire    // set back to default value
