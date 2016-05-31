
`include "l_class_OC_EchoIndicationOutput.vh"

module l_class_OC_EchoIndicationOutput (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard_meth,
    input [31:0]indication$heard_v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq_v,
    input pipe$enq__RDY,
    input [`l_class_OC_EchoIndicationOutput_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_EchoIndicationOutput_RULE_COUNT:0]rule_ready);
    wire output_rulee__RDY_internal;
    wire output_rulee__ENA_internal = rule_enable[0] && output_rulee__RDY_internal;
    wire output_ruleo__RDY_internal;
    wire output_ruleo__ENA_internal = rule_enable[1] && output_ruleo__RDY_internal;
    wire indication$heard__RDY_internal;
    wire indication$heard__ENA_internal = indication$heard__ENA && indication$heard__RDY_internal;
    reg[95:0] ind0;
    reg[95:0] ind1;
    reg[31:0] ind_busy;
    reg[31:0] even;
    assign indication$heard__RDY = indication$heard__RDY_internal;
    assign indication$heard__RDY_internal = (ind_busy != 0) ^ 1;
    assign output_rulee__RDY_internal = (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
    assign output_ruleo__RDY_internal = (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
    assign pipe$enq__ENA = output_rulee__ENA_internal || output_ruleo__ENA_internal;
    assign pipe$enq_v = output_rulee__ENA_internal ? ind0 : ind1;
    assign rule_ready[0] = output_rulee__RDY_internal;
    assign rule_ready[1] = output_ruleo__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        ind0 <= 0;
        ind1 <= 0;
        ind_busy <= 0;
        even <= 0;
      end // nRST
      else begin
        if (indication$heard__ENA_internal) begin
            if (even != 0)
            ind1$tag <= 1;
            if (even != 0)
            ind1$data$heard$meth <= heard_meth;
            if (even != 0)
            ind1$data$heard$v <= heard_v;
            if ((even != 0) ^ 1)
            ind0$tag <= 1;
            if ((even != 0) ^ 1)
            ind0$data$heard$meth <= heard_meth;
            if ((even != 0) ^ 1)
            ind0$data$heard$v <= heard_v;
            ind_busy <= 1;
            even <= (even != 0) ^ 1;
        end; // End of indication$heard__ENA
        if (output_rulee__ENA_internal) begin
            ind_busy <= 0;
        end; // End of output_rulee__ENA
        if (output_ruleo__ENA_internal) begin
            ind_busy <= 0;
        end; // End of output_ruleo__ENA
      end
    end // always @ (posedge CLK)
endmodule 

