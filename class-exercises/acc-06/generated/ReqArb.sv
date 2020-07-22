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
    reg aIsTheOwner;
    assign a__RDY = aIsTheOwner && out$a__RDY;
    assign b__RDY = !( aIsTheOwner || ( !out$a__RDY ) );
    assign out$a$v = ( a__ENA && a__RDY ) ? a$v : 1'd0;
    assign out$a__ENA = ( a__ENA && ( aIsTheOwner || b__ENA ) ) || ( ( !a__ENA ) && ( !( aIsTheOwner || ( !b__ENA ) ) ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        aIsTheOwner <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
