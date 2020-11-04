`include "before1.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoRequest.client request);
    EchoRequest_data _pipe$enq$temp$v;
    // Extra assigments, not to output wires
    assign _pipe$enq$temp$v = pipe.enq$v;
    assign pipe.enq__RDY = ( request.say__RDY && ( request.say2__RDY || ( _pipe$enq$temp$v.tag != 2 ) ) ) || ( ( !request.say__RDY ) && ( ( !request.say2__RDY ) || ( _pipe$enq$temp$v.tag != 1 ) ) && ( request.say2__RDY || ( ( _pipe$enq$temp$v.tag != 2 ) && ( _pipe$enq$temp$v.tag != 1 ) ) ) );
    assign request.say$meth = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 ) ) ? _pipe$enq$temp$v.data$say$meth : 0;
    assign request.say$v = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 ) ) ? _pipe$enq$temp$v.data$say$v : 0;
    assign request.say2$meth = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 2 ) ) ? _pipe$enq$temp$v.data$say2$meth : 0;
    assign request.say2$v = ( pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 2 ) ) ? _pipe$enq$temp$v.data$say2$v : 0;
    assign request.say2__ENA = pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 2 );
    assign request.say__ENA = pipe.enq__ENA && ( _pipe$enq$temp$v.tag == 1 );

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe.enq__RDY && pipe.enq__ENA) begin // pipe.enq__ENA
            $display( "entered EchoRequestInput::enq tag %d" , _pipe$enq$temp$v.tag );
        end; // End of pipe.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
