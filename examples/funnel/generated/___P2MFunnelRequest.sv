`include "atomicc.generated.vh"
`default_nettype none
module ___P2MFunnelRequest (input wire CLK, input wire nRST,
    FunnelRequest.client method,
    PipeIn.server pipe);
    // Extra assigments, not to output wires
    assign method.say$v = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ];
    assign method.say__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign pipe.enq__RDY = method.say__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 );
endmodule

`default_nettype wire    // set back to default value
