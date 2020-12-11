`include "connect.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoRequest.client request);
    EchoRequest_data _pipe$enq$temp$v;
    // Extra assigments, not to output wires
    assign _pipe$enq$temp$v = pipe.enq$v;
    assign pipe.enq__RDY = request.say__RDY || ( _pipe$enq$temp$v.tag != 1 );
    assign request.say$meth = _pipe$enq$temp$v.data$say$meth;
    assign request.say$v = _pipe$enq$temp$v.data$say$v;
    assign request.say__ENA = pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 );

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( request.say__RDY && pipe.enq__ENA ) || ( ( !request.say__RDY ) && ( _pipe$enq$temp$v.tag != 1 ) && pipe.enq__ENA )) begin // pipe.enq__ENA
            $display( "entered EchoRequestInput::enq" );
        end; // End of pipe.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
