
`include "l_class_OC_Echo.vh"

module l_class_OC_Echo (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say_meth,
    input [31:0]request$say_v,
    input request$say2__ENA,
    input [31:0]request$say2_meth,
    input [31:0]request$say2_v,
    input [31:0]request$say2_v2,
    output request$say2__RDY,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard_meth,
    output [31:0]indication$heard_v,
    input indication$heard__RDY,
    input [`l_class_OC_Echo_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_Echo_RULE_COUNT:0]rule_ready);
    wire delay_rule__RDY_internal;
    wire delay_rule__ENA_internal = rule_enable[0] && delay_rule__RDY_internal;
    wire respond_rule__RDY_internal;
    wire respond_rule__ENA_internal = rule_enable[1] && respond_rule__RDY_internal;
    wire request$say__RDY_internal;
    wire request$say__ENA_internal = request$say__ENA && request$say__RDY_internal;
    wire request$say2__RDY_internal;
    wire request$say2__ENA_internal = request$say2__ENA && request$say2__RDY_internal;
    reg[31:0] busy;
    reg[31:0] meth_temp;
    reg[31:0] v_temp;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    assign delay_rule__RDY_internal = ((busy != 0) & (busy_delay == 0)) != 0;
    assign indication$heard__ENA = respond_rule__ENA_internal;
    assign indication$heard_meth = meth_delay;
    assign indication$heard_v = v_delay;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say2__RDY_internal = (busy != 0) ^ 1;
    assign request$say__RDY = request$say__RDY_internal;
    assign request$say__RDY_internal = (busy != 0) ^ 1;
    assign respond_rule__RDY_internal = (busy_delay != 0) & indication$heard__RDY;
    assign rule_ready[0] = delay_rule__RDY_internal;
    assign rule_ready[1] = respond_rule__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        meth_temp <= 0;
        v_temp <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA_internal) begin
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
        end; // End of delay_rule__ENA
        if (respond_rule__ENA_internal) begin
            busy_delay <= 0;
        end; // End of respond_rule__ENA
        if (request$say__ENA_internal) begin
            meth_temp <= say_meth;
            v_temp <= say_v;
            busy <= 1;
        end; // End of request$say__ENA
        if (request$say2__ENA_internal) begin
            meth_temp <= say2_meth;
            v_temp <= say2_v;
            busy <= 1;
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

