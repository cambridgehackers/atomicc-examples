`include "atomicc.generated.vh"
`default_nettype none
module ___P2MEchoRequest (input wire CLK, input wire nRST,
    EchoRequest.client method,
    PipeIn.server pipe);
    // Extra assigments, not to output wires
    assign method.say$v = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ];
    assign method.say2$a = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 16) ) ];
    assign method.say2$b = pipe.enq$v[ ( ((16 + 128) - 32 - 16)-1 ) : ( (((16 + 128) - 32 - 16) - 16) ) ];
    assign method.say2__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign method.say__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method.setLeds$v = pipe.enq$v[ ( (16 + 128) - 32-24-1 ) : ( ((16 + 128) - 32-24 - 8) ) ];
    assign method.setLeds__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 );
    assign pipe.enq__RDY = ( method.say__RDY && ( ( method.say2__RDY && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) ) ) || ( ( !method.say2__RDY ) && ( ( !method.setLeds__RDY ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) && ( method.setLeds__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) ) ) ) ) || ( ( !method.say__RDY ) && ( ( !method.say2__RDY ) || ( ( ( !method.setLeds__RDY ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) && ( method.setLeds__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) ) ) ) && ( method.say2__RDY || ( ( ( !method.setLeds__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) ) && ( method.setLeds__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) ) ) ) );
endmodule

`default_nettype wire    // set back to default value
