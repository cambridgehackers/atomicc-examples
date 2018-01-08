`include "rulec.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    wire request$say2__RDY_internal;
    wire request$say__RDY_internal;
    reg[31:0] busy;
    reg[31:0] meth_temp;
    reg[31:0] v_temp;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    assign delay_rule__RDY_internal = ((busy != 0) & (busy_delay == 0)) != 0;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = respond_rule__ENA_internal;
    assign request$say$meth = request$say$meth;
    assign request$say$v = request$say$v;
    assign request$say2$meth = request$say2$meth;
    assign request$say2$v = request$say2$v;
    assign request$say2$v2 = request$say2$v2;
    assign request$say2__ENA = request$say2__ENA_internal;
    assign request$say2__RDY_internal = request$say2__RDY;
    assign request$say__ENA = request$say__ENA_internal;
    assign request$say__RDY_internal = request$say__RDY;
    assign respond_rule__RDY_internal = (busy_delay != 0) & indication$heard__RDY;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say__RDY = request$say__RDY_internal;

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
        if (delay_rule__ENA) begin
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
        end; // End of delay_rule__ENA
        if (respond_rule__ENA) begin
            busy_delay <= 0;
        end; // End of respond_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY);
    wire pipe$enq__RDY_internal;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = input_rule__ENA_internal;
    assign input_rule__RDY_internal = (busy_delay != 0) & indication$heard__RDY;
    assign pipe$enq$v = pipe$enq$v;
    assign pipe$enq__ENA = pipe$enq__ENA_internal;
    assign pipe$enq__RDY_internal = pipe$enq__RDY;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (input_rule__ENA) begin
            busy_delay <= 0;
        end; // End of input_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoIndicationOutput (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY);
    wire indication$heard__RDY_internal;
    reg[95:0] ind0;
    reg[95:0] ind1;
    reg[31:0] ind_busy;
    reg[31:0] even;
    assign indication$heard$meth = indication$heard$meth;
    assign indication$heard$v = indication$heard$v;
    assign indication$heard__ENA = indication$heard__ENA_internal;
    assign indication$heard__RDY_internal = indication$heard__RDY;
    assign output_rulee__RDY_internal = (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
    assign output_ruleo__RDY_internal = (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
    assign pipe$enq$v = output_rulee__ENA_internal ? ind0 : ind1;
    assign pipe$enq__ENA = output_rulee__ENA_internal || output_ruleo__ENA_internal;
    assign indication$heard__RDY = indication$heard__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        ind0 <= 0;
        ind1 <= 0;
        ind_busy <= 0;
        even <= 0;
      end // nRST
      else begin
        if (output_rulee__ENA) begin
            ind_busy <= 0;
        end; // End of output_rulee__ENA
        if (output_ruleo__ENA) begin
            ind_busy <= 0;
        end; // End of output_ruleo__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [191:0]pipe$enq$v,
    output pipe$enq__RDY);
    wire pipe$enq__RDY_internal;
    assign pipe$enq$v = pipe$enq$v;
    assign pipe$enq__ENA = pipe$enq__ENA_internal;
    assign pipe$enq__RDY_internal = pipe$enq__RDY;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
endmodule 

module l_module_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    wire request$say2__RDY_internal;
    wire request$say__RDY_internal;
    assign request$say$meth = request$say$meth;
    assign request$say$v = request$say$v;
    assign request$say2$meth = request$say2$meth;
    assign request$say2$v = request$say2$v;
    assign request$say2$v2 = request$say2$v2;
    assign request$say2__ENA = request$say2__ENA_internal;
    assign request$say2__RDY_internal = request$say2__RDY;
    assign request$say__ENA = request$say__ENA_internal;
    assign request$say__RDY_internal = request$say__RDY;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say__RDY = request$say__RDY_internal;
endmodule 

module l_module_OC_Connect (
    input CLK,
    input nRST);
    wire [31:0]lEIO$indication$heard$meth;
    wire [31:0]lEIO$indication$heard$v;
    l_module_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEcho$indication$heard__ENA,
        lEIO$indication$heard$meth,
        lEIO$indication$heard$v,
        lEcho$indication$heard__RDY);
    wire [191:0]lERI$pipe$enq$v;
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERO_test$pipe$enq__ENA,
        lERI$pipe$enq$v,
        lERO_test$pipe$enq__RDY);
    wire [31:0]lEcho$request$say2$meth;
    wire [31:0]lEcho$request$say2$v;
    wire [31:0]lEcho$request$say2$v2;
    wire [31:0]lEcho$request$say$meth;
    wire [31:0]lEcho$request$say$v;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say2__ENA,
        lEcho$request$say2$meth,
        lEcho$request$say2$v,
        lEcho$request$say2$v2,
        lERI$request$say2__RDY,
        lERI$request$say__ENA,
        lEcho$request$say$meth,
        lEcho$request$say$v,
        lERI$request$say__RDY);
    wire lERO_test$request$say2__ENA;
    wire [31:0]lERO_test$request$say2$meth;
    wire [31:0]lERO_test$request$say2$v;
    wire [31:0]lERO_test$request$say2$v2;
    wire lERO_test$request$say2__RDY;
    wire lERO_test$request$say__ENA;
    wire [31:0]lERO_test$request$say$meth;
    wire [31:0]lERO_test$request$say$v;
    wire lERO_test$request$say__RDY;
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        lERO_test$request$say2__ENA,
        lERO_test$request$say2$meth,
        lERO_test$request$say2$v,
        lERO_test$request$say2$v2,
        lERO_test$request$say2__RDY,
        lERO_test$request$say__ENA,
        lERO_test$request$say$meth,
        lERO_test$request$say$v,
        lERO_test$request$say__RDY);
    wire [95:0]lEII_test$pipe$enq$v;
    l_module_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEIO$pipe$enq__ENA,
        lEII_test$pipe$enq$v,
        lEIO$pipe$enq__RDY);
endmodule 

