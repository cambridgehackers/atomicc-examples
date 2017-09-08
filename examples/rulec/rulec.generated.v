`include "rulec.generated.vh"

module l_module_OC_EchoRequestOutput (
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
    output pipe$enq__ENA,
    output [191:0]pipe$enq_v,
    input pipe$enq__RDY);
    wire request$say__RDY_internal;
    wire request$say__ENA_internal = request$say__ENA && request$say__RDY_internal;
    wire request$say2__RDY_internal;
    wire request$say2__ENA_internal = request$say2__ENA && request$say2__RDY_internal;
    assign ind$tag = 2;
    assign pipe$enq__ENA = request$say__ENA_internal || request$say2__ENA_internal;
    assign pipe$enq_v = request$say__ENA_internal ? ind : ind;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say2__RDY_internal = pipe$enq__RDY;
    assign request$say__RDY = request$say__RDY_internal;
    assign request$say__RDY_internal = pipe$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA_internal) begin
            ind$data$say$meth <= request$say_meth;
            ind$data$say$v <= request$say_v;
        end; // End of request$say__ENA
        if (request$say2__ENA_internal) begin
            ind$data$say2$meth <= request$say2_meth;
            ind$data$say2$v <= request$say2_v;
            ind$data$say2$v2 <= request$say2_v2;
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [191:0]pipe$enq_v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say_meth,
    output [31:0]request$say_v,
    output request$say2__ENA,
    output [31:0]request$say2_meth,
    output [31:0]request$say2_v,
    output [31:0]request$say2_v2,
    input request$say2__RDY,
    input request$say__RDY);
    wire pipe$enq__RDY_internal;
    wire pipe$enq__ENA_internal = pipe$enq__ENA && pipe$enq__RDY_internal;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = request$say__RDY & request$say2__RDY;
    assign request$say2__ENA = pipe$enq__ENA_internal & pipe$enq_v$tag == 2;
    assign request$say2_meth = pipe$enq_v$data$say2$meth;
    assign request$say2_v = pipe$enq_v$data$say2$v;
    assign request$say2_v2 = pipe$enq_v$data$say2$v2;
    assign request$say__ENA = pipe$enq__ENA_internal & pipe$enq_v$tag == 1;
    assign request$say_meth = pipe$enq_v$data$say$meth;
    assign request$say_v = pipe$enq_v$data$say$v;
endmodule 

module l_module_OC_EchoIndicationOutput (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard_meth,
    input [31:0]indication$heard_v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq_v,
    input pipe$enq__RDY);
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
            ind1$data$heard$meth <= indication$heard_meth;
            if (even != 0)
            ind1$data$heard$v <= indication$heard_v;
            if ((even != 0) ^ 1)
            ind0$tag <= 1;
            if ((even != 0) ^ 1)
            ind0$data$heard$meth <= indication$heard_meth;
            if ((even != 0) ^ 1)
            ind0$data$heard$v <= indication$heard_v;
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

module l_module_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq_v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard_meth,
    output [31:0]indication$heard_v,
    input indication$heard__RDY);
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

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (pipe$enq__ENA_internal) begin
            if (pipe$enq_v$tag == 1)
            meth_delay <= pipe$enq_v$data$heard$meth;
            if (pipe$enq_v$tag == 1)
            v_delay <= pipe$enq_v$data$heard$v;
            if (pipe$enq_v$tag == 1)
            busy_delay <= 1;
        end; // End of pipe$enq__ENA
        if (input_rule__ENA_internal) begin
            busy_delay <= 0;
        end; // End of input_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Echo (
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
    input indication$heard__RDY);
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
            meth_temp <= request$say_meth;
            v_temp <= request$say_v;
            busy <= 1;
        end; // End of request$say__ENA
        if (request$say2__ENA_internal) begin
            meth_temp <= request$say2_meth;
            v_temp <= request$say2_v;
            busy <= 1;
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_foo (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard_meth,
    input [31:0]indication$heard_v,
    output indication$heard__RDY);
    wire indication$heard__RDY_internal;
    wire indication$heard__ENA_internal = indication$heard__ENA && indication$heard__RDY_internal;
    assign indication$heard__RDY = indication$heard__RDY_internal;
    assign indication$heard__RDY_internal = 1;
endmodule 

module l_module_OC_Connect (
    input CLK,
    input nRST);
    wire lEIO$indication$heard__ENA;
    wire [31:0]lEIO$indication$heard_meth;
    wire [31:0]lEIO$indication$heard_v;
    wire lEIO$indication$heard__RDY;
    wire lEIO$output_rulee__ENA;
    wire lEIO$output_rulee__RDY;
    wire lEIO$output_ruleo__ENA;
    wire lEIO$output_ruleo__RDY;
    l_module_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEIO$indication$heard__ENA,
        lEIO$indication$heard_meth,
        lEIO$indication$heard_v,
        lEIO$indication$heard__RDY,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq_v,
        lEIO$pipe$enq__RDY);
    wire lERI$pipe$enq__ENA;
    wire [191:0]lERI$pipe$enq_v;
    wire lERI$pipe$enq__RDY;
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERI$pipe$enq__ENA,
        lERI$pipe$enq_v,
        lERI$pipe$enq__RDY,
        lERI$request$say__ENA,
        lERI$request$say_meth,
        lERI$request$say_v,
        lERI$request$say2__ENA,
        lERI$request$say2_meth,
        lERI$request$say2_v,
        lERI$request$say2_v2,
        lERI$request$say2__RDY,
        lERI$request$say__RDY);
    wire lEcho$delay_rule__ENA;
    wire lEcho$delay_rule__RDY;
    wire lEcho$respond_rule__ENA;
    wire lEcho$respond_rule__RDY;
    wire lEcho$request$say__ENA;
    wire [31:0]lEcho$request$say_meth;
    wire [31:0]lEcho$request$say_v;
    wire lEcho$request$say2__ENA;
    wire [31:0]lEcho$request$say2_meth;
    wire [31:0]lEcho$request$say2_v;
    wire [31:0]lEcho$request$say2_v2;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lEcho$request$say__ENA,
        lEcho$request$say_meth,
        lEcho$request$say_v,
        lEcho$request$say2__ENA,
        lEcho$request$say2_meth,
        lEcho$request$say2_v,
        lEcho$request$say2_v2,
        lEcho$request$say2__RDY,
        lEcho$request$say__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard_meth,
        lEcho$indication$heard_v,
        lEcho$indication$heard__RDY);
    wire lERO_test$request$say__ENA;
    wire [31:0]lERO_test$request$say_meth;
    wire [31:0]lERO_test$request$say_v;
    wire lERO_test$request$say2__ENA;
    wire [31:0]lERO_test$request$say2_meth;
    wire [31:0]lERO_test$request$say2_v;
    wire [31:0]lERO_test$request$say2_v2;
    wire lERO_test$request$say2__RDY;
    wire lERO_test$request$say__RDY;
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        lERO_test$request$say__ENA,
        lERO_test$request$say_meth,
        lERO_test$request$say_v,
        lERO_test$request$say2__ENA,
        lERO_test$request$say2_meth,
        lERO_test$request$say2_v,
        lERO_test$request$say2_v2,
        lERO_test$request$say2__RDY,
        lERO_test$request$say__RDY,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq_v,
        lERO_test$pipe$enq__RDY);
    wire lEII_test$pipe$enq__ENA;
    wire [95:0]lEII_test$pipe$enq_v;
    wire lEII_test$pipe$enq__RDY;
    wire lEII_test$input_rule__ENA;
    wire lEII_test$input_rule__RDY;
    l_module_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEII_test$pipe$enq__ENA,
        lEII_test$pipe$enq_v,
        lEII_test$pipe$enq__RDY,
        lEII_test$indication$heard__ENA,
        lEII_test$indication$heard_meth,
        lEII_test$indication$heard_v,
        lEII_test$indication$heard__RDY);
endmodule 

