`ifndef __before1_GENERATED__VH__
`define __before1_GENERATED__VH__

//METASTART; l_class_OC_EchoRequestOutput
//METAINVOKE; request$say; :pipe$enq;
//METAEXCLUSIVE; request$say; request$say2
//METAINVOKE; request$say2; :pipe$enq;
//METAGUARD; request$say2; pipe$enq__RDY;
//METAGUARD; request$say; pipe$enq__RDY;
//METAEXTERNAL; pipe; l_class_OC_PipeIn;
//METASTART; l_class_OC_EchoRequestInput
//METAINVOKE; pipe$enq; enq_v$tag == 1:request$say;enq_v$tag == 2:request$say2;
//METAGUARD; pipe$enq; request$say__RDY & request$say2__RDY;
//METAEXTERNAL; request; l_class_OC_EchoRequest;
//METASTART; l_class_OC_EchoIndicationOutput
//METAEXCLUSIVE; indication$heard; output_rulee; output_ruleo
//METAGUARD; indication$heard; (ind_busy != 0) ^ 1;
//METAINVOKE; output_rulee; :pipe$enq;
//METAEXCLUSIVE; output_rulee; output_ruleo
//METAGUARD; output_rulee; (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
//METAINVOKE; output_ruleo; :pipe$enq;
//METAGUARD; output_ruleo; (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METAEXTERNAL; pipe; l_class_OC_PipeIn_OC_0;
//METASTART; l_class_OC_EchoIndicationInput
//METAEXCLUSIVE; pipe$enq; input_rule
//METAGUARD; pipe$enq; (busy_delay != 0) ^ 1;
//METAINVOKE; input_rule; :indication$heard;
//METABEFORE; input_rule; :pipe$enq
//METAGUARD; input_rule; (busy_delay != 0) & indication$heard__RDY;
//METARULES; input_rule
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
//METASTART; l_class_OC_Echo
//METAEXCLUSIVE; delay_rule; request$say; request$say2; respond_rule
//METABEFORE; delay_rule; :request$say; :request$say2
//METAGUARD; delay_rule; ((busy != 0) & (busy_delay == 0)) != 0;
//METAINVOKE; respond_rule; :indication$heard;
//METABEFORE; respond_rule; :delay_rule
//METAGUARD; respond_rule; (busy_delay != 0) & indication$heard__RDY;
//METAEXCLUSIVE; request$say; request$say2
//METAGUARD; request$say2; (busy != 0) ^ 1;
//METAGUARD; request$say; (busy != 0) ^ 1;
//METABEFORE; x2y; :y2x
//METAGUARD; x2y; 1;
//METABEFORE; y2x; :x2y
//METAGUARD; y2x; 1;
//METAGUARD; y2xnull; 1;
//METARULES; delay_rule; respond_rule
//METAEXTERNAL; indication; l_class_OC_EchoIndication;
//METASTART; l_class_OC_foo
//METAGUARD; indication$heard; 1;
//METASTART; l_class_OC_Connect
//METAINVOKE; swap2_rule; :lEcho$y2xnull;
//METAGUARD; swap2_rule; lEcho$y2xnull__RDY;
//METAINVOKE; swap_rule; :lEcho$x2y;:lEcho$y2x;
//METAGUARD; swap_rule; lEcho$x2y__RDY & lEcho$y2x__RDY;
//METARULES; swap2_rule; swap_rule
//METACONNECT; lERO_test$pipe$enq; lERI$pipe$enq
//METACONNECT; lEcho$indication$heard; lEIO$indication$heard
//METACONNECT; lEIO$pipe$enq; lEII_test$pipe$enq
//METACONNECT; lERI$request$say; lEcho$request$say
//METACONNECT; lERI$request$say2; lEcho$request$say2
//METAINTERNAL; lEIO; l_class_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_class_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_class_OC_Echo;
//METAINTERNAL; lERO_test; l_class_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_class_OC_EchoIndicationInput;
`endif
