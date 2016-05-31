`ifndef __l_class_OC_EchoIndicationOutput_VH__
`define __l_class_OC_EchoIndicationOutput_VH__

`include "l_struct_OC_EchoIndication_data.vh"
`define l_class_OC_EchoIndicationOutput_RULE_COUNT (2)

//METAEXCLUSIVE; indication$heard; output_rulee; output_ruleo
//METAGUARD; indication$heard; (ind_busy != 0) ^ 1;
//METAINVOKE; output_rulee; :pipe$enq;
//METAEXCLUSIVE; output_rulee; output_ruleo
//METAGUARD; output_rulee; (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
//METAINVOKE; output_ruleo; :pipe$enq;
//METAGUARD; output_ruleo; (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METAEXTERNAL; pipe; l_class_OC_PipeIn_OC_0;
`endif
