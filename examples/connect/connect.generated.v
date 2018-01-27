`include "connect.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    assign indication$heard$meth = request$say$meth;
    assign indication$heard$v = request$say$v;
    assign indication$heard__ENA = request$say__ENA;
    assign request$say__RDY = indication$heard__RDY;
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
    assign indication$heard$meth = v_2e_addr$data$heard$meth;
    assign indication$heard$v = v_2e_addr$data$heard$v;
    assign indication$heard__ENA = pipe$enq__ENA & v_2e_addrfoosuff$tag == 1;
    assign pipe$enq__RDY = indication$heard__RDY | ((v_2e_addrfoosufffoosuff$tag == 1) ^ 1);
    assign v_2e_addr = pipe$enq$v;
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
    assign ind$tag = 1;
    assign indication$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = ind;
    assign pipe$enq__ENA = indication$heard__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$heard__ENA) begin
            ind$data$heard$meth <= indication$heard$meth;
            ind$data$heard$v <= indication$heard$v;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    input request$say__RDY);
    assign pipe$enq__RDY = request$say__RDY | ((v_2e_addrfoosufffoosuff$tag == 1) ^ 1);
    assign request$say$meth = v_2e_addr$data$say$meth;
    assign request$say$v = v_2e_addr$data$say$v;
    assign request$say__ENA = pipe$enq__ENA & v_2e_addrfoosuff$tag == 1;
    assign v_2e_addr = pipe$enq$v;
endmodule 

module l_module_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign ind$tag = 1;
    assign pipe$enq$v = ind;
    assign pipe$enq__ENA = request$say__ENA;
    assign request$say__RDY = pipe$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA) begin
            ind$data$say$meth <= request$say$meth;
            ind$data$say$v <= request$say$v;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Connect (
    input CLK,
    input nRST,
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
    wire [31:0]lEIO$indication$heard$meth;
    wire [31:0]lEIO$indication$heard$v;
    l_module_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEcho$indication$heard__ENA,
        lEIO$indication$heard$meth,
        lEIO$indication$heard$v,
        lEcho$indication$heard__RDY,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq$v,
        lEIO$pipe$enq__RDY);
    wire [95:0]lERI$pipe$enq$v;
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERO_test$pipe$enq__ENA,
        lERI$pipe$enq$v,
        lERO_test$pipe$enq__RDY,
        lERI$request$say__ENA,
        lERI$request$say$meth,
        lERI$request$say$v,
        lERI$request$say__RDY);
    wire [31:0]lEcho$request$say$meth;
    wire [31:0]lEcho$request$say$v;
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say__ENA,
        lEcho$request$say$meth,
        lEcho$request$say$v,
        lERI$request$say__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard$meth,
        lEcho$indication$heard$v,
        lEcho$indication$heard__RDY);
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        request$say__ENA,
        request$say$meth,
        request$say$v,
        request$say__RDY,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq$v,
        lERO_test$pipe$enq__RDY);
    wire [95:0]lEII_test$pipe$enq$v;
    l_module_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEIO$pipe$enq__ENA,
        lEII_test$pipe$enq$v,
        lEIO$pipe$enq__RDY,
        lEII_test$indication$heard__ENA,
        lEII_test$indication$heard$meth,
        lEII_test$indication$heard$v,
        lEII_test$indication$heard__RDY);
    assign lEII_test$indication$heard__ENA = indication$heard__ENA;
    assign lEII_test$indication$heard__RDY = indication$heard__RDY;
endmodule 

