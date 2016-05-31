`ifndef __l_class_OC_EchoRequestInput_VH__
`define __l_class_OC_EchoRequestInput_VH__

`define l_class_OC_EchoRequestInput_RULE_COUNT (0)

//METAINVOKE; pipe$enq; enq_v$tag == 1:request$say;enq_v$tag == 2:request$say2;
//METAGUARD; pipe$enq; request$say__RDY & request$say2__RDY;
//METAEXTERNAL; request; l_class_OC_EchoRequest;
`endif
