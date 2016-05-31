
`include "l_class_OC_EchoIndicationInput.vh"

module l_class_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq_v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard_meth,
    output [31:0]indication$heard_v,
    input indication$heard__RDY,
    input [`l_class_OC_EchoIndicationInput_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_EchoIndicationInput_RULE_COUNT:0]rule_ready);
    wire input_rule__RDY_internal;
    wire input_rule__ENA_internal = rule_enable[0] && input_rule__RDY_internal;
    wire pipe$enq__RDY_internal;
    wire pipe$enq__ENA_internal = pipe$enq__ENA && pipe$enq__RDY_internal;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    assign indication$heard__ENA = input_rule__ENA_internal;
    assign indication$heard_meth = meth_delay;
    assign indication$heard_v = v_delay;
    assign input_rule__RDY_internal = (busy_delay != 0) & indication$heard__RDY;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = (busy_delay != 0) ^ 1;
    assign rule_ready[0] = input_rule__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (pipe$enq__ENA_internal) begin
            if (enq_v$tag == 1)
            meth_delay <= enq_v$data$heard$meth;
            if (enq_v$tag == 1)
            v_delay <= enq_v$data$heard$v;
            if (enq_v$tag == 1)
            busy_delay <= 1;
        end; // End of pipe$enq__ENA
        if (input_rule__ENA_internal) begin
            busy_delay <= 0;
        end; // End of input_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

