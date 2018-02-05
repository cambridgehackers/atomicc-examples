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
    input swap$x2y__ENA,
    output swap$x2y__RDY,
    input swap$y2x__ENA,
    output swap$y2x__RDY,
    input swap$y2xnull__ENA,
    output swap$y2xnull__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    reg[31:0] busy;
    reg[31:0] meth_temp;
    reg[31:0] v_temp;
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    reg[31:0] x;
    reg[31:0] y;
    assign delay_rule__RDY = ((busy != 0) & (busy_delay == 0)) != 0;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = respond_rule__ENA;
    assign request$say2__RDY = (busy != 0) ^ 1;
    assign request$say__RDY = (busy != 0) ^ 1;
    assign respond_rule__RDY = (busy_delay != 0) & indication$heard__RDY;
    assign swap$x2y__RDY = 1;
    assign swap$y2x__RDY = 1;
    assign swap$y2xnull__RDY = 1;

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
        if (swap$x2y__ENA) begin
            y <= x;
        end; // End of swap$x2y__ENA
        if (swap$y2x__ENA) begin
            x <= y;
        end; // End of swap$y2x__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    reg[31:0] busy_delay;
    reg[31:0] meth_delay;
    reg[31:0] v_delay;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = input_rule__ENA;
    assign input_rule__RDY = (busy_delay != 0) & indication$heard__RDY;
    assign pipe$enq__RDY = (busy_delay != 0) ^ 1;
    // Extra assigments, not to output wires
    assign pipe$enq__ENA$v_2e_addr = pipe$enq$v;

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
            if (pipe$enq__ENA$v_2e_addrfoosuff$tag == 1)
            meth_delay <= pipe$enq__ENA$v_2e_addr$data$heard$meth;
            if (pipe$enq__ENA$v_2e_addrfoosuff$tag == 1)
            v_delay <= pipe$enq__ENA$v_2e_addr$data$heard$v;
            if (pipe$enq__ENA$v_2e_addrfoosuff$tag == 1)
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
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    reg[95:0] ind0;
    reg[95:0] ind1;
    reg[31:0] ind_busy;
    reg[31:0] even;
    assign indication$heard__RDY = (ind_busy != 0) ^ 1;
    assign output_rulee__RDY = (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
    assign output_ruleo__RDY = (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
    assign pipe$enq$v = output_rulee__ENA ? ind0 : ind1;
    assign pipe$enq__ENA = output_rulee__ENA || output_ruleo__ENA;

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
    output pipe$enq__RDY,
    output request$say2__ENA,
    output [31:0]request$say2$meth,
    output [31:0]request$say2$v,
    input request$say2__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    input request$say__RDY);
    assign pipe$enq__RDY = (request$say__RDY | ((pipe$enq__RDY$v_2e_addrfoosufffoosuff$tag == 1) ^ 1)) & (request$say2__RDY | ((pipe$enq__RDY$v_2e_addrfoosuff13foosuff$tag == 2) ^ 1));
    assign request$say$meth = pipe$enq__ENA$v_2e_addr$data$say$meth;
    assign request$say$v = pipe$enq__ENA$v_2e_addr$data$say$v;
    assign request$say2$meth = pipe$enq__ENA$v_2e_addr$data$say2$meth;
    assign request$say2$v = pipe$enq__ENA$v_2e_addr$data$say2$v;
    assign request$say2__ENA = pipe$enq__ENA & pipe$enq__ENA$v_2e_addrfoosuff13$tag == 2;
    assign request$say__ENA = pipe$enq__ENA & pipe$enq__ENA$v_2e_addrfoosuff$tag == 1;
    // Extra assigments, not to output wires
    assign pipe$enq__ENA$v_2e_addr = pipe$enq$v;
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
    output request$say__RDY,
    output pipe$enq__ENA,
    output [191:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign pipe$enq$v = request$say2__ENA ? request$say2__ENA$ind : request$say__ENA$ind;
    assign pipe$enq__ENA = request$say2__ENA || request$say__ENA;
    assign request$say2__RDY = pipe$enq__RDY;
    assign request$say__RDY = pipe$enq__RDY;
    // Extra assigments, not to output wires
    assign request$say2__ENA$ind$tag = 2;
    assign request$say__ENA$ind$tag = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say2__ENA) begin
            request$say2__ENA$ind$data$say2$meth <= request$say2$meth;
            request$say2__ENA$ind$data$say2$v <= request$say2$v;
        end; // End of request$say2__ENA
        if (request$say__ENA) begin
            request$say__ENA$ind$data$say$meth <= request$say$meth;
            request$say__ENA$ind$data$say$v <= request$say$v;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Connect (
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
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
// software: request
// software: indication
    l_module_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard$meth,
        lEcho$indication$heard$v,
        lEcho$indication$heard__RDY,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq$v,
        lEIO$pipe$enq__RDY);
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq$v,
        lERO_test$pipe$enq__RDY,
        lERI$request$say2__ENA,
        lERI$request$say2$meth,
        lERI$request$say2$v,
        lERI$request$say2__RDY,
        lERI$request$say__ENA,
        lERI$request$say$meth,
        lERI$request$say$v,
        lERI$request$say__RDY);
    wire lEcho$swap$x2y__RDY;
    wire lEcho$swap$y2x__RDY;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say2__ENA,
        lERI$request$say2$meth,
        lERI$request$say2$v,
        lERI$request$say2__RDY,
        lERI$request$say__ENA,
        lERI$request$say$meth,
        lERI$request$say$v,
        lERI$request$say__RDY,
        swap_rule__ENA,
        lEcho$swap$x2y__RDY,
        swap_rule__ENA,
        lEcho$swap$y2x__RDY,
        swap2_rule__ENA,
        swap2_rule__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard$meth,
        lEcho$indication$heard$v,
        lEcho$indication$heard__RDY);
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        request$say2__ENA,
        request$say2$meth,
        request$say2$v,
        request$say2__RDY,
        request$say__ENA,
        request$say$meth,
        request$say$v,
        request$say__RDY,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq$v,
        lERO_test$pipe$enq__RDY);
    l_module_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq$v,
        lEIO$pipe$enq__RDY,
        lEII_test$indication$heard__ENA,
        lEII_test$indication$heard$meth,
        lEII_test$indication$heard$v,
        lEII_test$indication$heard__RDY);
    assign indication$heard$meth = lEII_test$indication$heard$meth;
    assign indication$heard$v = lEII_test$indication$heard$v;
    assign indication$heard__ENA = lEII_test$indication$heard__ENA;
    assign indication$heard__RDY = lEII_test$indication$heard__RDY;
    assign swap_rule__RDY = lEcho$swap$x2y__RDY & lEcho$swap$y2x__RDY;
endmodule 

