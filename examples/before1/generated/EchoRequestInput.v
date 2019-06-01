`include "before1.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [191:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire request$say2__ENA,
    output wire [31:0]request$say2$meth,
    output wire [31:0]request$say2$v,
    input wire request$say2__RDY,
    output wire request$say__ENA,
    output wire [31:0]request$say$meth,
    output wire [31:0]request$say$v,
    input wire request$say__RDY);
    assign pipe$enq__RDY = request$say__RDY & request$say2__RDY;
    assign request$say$meth = pipe$enq$v[ 63 : 32 ];
    assign request$say$v = pipe$enq$v[ 95 : 64 ];
    assign request$say2$meth = pipe$enq$v[ 127 : 96 ];
    assign request$say2$v = pipe$enq$v[ 159 : 128 ];
    assign request$say2__ENA = pipe$enq__ENA & request$say__RDY & ( pipe$enq$v[ 31 : 0 ] == 2 );
    assign request$say__ENA = pipe$enq__ENA & request$say2__RDY & ( pipe$enq$v[ 31 : 0 ] == 1 );

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA & request$say__RDY & request$say2__RDY) begin // pipe$enq__ENA
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq$v[ 31 : 0 ] );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
