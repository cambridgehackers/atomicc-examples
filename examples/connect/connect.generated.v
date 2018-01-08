`include "connect.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    wire request$say__RDY_internal;
    assign indication$heard$meth = request$say$meth;
    assign indication$heard$v = request$say$v;
    assign indication$heard__ENA = request$say__ENA_internal;
    assign request$say__RDY_internal = indication$heard__RDY;
    assign request$say__RDY = request$say__RDY_internal;
endmodule 

module l_module_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY);
    wire pipe$enq__RDY_internal;
    assign indication$heard$meth = v_2e_addr_2e_i$data$heard$meth;
    assign indication$heard$v = v_2e_addr_2e_i$data$heard$v;
    assign indication$heard__ENA = pipe$enq__ENA_internal & v_2e_addr_2e_i$tag == 1;
    assign pipe$enq__RDY_internal = indication$heard__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1);
    assign v_2e_addr_2e_i = pipe$enq$v;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
endmodule 

module l_module_OC_EchoIndicationOutput (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY);
    wire indication$heard__RDY_internal;
    assign ind_2e_i$tag = 1;
    assign indication$heard__RDY_internal = pipe$enq__RDY;
    assign pipe$enq$v = ind_2e_i;
    assign pipe$enq__ENA = indication$heard__ENA_internal;
    assign indication$heard__RDY = indication$heard__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$heard__ENA) begin
            ind_2e_i$data$heard$meth <= indication$heard$meth;
            ind_2e_i$data$heard$v <= indication$heard$v;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY);
    wire pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = request$say__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1);
    assign request$say$meth = v_2e_addr_2e_i$data$say$meth;
    assign request$say$v = v_2e_addr_2e_i$data$say$v;
    assign request$say__ENA = pipe$enq__ENA_internal & v_2e_addr_2e_i$tag == 1;
    assign v_2e_addr_2e_i = pipe$enq$v;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
endmodule 

module l_module_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    wire request$say__RDY_internal;
    assign ind_2e_i$tag = 1;
    assign pipe$enq$v = ind_2e_i;
    assign pipe$enq__ENA = request$say__ENA_internal;
    assign request$say__RDY_internal = pipe$enq__RDY;
    assign request$say__RDY = request$say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
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
    wire [95:0]lERI$pipe$enq$v;
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERO_test$pipe$enq__ENA,
        lERI$pipe$enq$v,
        lERO_test$pipe$enq__RDY);
    wire [31:0]lEcho$request$say$meth;
    wire [31:0]lEcho$request$say$v;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say__ENA,
        lEcho$request$say$meth,
        lEcho$request$say$v,
        lERI$request$say__RDY);
    wire lERO_test$request$say__ENA;
    wire [31:0]lERO_test$request$say$meth;
    wire [31:0]lERO_test$request$say$v;
    wire lERO_test$request$say__RDY;
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
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

