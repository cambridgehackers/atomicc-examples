`include "funnel.generated.vh"

`default_nettype none
module ___P2MFunnelRequest (input wire CLK, input wire nRST,
    output wire method$say__ENA,
    output wire [32 - 1:0]method$say$v,
    input wire method$say__RDY,
    input wire pipe$enq__ENA,
    input wire [(16 + 128) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY);
    assign method$say$v = pipe$enq$v[(16 + 128) - 32 -1 :((16 + 128) - 32 - 32)];
    assign method$say__ENA = pipe$enq__ENA && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign pipe$enq__RDY = method$say__RDY;
endmodule

`default_nettype wire    // set back to default value
