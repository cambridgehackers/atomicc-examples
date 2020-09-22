`include "connect.generated.vh"

`default_nettype none
module EchoRequestOutput (input wire CLK, input wire nRST,
    EchoRequest.server request,
    PipeIn.client pipe);
    EchoRequest_data _request$say$ind;
    // Extra assigments, not to output wires
    assign _request$say$ind.data.say.meth = request.say$meth;
    assign _request$say$ind.data.say.v = request.say$v;
    assign _request$say$ind.tag = 32'd1;
    assign pipe.enq$v = _request$say$ind;
    assign pipe.enq__ENA = request.say__ENA;
    assign request.say__RDY = pipe.enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request.say__ENA && pipe.enq__RDY) begin // request.say__ENA
            $display( "entered EchoRequestOutput::say" );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
