
`include "l_class_OC_foo.vh"

module l_class_OC_foo (
    input CLK,
    input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard_meth,
    input [31:0]indication$heard_v,
    output indication$heard__RDY,
    input [`l_class_OC_foo_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_foo_RULE_COUNT:0]rule_ready);
    wire indication$heard__RDY_internal;
    wire indication$heard__ENA_internal = indication$heard__ENA && indication$heard__RDY_internal;
    assign indication$heard__RDY = indication$heard__RDY_internal;
    assign indication$heard__RDY_internal = 1;
endmodule 

