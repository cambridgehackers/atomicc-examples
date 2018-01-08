`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; delay_rule__ENA; respond_rule__ENA
//METAGUARD; delay_rule; ((busy != 0) & (busy_delay == 0)) != 0;
//METAINVOKE; request$say2__ENA; :request$say2__ENA;
//METAGUARD; request$say2; request$say2__RDY;
//METAINVOKE; request$say__ENA; :request$say__ENA;
//METAGUARD; request$say; request$say__RDY;
//METAINVOKE; respond_rule__ENA; :indication$heard__ENA;
//METABEFORE; respond_rule__ENA; :delay_rule__ENA
//METAGUARD; respond_rule; (busy_delay != 0) & indication$heard__RDY;
//METARULES; delay_rule; respond_rule
//METASTART; l_module_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; input_rule__ENA; :indication$heard__ENA;
//METAGUARD; input_rule; (busy_delay != 0) & indication$heard__RDY;
//METAINVOKE; pipe$enq__ENA; :pipe$enq__ENA;
//METAGUARD; pipe$enq; pipe$enq__RDY;
//METARULES; input_rule
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAINVOKE; indication$heard__ENA; :indication$heard__ENA;
//METAGUARD; indication$heard; indication$heard__RDY;
//METAINVOKE; output_rulee__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; output_rulee; (((ind_busy != 0) & (even != 0)) != 0) & pipe$enq__RDY;
//METAINVOKE; output_ruleo__ENA; :pipe$enq__ENA;
//METAGUARD; output_ruleo; (((ind_busy != 0) & (even == 0)) != 0) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; :pipe$enq__ENA;
//METAGUARD; pipe$enq; pipe$enq__RDY;
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say2__ENA; :request$say2__ENA;
//METAGUARD; request$say2; request$say2__RDY;
//METAINVOKE; request$say__ENA; :request$say__ENA;
//METAGUARD; request$say; request$say__RDY;
//METASTART; l_module_OC_Connect
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
`endif
