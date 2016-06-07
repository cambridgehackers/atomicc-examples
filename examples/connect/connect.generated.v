`include "connect.generated.vh"

module l_class_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say_meth,
    input [31:0]request$say_v,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq_v,
    input pipe$enq__RDY);
    wire request$say__RDY_internal;
    wire request$say__ENA_internal = request$say__ENA && request$say__RDY_internal;
    assign ind$tag = 1;
    assign pipe$enq__ENA = request$say__ENA_internal;
    assign pipe$enq_v = ind;
    assign request$say__RDY = request$say__RDY_internal;
    assign request$say__RDY_internal = pipe$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA_internal) begin
            ind$data$say$meth <= say_meth;
            ind$data$say$v <= say_v;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq_v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say_meth,
    output [31:0]request$say_v,
    input request$say__RDY);
    wire pipe$enq__RDY_internal;
    wire pipe$enq__ENA_internal = pipe$enq__ENA && pipe$enq__RDY_internal;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = request$say__RDY;
    assign request$say__ENA = pipe$enq__ENA_internal & enq_v$tag == 1;
    assign request$say_meth = enq_v$data$say$meth;
    assign request$say_v = enq_v$data$say$v;
endmodule 

module l_class_OC_EchoIndicationOutput (
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
    assign ind$tag = 1;
    assign indication$heard__RDY = indication$heard__RDY_internal;
    assign indication$heard__RDY_internal = pipe$enq__RDY;
    assign pipe$enq__ENA = indication$heard__ENA_internal;
    assign pipe$enq_v = ind;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$heard__ENA_internal) begin
            ind$data$heard$meth <= heard_meth;
            ind$data$heard$v <= heard_v;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_EchoIndicationInput (
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
    assign indication$heard__ENA = pipe$enq__ENA_internal & enq_v$tag == 1;
    assign indication$heard_meth = enq_v$data$heard$meth;
    assign indication$heard_v = enq_v$data$heard$v;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = indication$heard__RDY;
endmodule 

module l_class_OC_Echo (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say_meth,
    input [31:0]request$say_v,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard_meth,
    output [31:0]indication$heard_v,
    input indication$heard__RDY);
    wire request$say__RDY_internal;
    wire request$say__ENA_internal = request$say__ENA && request$say__RDY_internal;
    assign indication$heard__ENA = request$say__ENA_internal;
    assign indication$heard_meth = say_meth;
    assign indication$heard_v = say_v;
    assign request$say__RDY = request$say__RDY_internal;
    assign request$say__RDY_internal = indication$heard__RDY;
endmodule 

module l_class_OC_foo (
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

module l_class_OC_Connect (
    input CLK,
    input nRST);
    wire lEIO$indication$heard__ENA;
    wire [31:0]lEIO$indication$heard_meth;
    wire [31:0]lEIO$indication$heard_v;
    wire lEIO$indication$heard__RDY;
    l_class_OC_EchoIndicationOutput lEIO (
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
    wire [95:0]lERI$pipe$enq_v;
    wire lERI$pipe$enq__RDY;
    l_class_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERI$pipe$enq__ENA,
        lERI$pipe$enq_v,
        lERI$pipe$enq__RDY,
        lERI$request$say__ENA,
        lERI$request$say_meth,
        lERI$request$say_v,
        lERI$request$say__RDY);
    wire lEcho$request$say__ENA;
    wire [31:0]lEcho$request$say_meth;
    wire [31:0]lEcho$request$say_v;
    wire lEcho$request$say__RDY;
    l_class_OC_Echo lEcho (
        CLK,
        nRST,
        lEcho$request$say__ENA,
        lEcho$request$say_meth,
        lEcho$request$say_v,
        lEcho$request$say__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard_meth,
        lEcho$indication$heard_v,
        lEcho$indication$heard__RDY);
    wire lERO_test$request$say__ENA;
    wire [31:0]lERO_test$request$say_meth;
    wire [31:0]lERO_test$request$say_v;
    wire lERO_test$request$say__RDY;
    l_class_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        lERO_test$request$say__ENA,
        lERO_test$request$say_meth,
        lERO_test$request$say_v,
        lERO_test$request$say__RDY,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq_v,
        lERO_test$pipe$enq__RDY);
    wire lEII_test$pipe$enq__ENA;
    wire [95:0]lEII_test$pipe$enq_v;
    wire lEII_test$pipe$enq__RDY;
    l_class_OC_EchoIndicationInput lEII_test (
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

