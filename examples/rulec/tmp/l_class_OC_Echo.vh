`ifndef __l_class_OC_Echo_VH__
`define __l_class_OC_Echo_VH__

`define l_class_OC_Echo_RULE_COUNT (2)

//METAEXCLUSIVE; delay_rule; request$say; request$say2; respond_rule
//METABEFORE; delay_rule; :request$say; :request$say2
//METAGUARD; delay_rule; ((busy != 0) & (busy_delay == 0)) != 0;
//METAINVOKE; respond_rule; :indication$heard;
//METABEFORE; respond_rule; :delay_rule
//METAGUARD; respond_rule; (busy_delay != 0) & indication$heard__RDY;
//METAEXCLUSIVE; request$say; request$say2
//METAGUARD; request$say2; (busy != 0) ^ 1;
//METAGUARD; request$say; (busy != 0) ^ 1;
//METARULES; delay_rule; respond_rule
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
`endif
