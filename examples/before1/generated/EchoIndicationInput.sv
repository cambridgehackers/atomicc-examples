`include "atomicc.generated.vh"
`include "before1.generated.vh"
`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    PipeIn.server pipe,
    EchoIndication.client indication);
    reg busy_delay;
    reg [32 - 1:0]meth_delay;
    reg [32 - 1:0]v_delay;
    logic RULE$input_rule__ENA;
    EchoIndication_data _pipe$enq$temp$v;
    // Extra assigments, not to output wires
    assign RULE$input_rule__ENA = busy_delay && indication.heard__RDY;
    assign _pipe$enq$temp$v = pipe.enq$v;
    assign indication.heard$meth = meth_delay;
    assign indication.heard$v = v_delay;
    assign indication.heard__ENA = busy_delay;
    assign pipe.enq__RDY = !busy_delay;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 1'd0;
        meth_delay <= 32'd0;
        v_delay <= 32'd0;
      end // nRST
      else begin
        if (busy_delay && indication.heard__RDY && RULE$input_rule__ENA) begin // RULE$input_rule__ENA
            busy_delay <= 0 != 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of RULE$input_rule__ENA
        if (( !busy_delay ) && pipe.enq__ENA) begin // pipe.enq__ENA
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , _pipe$enq$temp$v.tag );
            if (_pipe$enq$temp$v.tag == 1) begin
            meth_delay <= _pipe$enq$temp$v.data$heard$meth;
            v_delay <= _pipe$enq$temp$v.data$heard$v;
            busy_delay <= 1 != 0;
            end;
        end; // End of pipe.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
