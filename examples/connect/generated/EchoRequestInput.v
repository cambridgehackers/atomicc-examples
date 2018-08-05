`include "connect.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [95:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire request$say__ENA,
    output wire [31:0]request$say$meth,
    output wire [31:0]request$say$v,
    input wire request$say__RDY);
    assign pipe$enq__RDY = request$say__RDY;
    assign request$say$meth = pipe$enq$v[ 63 : 32 ];
    assign request$say$v = pipe$enq$v[ 95 : 64 ];
    assign request$say__ENA = ( pipe$enq$v[ 31 : 0 ] == 32'd1 ) & pipe$enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA & pipe$enq__RDY) begin
            $display( "entered EchoRequestInput::enq" );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
