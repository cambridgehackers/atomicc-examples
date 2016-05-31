
`include "l_class_OC_EchoRequestInput.vh"

module l_class_OC_EchoRequestInput (
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
    input request$say__RDY,
    input [`l_class_OC_EchoRequestInput_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_EchoRequestInput_RULE_COUNT:0]rule_ready);
    wire pipe$enq__RDY_internal;
    wire pipe$enq__ENA_internal = pipe$enq__ENA && pipe$enq__RDY_internal;
    assign pipe$enq__RDY = pipe$enq__RDY_internal;
    assign pipe$enq__RDY_internal = request$say__RDY & request$say2__RDY;
    assign request$say2__ENA = pipe$enq__ENA_internal & enq_v$tag == 2;
    assign request$say2_meth = enq_v$data$say2$meth;
    assign request$say2_v = enq_v$data$say2$v;
    assign request$say2_v2 = enq_v$data$say2$v2;
    assign request$say__ENA = pipe$enq__ENA_internal & enq_v$tag == 1;
    assign request$say_meth = enq_v$data$say$meth;
    assign request$say_v = enq_v$data$say$v;
endmodule 

