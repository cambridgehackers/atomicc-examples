`include "bscant.generated.vh"

`default_nettype none
module ___P2MBtestRequest (input wire CLK, input wire nRST,
    output wire method$say__ENA,
    output wire [32 - 1:0]method$say$v,
    output wire [8 - 1:0]method$say$seqno,
    input wire method$say__RDY,
    input wire pipe$enq__ENA,
    input wire [(16 + 128) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY);
    assign method$say$seqno = pipe$enq$v[((32+16+24 + 32) + 8) -1 :(32+16+24 + 32)];
    assign method$say$v = pipe$enq$v[(32+16+24 + 32) -1 :32+16+24];
    assign method$say__ENA = pipe$enq__ENA && ( pipe$enq$v[ ( 31 + 16 ) : ( 16 + 16 ) ] == 16'd0 );
    assign pipe$enq__RDY = method$say__RDY;
endmodule 

`default_nettype wire    // set back to default value
