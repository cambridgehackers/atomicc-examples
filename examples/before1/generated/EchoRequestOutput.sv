`include "before1.generated.vh"

`default_nettype none
module EchoRequestOutput (input wire CLK, input wire nRST,
    EchoRequest.server request,
    PipeIn.client pipe);
    EchoRequest_data request$say$ind;
    EchoRequest_data request$say2$ind;
    // Extra assigments, not to output wires
    assign pipe.enq$v = ( ( request.say__ENA && pipe.enq__RDY ) ? request.say$ind : 144'd0 ) | ( ( request.say2__ENA && pipe.enq__RDY ) ? request.say2$ind : 144'd0 );
    assign pipe.enq__ENA = request.say__ENA || request.say2__ENA;
    assign request$say$ind.data$say$meth = request.say$meth;
    assign request$say$ind.data$say$v = request.say$v;
    assign request$say$ind.tag = 32'd1;
    assign request$say2$ind.data$say2$meth = request.say2$meth;
    assign request$say2$ind.data$say2$v = request.say2$v;
    assign request$say2$ind.tag = 32'd2;
    assign request.say2__RDY = pipe.enq__RDY;
    assign request.say__RDY = pipe.enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request.say2__ENA && pipe.enq__RDY) begin // request.say2__ENA
            $display( "entered EchoRequestOutput::say2" );
        end; // End of request.say2__ENA
        if (request.say__ENA && pipe.enq__RDY) begin // request.say__ENA
            $display( "entered EchoRequestOutput::say" );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
