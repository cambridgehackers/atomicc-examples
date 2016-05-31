`ifndef __l_class_OC_EchoIndicationInput_VH__
`define __l_class_OC_EchoIndicationInput_VH__

`define l_class_OC_EchoIndicationInput_RULE_COUNT (1)

//METAEXCLUSIVE; pipe$enq; input_rule
//METAGUARD; pipe$enq; (busy_delay != 0) ^ 1;
//METAINVOKE; input_rule; :indication$heard;
//METABEFORE; input_rule; :pipe$enq
//METAGUARD; input_rule; (busy_delay != 0) & indication$heard__RDY;
//METARULES; input_rule
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
`endif
