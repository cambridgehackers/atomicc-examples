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
    wire RULEinput_rule__ENA;
    wire RULEinput_rule__EXECUTE;
    wire RULEinput_rule__RDY;
    wire [31:0]pipe$enq__ENA$v_2e_addr$tag;
    wire pipe$enq__EXECUTE;
    assign RULEinput_rule__ENA = busy_delay & indication$heard__RDY;
    assign RULEinput_rule__EXECUTE = busy_delay & indication$heard__RDY;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = busy_delay;
    assign pipe$enq__EXECUTE = pipe$enq__ENA & pipe$enq__RDY;
    assign pipe$enq__RDY = !busy_delay;
    // Extra assigments, not to output wires
    assign RULEinput_rule__RDY = busy_delay & indication$heard__RDY;
    assign pipe$enq__ENA$v_2e_addr$tag = pipe$enq$v[31:0];

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (RULEinput_rule__EXECUTE) begin
            busy_delay <= 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of RULEinput_rule__ENA
        if (pipe$enq__EXECUTE) begin
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , pipe$enq$v[ 31 : 0 ] );
            if (pipe$enq__ENA$v_2e_addr$tag == 1) begin
            meth_delay <= pipe$enq$v[ 63 : 32 ];
            v_delay <= pipe$enq$v[ 95 : 64 ];
            busy_delay <= 1;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
