`ifndef __before1_GENERATED__VH__
`define __before1_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; delay_rule__ENA; request$say2__ENA; request$say__ENA; respond_rule__ENA
//METABEFORE; delay_rule__ENA; :request$say2__ENA; :request$say__ENA
//METAGUARD; delay_rule; ((busy != 0) & (busy_delay == 0)) != 0;
//METAEXCLUSIVE; request$say2__ENA; request$say__ENA
//METAGUARD; request$say2; (busy != 0) ^ 1;
//METAGUARD; request$say; (busy != 0) ^ 1;
//METAINVOKE; respond_rule__ENA; :indication$heard__ENA;
//METABEFORE; respond_rule__ENA; :delay_rule__ENA
//METAGUARD; respond_rule; (busy_delay != 0) & indication$heard__RDY;
//METABEFORE; x2y__ENA; :y2x__ENA
//METAGUARD; x2y; 1;
//METABEFORE; y2x__ENA; :x2y__ENA
//METAGUARD; y2x; 1;
//METAGUARD; y2xnull; 1;
//METARULES; delay_rule; respond_rule
//METASTART; l_module_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; input_rule__ENA; :indication$heard__ENA;
//METAEXCLUSIVE; input_rule__ENA; pipe$enq__ENA
//METABEFORE; input_rule__ENA; :pipe$enq__ENA
//METAGUARD; input_rule; (busy_delay != 0) & indication$heard__RDY;
//METAGUARD; pipe$enq; (busy_delay != 0) ^ 1;
//METARULES; input_rule
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAEXCLUSIVE; indication$heard__ENA; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; indication$heard; (ind_busy != 0) ^ 1;
//METAINVOKE; output_rulee__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; output_rulee; (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
//METAINVOKE; output_ruleo__ENA; :pipe$enq__ENA;
//METAGUARD; output_ruleo; (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; v_2e_addr_2e_ifoosuff2$tag == 2:request$say2__ENA;v_2e_addr_2e_ifoosuff$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; (request$say__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1)) & (request$say2__RDY | ((v_2e_addr_2e_ifoosuff2foosuff$tag == 2) ^ 1));
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; request$say2__ENA; request$say__ENA
//METAGUARD; request$say2; pipe$enq__RDY;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; l_module_OC_Connect
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
//METAINVOKE; swap2_rule__ENA; :lEcho$y2xnull__ENA;
//METAGUARD; swap2_rule; lEcho$y2xnull__RDY;
//METAINVOKE; swap_rule__ENA; :lEcho$x2y__ENA;:lEcho$y2x__ENA;
//METAGUARD; swap_rule; lEcho$x2y__RDY & lEcho$y2x__RDY;
//METARULES; swap2_rule; swap_rule
`endif
