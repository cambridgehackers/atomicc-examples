`include "before1.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [(32 + ((32 + 32) + ((32 + 32) + 32))) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire request$say2__ENA,
    output wire [32 - 1:0]request$say2$meth,
    output wire [32 - 1:0]request$say2$v,
    input wire request$say2__RDY,
    output wire request$say__ENA,
    output wire [32 - 1:0]request$say$meth,
    output wire [32 - 1:0]request$say$v,
    input wire request$say__RDY);
    wire [32 - 1:0]pipe$enq__ENA$v$tag;
    assign pipe$enq__RDY = request$say__RDY & request$say2__RDY;
    assign request$say$meth = pipe$enq$v[ 32 - 1 + 32 : 32 ];
    assign request$say$v = pipe$enq$v[ 32 - 1 + 64 : 64 ];
    assign request$say2$meth = pipe$enq$v[ 32 - 1 + 32 : 32 ];
    assign request$say2$v = pipe$enq$v[ 32 - 1 + 64 : 64 ];
    assign request$say2__ENA = pipe$enq__ENA & request$say__RDY & ( pipe$enq$v[ ( 32 - 1 ) : 0 ] == 2 );
    assign request$say__ENA = pipe$enq__ENA & request$say2__RDY & ( pipe$enq$v[ ( 32 - 1 ) : 0 ] == 1 );
    // Extra assigments, not to output wires
    assign pipe$enq__ENA$v$tag = pipe$enq$v[ 32 - 1 : 0 ];

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA & request$say__RDY & request$say2__RDY) begin // pipe$enq__ENA
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq__ENA$v$tag );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
