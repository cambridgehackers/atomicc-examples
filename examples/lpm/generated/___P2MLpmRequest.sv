`include "lpm.generated.vh"

`default_nettype none
module ___P2MLpmRequest (input wire CLK, input wire nRST,
    LpmRequest.client method,
    PipeIn.server pipe);
    // Extra assigments, not to output wires
    assign method.enter$data = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ];
    assign method.enter__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method.write$addr = pipe.enq$v[ ( (16 + 128) - 32-1 ) : ( ((16 + 128) - 32 - 32) ) ];
    assign method.write$data = pipe.enq$v[ ( ((16 + 128) - 32 - 32)-1 ) : ( (((16 + 128) - 32 - 32) - 32) ) ];
    assign method.write__ENA = pipe.enq__ENA && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign pipe.enq__RDY = ( method.enter__RDY && ( method.write__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) ) || ( ( !method.enter__RDY ) && ( ( !method.write__RDY ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) && ( method.write__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) ) ) );
endmodule

`default_nettype wire    // set back to default value
