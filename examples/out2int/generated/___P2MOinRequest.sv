`include "out2int.generated.vh"

`default_nettype none
module ___P2MOinRequest (input wire CLK, input wire nRST,
    OinRequest.client method,
    PipeIn.server pipe);
    // Extra assigments, not to output wires
    assign method.say$v = ( pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ? pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ] : 0;
    assign method.say__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign pipe.enq__RDY = method.say__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) );
endmodule

`default_nettype wire    // set back to default value
