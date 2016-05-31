
`include "l_class_OC_Connect.vh"

module l_class_OC_Connect (
    input CLK,
    input nRST,
    input [`l_class_OC_Connect_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_Connect_RULE_COUNT:0]rule_ready);
    wire lEIO$indication$heard__ENA;
    wire [31:0]lEIO$indication$heard_meth;
    wire [31:0]lEIO$indication$heard_v;
    wire lEIO$indication$heard__RDY;
    wire lEIO$output_rulee__ENA;
    wire lEIO$output_rulee__RDY;
    wire lEIO$output_ruleo__ENA;
    wire lEIO$output_ruleo__RDY;
    l_class_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEIO$indication$heard__ENA,
        lEIO$indication$heard_meth,
        lEIO$indication$heard_v,
        lEIO$indication$heard__RDY,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq_v,
        lEIO$pipe$enq__RDY,
        rule_enable[0:`l_class_OC_EchoIndicationOutput_RULE_COUNT],
        rule_ready[0:`l_class_OC_EchoIndicationOutput_RULE_COUNT]);
    wire lERI$pipe$enq__ENA;
    wire [191:0]lERI$pipe$enq_v;
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
        lERI$request$say2__ENA,
        lERI$request$say2_meth,
        lERI$request$say2_v,
        lERI$request$say2_v2,
        lERI$request$say2__RDY,
        lERI$request$say__RDY,
        rule_enable[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT:`l_class_OC_EchoRequestInput_RULE_COUNT],
        rule_ready[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT:`l_class_OC_EchoRequestInput_RULE_COUNT]);
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
    l_class_OC_Echo lEcho (
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
        lEcho$indication$heard__RDY,
        rule_enable[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT:`l_class_OC_Echo_RULE_COUNT],
        rule_ready[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT:`l_class_OC_Echo_RULE_COUNT]);
    wire lERO_test$request$say__ENA;
    wire [31:0]lERO_test$request$say_meth;
    wire [31:0]lERO_test$request$say_v;
    wire lERO_test$request$say2__ENA;
    wire [31:0]lERO_test$request$say2_meth;
    wire [31:0]lERO_test$request$say2_v;
    wire [31:0]lERO_test$request$say2_v2;
    wire lERO_test$request$say2__RDY;
    wire lERO_test$request$say__RDY;
    l_class_OC_EchoRequestOutput lERO_test (
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
        lERO_test$pipe$enq__RDY,
        rule_enable[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT:`l_class_OC_EchoRequestOutput_RULE_COUNT],
        rule_ready[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT:`l_class_OC_EchoRequestOutput_RULE_COUNT]);
    wire lEII_test$pipe$enq__ENA;
    wire [95:0]lEII_test$pipe$enq_v;
    wire lEII_test$pipe$enq__RDY;
    wire lEII_test$input_rule__ENA;
    wire lEII_test$input_rule__RDY;
    l_class_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEII_test$pipe$enq__ENA,
        lEII_test$pipe$enq_v,
        lEII_test$pipe$enq__RDY,
        lEII_test$indication$heard__ENA,
        lEII_test$indication$heard_meth,
        lEII_test$indication$heard_v,
        lEII_test$indication$heard__RDY,
        rule_enable[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT + `l_class_OC_EchoRequestOutput_RULE_COUNT:`l_class_OC_EchoIndicationInput_RULE_COUNT],
        rule_ready[0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT + `l_class_OC_EchoRequestOutput_RULE_COUNT:`l_class_OC_EchoIndicationInput_RULE_COUNT]);
endmodule 

