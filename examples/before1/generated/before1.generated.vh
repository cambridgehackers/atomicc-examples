`ifndef __before1_GENERATED__VH__
`define __before1_GENERATED__VH__

//METASTART; Connect
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METAINVOKE; RULE$swap2_rule__ENA; :lEcho$swap$y2xnull__ENA;
//METAGUARD; RULE$swap2_rule; lEcho$swap$y2xnull__RDY;
//METAINVOKE; RULE$swap_rule__ENA; :lEcho$swap$x2y__ENA;:lEcho$swap$y2x__ENA;
//METAGUARD; RULE$swap_rule; lEcho$swap$x2y__RDY & lEcho$swap$y2x__RDY;
//METAINVOKE; request$say__ENA; :lERO_test$request$say__ENA;
//METAINVOKE; request$say2__ENA; :lERO_test$request$say2__ENA;
//METAGUARD; request$say2; lERO_test$request$say2__RDY;
//METAGUARD; request$say; lERO_test$request$say__RDY;
//METARULES; RULE$swap2_rule; RULE$swap_rule
//METACONNECT; lERI$request$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$request$say2__ENA; lEcho$request$say2__ENA
//METACONNECT; lERI$request$say2__RDY; lEcho$request$say2__RDY
//METACONNECT; lERI$request$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEIO$pipe$enq__ENA; lEII_test$pipe$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; lEII_test$pipe$enq__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$indication$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$indication$heard__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; lERI$pipe$enq__RDY
//METACONNECT; indication$heard__ENA; lEII_test$indication$heard__ENA
//METACONNECT; indication$heard__RDY; lEII_test$indication$heard__RDY
//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA; request$say2__ENA; request$say__ENA
//METAGUARD; RULE$delay_rule; busy & ( !busy_delay );
//METAINVOKE; RULE$respond_rule__ENA; :indication$heard__ENA;
//METAGUARD; RULE$respond_rule; busy_delay & indication$heard__RDY;
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA
//METAGUARD; request$say2; !busy;
//METAGUARD; request$say; !busy;
//METAGUARD; swap$x2y; 1;
//METAGUARD; swap$y2x; 1;
//METAGUARD; swap$y2xnull; 1;
//METARULES; RULE$delay_rule; RULE$respond_rule
//METASTART; EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; RULE$input_rule__ENA; :indication$heard__ENA;
//METAEXCLUSIVE; RULE$input_rule__ENA; pipe$enq__ENA
//METAGUARD; RULE$input_rule; busy_delay & indication$heard__RDY;
//METAGUARD; pipe$enq; !busy_delay;
//METARULES; RULE$input_rule
//METASTART; EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAINVOKE; RULE$output_rulee__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; RULE$output_rulee__ENA; RULE$output_ruleo__ENA; indication$heard__ENA
//METAGUARD; RULE$output_rulee; ind_busy & even & pipe$enq__RDY;
//METAINVOKE; RULE$output_ruleo__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; RULE$output_ruleo__ENA; indication$heard__ENA
//METAGUARD; RULE$output_ruleo; !( even | ( !pipe$enq__RDY ) | ( !ind_busy ) );
//METAGUARD; indication$heard; !ind_busy;
//METARULES; RULE$output_rulee; RULE$output_ruleo
//METASTART; EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v$tag == 2:request$say2__ENA;pipe$enq__ENA$v$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; request$say__RDY & request$say2__RDY;
//METASTART; EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA
//METAINVOKE; request$say2__ENA; :pipe$enq__ENA;
//METAGUARD; request$say2; pipe$enq__RDY;
//METAGUARD; request$say; pipe$enq__RDY;
`endif
