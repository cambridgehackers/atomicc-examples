`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

//METASTART; l_class_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_class_OC_PipeIn;
//METAINVOKE; request$say; :pipe$enq;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; l_class_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq; pipe$enq_v$tag == 1:request$say;
//METAGUARD; pipe$enq; request$say__RDY;
//METASTART; l_class_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_class_OC_PipeIn_OC_0;
//METAINVOKE; indication$heard; :pipe$enq;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; l_class_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
//METAINVOKE; pipe$enq; pipe$enq_v$tag == 1:indication$heard;
//METAGUARD; pipe$enq; indication$heard__RDY;
//METASTART; l_class_OC_Echo
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
//METAINVOKE; request$say; :indication$heard;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; l_class_OC_foo
//METAGUARD; indication$heard; 1;
//METASTART; l_class_OC_Connect
//METAINTERNAL; lEIO; l_class_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_class_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_class_OC_Echo;
//METAINTERNAL; lERO_test; l_class_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_class_OC_EchoIndicationInput;
//METACONNECT; lERO_test$pipe$enq; lERI$pipe$enq
//METACONNECT; lEcho$indication$heard; lEIO$indication$heard
//METACONNECT; lEIO$pipe$enq; lEII_test$pipe$enq
//METACONNECT; lERI$request$say; lEcho$request$say
`endif
