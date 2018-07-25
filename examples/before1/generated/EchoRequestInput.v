`include "before1.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [191:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire request$say__ENA,
    output wire [31:0]request$say$meth,
    output wire [31:0]request$say$v,
    output wire request$say2__ENA,
    output wire [31:0]request$say2$meth,
    output wire [31:0]request$say2$v,
    input wire request$say2__RDY,
    input wire request$say__RDY);
    wire pipe$enq__EXECUTE;
    assign pipe$enq__EXECUTE = pipe$enq__ENA & pipe$enq__RDY;
    assign pipe$enq__RDY = ( ( pipe$enq$v[31:0] != 32'd1 ) | request$say__RDY ) & ( ( pipe$enq$v[31:0] != 32'd2 ) | request$say2__RDY );
    assign request$say$meth = pipe$enq$v[63:32];
    assign request$say$v = pipe$enq$v[95:64];
    assign request$say2$meth = pipe$enq$v[127:96];
    assign request$say2$v = pipe$enq$v[159:128];
    assign request$say2__ENA = ( pipe$enq$v[31:0] == 32'd2 ) & pipe$enq__ENA;
    assign request$say__ENA = ( pipe$enq$v[31:0] == 32'd1 ) & pipe$enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__EXECUTE) begin
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq$v[ 31 : 0 ] );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
