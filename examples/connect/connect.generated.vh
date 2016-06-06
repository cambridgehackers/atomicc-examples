`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

`define l_class_OC_EchoRequestOutput_RULE_COUNT (0)

//METAINVOKE; request$say; :pipe$enq;
//METAGUARD; request$say; pipe$enq__RDY;
//METAEXTERNAL; pipe; l_class_OC_PipeIn;
`define l_class_OC_EchoRequestInput_RULE_COUNT (0)

//METAINVOKE; pipe$enq; enq_v$tag == 1:request$say;
//METAGUARD; pipe$enq; request$say__RDY;
//METAEXTERNAL; request; l_class_OC_EchoRequest;
`define l_class_OC_EchoIndicationOutput_RULE_COUNT (0)

//METAINVOKE; indication$heard; :pipe$enq;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METAEXTERNAL; pipe; l_class_OC_PipeIn_OC_0;
`define l_class_OC_EchoIndicationInput_RULE_COUNT (0)

//METAINVOKE; pipe$enq; enq_v$tag == 1:indication$heard;
//METAGUARD; pipe$enq; indication$heard__RDY;
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
`define l_class_OC_Echo_RULE_COUNT (0)

//METAINVOKE; request$say; :indication$heard;
//METAGUARD; request$say; indication$heard__RDY;
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
`define l_class_OC_foo_RULE_COUNT (0)

//METAGUARD; indication$heard; 1;
`define l_class_OC_Connect_RULE_COUNT (0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT + `l_class_OC_EchoRequestOutput_RULE_COUNT + `l_class_OC_EchoIndicationInput_RULE_COUNT)

//METACONNECT; lERO_test$pipe$enq; lERI$pipe$enq
//METACONNECT; lEcho$indication$heard; lEIO$indication$heard
//METACONNECT; lEIO$pipe$enq; lEII_test$pipe$enq
//METACONNECT; lERI$request$say; lEcho$request$say
//METAINTERNAL; lEIO; l_class_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_class_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_class_OC_Echo;
//METAINTERNAL; lERO_test; l_class_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_class_OC_EchoIndicationInput;
`endif
