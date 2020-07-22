`include "connect.generated.vh"

`default_nettype none
module EchoRequestOutput (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$meth,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire pipe$enq__ENA,
    output wire [(32 + (32 + 32)) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    wire [32 - 1:0]request$say$ind$data$say$meth;
    wire [32 - 1:0]request$say$ind$data$say$v;
    wire [32 - 1:0]request$say$ind$tag;
    assign pipe$enq$v = { request$say$ind$data$say$v , request$say$ind$data$say$meth , request$say$ind$tag };
    assign pipe$enq__ENA = request$say__ENA;
    assign request$say__RDY = pipe$enq__RDY;
    // Extra assigments, not to output wires
    assign request$say$ind$data$say$meth = request$say$meth;
    assign request$say$ind$data$say$v = request$say$v;
    assign request$say$ind$tag = 32'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA && pipe$enq__RDY) begin // request$say__ENA
            $display( "entered EchoRequestOutput::say" );
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
