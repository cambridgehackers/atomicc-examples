`include "before1.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [95:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$meth,
    output wire [31:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]v_delay;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$heard$meth;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$heard$v;
    wire [31:0]pipe$enq__ENA$v_2e_addr$tag;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = busy_delay;
    assign pipe$enq__RDY = !busy_delay;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (busy_delay & indication$heard__RDY) begin // RULEinput_rule__ENA
            busy_delay <= 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of RULEinput_rule__ENA
        if (pipe$enq__ENA & ( !busy_delay )) begin // pipe$enq__ENA
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , pipe$enq__ENA$v_2e_addr$tag );
            if (pipe$enq__ENA$v_2e_addr$tag == 1) begin
            meth_delay <= pipe$enq__ENA$v_2e_addr$data$heard$meth;
            v_delay <= pipe$enq__ENA$v_2e_addr$data$heard$v;
            busy_delay <= 1;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
