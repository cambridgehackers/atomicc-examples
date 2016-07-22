`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; l_class_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_class_OC_PipeIn;
//METAINVOKE; request$say; :pipe$enq;
//METAEXCLUSIVE; request$say; request$say2
//METAINVOKE; request$say2; :pipe$enq;
//METAGUARD; request$say2; pipe$enq__RDY;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; l_class_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq; pipe$enq_v$tag == 1:request$say;pipe$enq_v$tag == 2:request$say2;
//METAGUARD; pipe$enq; request$say__RDY & request$say2__RDY;
//METASTART; l_class_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_class_OC_PipeIn_OC_0;
//METAEXCLUSIVE; indication$heard; output_rulee; output_ruleo
//METAGUARD; indication$heard; (ind_busy != 0) ^ 1;
//METAINVOKE; output_rulee; :pipe$enq;
//METAEXCLUSIVE; output_rulee; output_ruleo
//METAGUARD; output_rulee; (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
//METAINVOKE; output_ruleo; :pipe$enq;
//METAGUARD; output_ruleo; (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METASTART; l_class_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; pipe$enq; input_rule
//METAGUARD; pipe$enq; (busy_delay != 0) ^ 1;
//METAINVOKE; input_rule; :indication$heard;
//METABEFORE; input_rule; :pipe$enq
//METAGUARD; input_rule; (busy_delay != 0) & indication$heard__RDY;
//METARULES; input_rule
//METASTART; l_class_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
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
//METACONNECT; lERI$request$say2; lEcho$request$say2
`endif
