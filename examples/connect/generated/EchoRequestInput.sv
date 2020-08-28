`include "connect.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoRequest.client request);
    EchoRequest_data temp$pipe$enq$v;
    // Extra assigments, not to output wires
    assign pipe.enq__RDY = request.say__RDY || ( !( temp$pipe$enq$v.tag == 1 ) );
    assign request.say$meth = temp$pipe$enq$v.data$say$meth;
    assign request.say$v = temp$pipe$enq$v.data$say$v;
    assign request.say__ENA = pipe.enq__ENA && pipe.enq__RDY && ( temp$pipe$enq$v.tag == 1 );
    assign temp$pipe$enq$v = pipe.enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe.enq__ENA && pipe.enq__RDY) begin // pipe.enq__ENA
            $display( "entered EchoRequestInput::enq" );
        end; // End of pipe.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
