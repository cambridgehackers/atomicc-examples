`include "packing.generated.vh"

`default_nettype none
module ___P2MPackRequest (input wire CLK, input wire nRST,
    PackRequest.client method,
    PipeIn.server pipe);
    NOCDataH temp$pipe$enq$v;
    // Extra assigments, not to output wires
    assign method.say$seqno = pipe.enq$v[ ( ((16 + 128) - 32-24 - 32)-1 ) : ( (((16 + 128) - 32-24 - 32) - 8) ) ];
    assign method.say$v = pipe.enq$v[ ( (16 + 128) - 32-24-1 ) : ( ((16 + 128) - 32-24 - 32) ) ];
    assign method.say__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign pipe.enq__RDY = method.say__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) );
    assign temp$pipe$enq$v = pipe.enq$v;
endmodule

`default_nettype wire    // set back to default value
