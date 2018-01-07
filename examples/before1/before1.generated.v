`include "before1.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    input x2y__ENA,
    output x2y__RDY,
    input y2x__ENA,
    output y2x__RDY,
    input y2xnull__ENA,
    output y2xnull__RDY);
    wire request$say2__RDY_internal;
    wire request$say__RDY_internal;
    wire x2y__RDY_internal;
    wire y2x__RDY_internal;
    wire y2xnull__RDY_internal;
    reg[31:0] busy;
    reg[31:0] meth_temp;
    reg[31:0] v_temp;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    reg[31:0] x;
    reg[31:0] y;
    assign delay_rule__RDY_internal = ((busy != 0) & (busy_delay == 0)) != 0;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = respond_rule__ENA_internal;
    assign request$say2__RDY_internal = (busy != 0) ^ 1;
    assign request$say__RDY_internal = (busy != 0) ^ 1;
    assign respond_rule__RDY_internal = (busy_delay != 0) & indication$heard__RDY;
    assign x2y__RDY_internal = 1;
    assign y2x__RDY_internal = 1;
    assign y2xnull__RDY_internal = 1;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say__RDY = request$say__RDY_internal;
    assign x2y__RDY = x2y__RDY_internal;
    assign y2x__RDY = y2x__RDY_internal;
    assign y2xnull__RDY = y2xnull__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        meth_temp <= 0;
        v_temp <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
        x <= 0;
        y <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA) begin
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
        end; // End of delay_rule__ENA
        if (request$say2__ENA) begin
            meth_temp <= request$say2$meth;
            v_temp <= request$say2$v;
            busy <= 1;
        end; // End of request$say2__ENA
        if (request$say__ENA) begin
            meth_temp <= request$say$meth;
            v_temp <= request$say$v;
            busy <= 1;
        end; // End of request$say__ENA
        if (respond_rule__ENA) begin
            busy_delay <= 0;
        end; // End of respond_rule__ENA
        if (x2y__ENA) begin
            y <= x;
        end; // End of x2y__ENA
        if (y2x__ENA) begin
            x <= y;
        end; // End of y2x__ENA
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
    assign pipe$enq__RDY_internal = (busy_delay != 0) ^ 1;
    assign v_2e_addr_2e_i = pipe$enq$v;
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
        if (pipe$enq__ENA) begin
            if (v_2e_addr_2e_i$tag == 1)
            meth_delay <= v_2e_addr_2e_i$data$heard$meth;
            if (v_2e_addr_2e_i$tag == 1)
            v_delay <= v_2e_addr_2e_i$data$heard$v;
            if (v_2e_addr_2e_i$tag == 1)
            busy_delay <= 1;
        end; // End of pipe$enq__ENA
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
    assign indication$heard__RDY_internal = (ind_busy != 0) ^ 1;
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
        if (indication$heard__ENA) begin
            if (even != 0)
            ind1$tag <= 1;
            if (even != 0)
            ind1$data$heard$meth <= indication$heard$meth;
            if (even != 0)
            ind1$data$heard$v <= indication$heard$v;
            if ((even != 0) ^ 1)
            ind0$tag <= 1;
            if ((even != 0) ^ 1)
            ind0$data$heard$meth <= indication$heard$meth;
            if ((even != 0) ^ 1)
            ind0$data$heard$v <= indication$heard$v;
            ind_busy <= 1;
            even <= (even != 0) ^ 1;
        end; // End of indication$heard__ENA
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
    assign pipe$enq__RDY_internal = (request$say__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1)) & (request$say2__RDY | ((v_2e_addr_2e_ifoosuff2foosuff$tag == 2) ^ 1));
    assign request$say$meth = v_2e_addr_2e_i$data$say$meth;
    assign request$say$v = v_2e_addr_2e_i$data$say$v;
    assign request$say2$meth = v_2e_addr_2e_i$data$say2$meth;
    assign request$say2$v = v_2e_addr_2e_i$data$say2$v;
    assign request$say2__ENA = pipe$enq__ENA_internal & v_2e_addr_2e_ifoosuff2$tag == 2;
    assign request$say__ENA = pipe$enq__ENA_internal & v_2e_addr_2e_ifoosuff$tag == 1;
    assign v_2e_addr_2e_i = pipe$enq$v;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
endmodule 

module l_module_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    wire request$say2__RDY_internal;
    wire request$say__RDY_internal;
    assign ind_2e_i$tag = 1;
    assign pipe$enq$v = request$say2__ENA_internal ? ind_2e_i : ind_2e_i;
    assign pipe$enq__ENA = request$say2__ENA_internal || request$say__ENA_internal;
    assign request$say2__RDY_internal = pipe$enq__RDY;
    assign request$say__RDY_internal = pipe$enq__RDY;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say__RDY = request$say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say2__ENA) begin
            ind_2e_i$data$say2$meth <= request$say2$meth;
            ind_2e_i$data$say2$v <= request$say2$v;
        end; // End of request$say2__ENA
        if (request$say__ENA) begin
            ind_2e_i$data$say$meth <= request$say$meth;
            ind_2e_i$data$say$v <= request$say$v;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
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
    wire [31:0]lEcho$request$say$meth;
    wire [31:0]lEcho$request$say$v;
    wire lEcho$x2y__RDY;
    wire lEcho$y2x__RDY;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say2__ENA,
        lEcho$request$say2$meth,
        lEcho$request$say2$v,
        lERI$request$say2__RDY,
        lERI$request$say__ENA,
        lEcho$request$say$meth,
        lEcho$request$say$v,
        lERI$request$say__RDY,
        swap_rule__ENA_internal,
        lEcho$x2y__RDY,
        swap_rule__ENA_internal,
        lEcho$y2x__RDY,
        swap2_rule__ENA_internal,
        swap2_rule__RDY_internal);
    wire lERO_test$request$say2__ENA;
    wire [31:0]lERO_test$request$say2$meth;
    wire [31:0]lERO_test$request$say2$v;
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
    assign swap_rule__RDY_internal = lEcho$x2y__RDY & lEcho$y2x__RDY;
endmodule 

