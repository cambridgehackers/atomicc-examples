`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; l_module_OC_Connect
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINTERNAL; sw; l_module_OC_Software;
//METAINTERNAL; hw; l_module_OC_Hardware;
//METACONNECT; sw$indication$heard2__ENA; indication$heard2__ENA
//METACONNECT; sw$indication$heard2__RDY; indication$heard2__RDY
//METACONNECT; sw$indication$heard__ENA; indication$heard__ENA
//METACONNECT; sw$indication$heard__RDY; indication$heard__RDY
//METACONNECT; hw$indication$enq__ENA; sw$indPipe$enq__ENA
//METACONNECT; hw$indication$enq__RDY; sw$indPipe$enq__RDY
//METACONNECT; sw$reqPipe$enq__ENA; hw$request$enq__ENA
//METACONNECT; sw$reqPipe$enq__RDY; hw$request$enq__RDY
//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; delay_rule__ENA; request$say2__ENA; request$say__ENA; respond_rule__ENA
//METAGUARD; delay_rule; ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
//METAEXCLUSIVE; request$say2__ENA; request$say__ENA
//METAGUARD; request$say2; busy == 0;
//METAGUARD; request$say; busy == 0;
//METAINVOKE; respond_rule__ENA; v_type != 1:indication$heard2__ENA;v_type == 1:indication$heard__ENA;
//METABEFORE; respond_rule__ENA; :delay_rule__ENA
//METAGUARD; respond_rule; ( busy_delay != 0 ) & ( ( v_type != 1 ) | indication$heard__RDY ) & ( ( v_type == 1 ) | indication$heard2__RDY );
//METARULES; delay_rule; respond_rule
//METASTART; l_module_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; input_rule__ENA; v_type != 1:indication$heard2__ENA;v_type == 1:indication$heard__ENA;
//METAEXCLUSIVE; input_rule__ENA; pipe$enq__ENA
//METABEFORE; input_rule__ENA; :pipe$enq__ENA
//METAGUARD; input_rule; ( busy_delay != 0 ) & ( ( v_type != 1 ) | indication$heard__RDY ) & ( ( v_type == 1 ) | indication$heard2__RDY );
//METAGUARD; pipe$enq; busy_delay == 0;
//METARULES; input_rule
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAEXCLUSIVE; indication$heard2__ENA; indication$heard__ENA; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; indication$heard2; ind_busy == 0;
//METAEXCLUSIVE; indication$heard__ENA; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; indication$heard; ind_busy == 0;
//METAINVOKE; output_rulee__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; output_rulee__ENA; output_ruleo__ENA
//METAGUARD; output_rulee; ( ( ( ind_busy != 0 ) & ( even != 0 ) ) != 0 ) & pipe$enq__RDY;
//METAINVOKE; output_ruleo__ENA; :pipe$enq__ENA;
//METAGUARD; output_ruleo; ( ( ( ind_busy != 0 ) & ( even == 0 ) ) != 0 ) & pipe$enq__RDY;
//METARULES; output_rulee; output_ruleo
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v$tag == 2:request$say2__ENA;pipe$enq$v$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; ( ( pipe$enq$v$tag != 1 ) | request$say__RDY ) & ( ( pipe$enq$v$tag != 2 ) | request$say2__RDY );
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; request$say2__ENA; request$say__ENA
//METAGUARD; request$say2; pipe$enq__RDY;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; l_module_OC_Hardware
//METAEXTERNAL; indication; l_ainterface_OC_PipeIn_OC_0;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINVOKE; request$enq__ENA; :lERI$pipe$enq__ENA;
//METAGUARD; request$enq; lERI$pipe$enq__RDY;
//METACONNECT; lEIO$pipe$enq__ENA; indication$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; indication$enq__RDY
//METACONNECT; lERI$request$say2__ENA; lEcho$request$say2__ENA
//METACONNECT; lERI$request$say2__RDY; lEcho$request$say2__RDY
//METACONNECT; lERI$request$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$request$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEcho$indication$heard2__ENA; lEIO$indication$heard2__ENA
//METACONNECT; lEcho$indication$heard2__RDY; lEIO$indication$heard2__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$indication$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$indication$heard__RDY
//METASTART; l_module_OC_Software
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXTERNAL; reqPipe; l_ainterface_OC_PipeIn;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
//METAINVOKE; indPipe$enq__ENA; :lEII_test$pipe$enq__ENA;
//METAGUARD; indPipe$enq; lEII_test$pipe$enq__RDY;
//METAINVOKE; request$say2__ENA; :lERO_test$request$say2__ENA;
//METAGUARD; request$say2; lERO_test$request$say2__RDY;
//METAINVOKE; request$say__ENA; :lERO_test$request$say__ENA;
//METAGUARD; request$say; lERO_test$request$say__RDY;
//METACONNECT; lEII_test$indication$heard2__ENA; indication$heard2__ENA
//METACONNECT; lEII_test$indication$heard2__RDY; indication$heard2__RDY
//METACONNECT; lEII_test$indication$heard__ENA; indication$heard__ENA
//METACONNECT; lEII_test$indication$heard__RDY; indication$heard__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; reqPipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; reqPipe$enq__RDY
`endif
