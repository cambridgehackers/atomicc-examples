`include "atomicc.generated.vh"
`default_nettype none
module ___P2MEchoRequest (input wire CLK, input wire nRST,
    EchoRequest.client method,
    PipeIn.server pipe);
    // Extra assigments, not to output wires
    assign method.say$v = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ];
    assign method.say__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method.setup$ahBackSync = pipe.enq$v[ ( (((16 + 128) - 32 - 16) - 16)-1 ) : ( ((((16 + 128) - 32 - 16) - 16) - 8) ) ];
    assign method.setup$ahEnd = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 16) ) ];
    assign method.setup$ahFrontEnd = pipe.enq$v[ ( ((16 + 128) - 32 - 16)-1 ) : ( (((16 + 128) - 32 - 16) - 16) ) ];
    assign method.setup$ahSyncWidth = pipe.enq$v[ ( ((((16 + 128) - 32 - 16) - 16) - 8)-1 ) : ( (((((16 + 128) - 32 - 16) - 16) - 8) - 8) ) ];
    assign method.setup$avBackSync = pipe.enq$v[ ( (((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) - 16)-1 ) : ( ((((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) - 16) - 8) ) ];
    assign method.setup$avEnd = pipe.enq$v[ ( (((((16 + 128) - 32 - 16) - 16) - 8) - 8)-1 ) : ( ((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) ) ];
    assign method.setup$avFrontEnd = pipe.enq$v[ ( ((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16)-1 ) : ( (((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) - 16) ) ];
    assign method.setup$avSyncWidth = pipe.enq$v[ ( ((((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) - 16) - 8)-1 ) : ( (((((((((16 + 128) - 32 - 16) - 16) - 8) - 8) - 16) - 16) - 8) - 8) ) ];
    assign method.setup__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign pipe.enq__RDY = ( method.say__RDY && ( method.setup__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) ) || ( ( !method.say__RDY ) && ( ( !method.setup__RDY ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) && ( method.setup__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) ) );
endmodule

`default_nettype wire    // set back to default value
