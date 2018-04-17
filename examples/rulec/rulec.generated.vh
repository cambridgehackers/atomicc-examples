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
//METACONNECT; request$say2__ENA; sw$request$say2__ENA
//METACONNECT; request$say2__RDY; sw$request$say2__RDY
//METACONNECT; request$say__ENA; sw$request$say__ENA
//METACONNECT; request$say__RDY; sw$request$say__RDY
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
//METAEXTERNAL; method; l_ainterface_OC_EchoIndication;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v$tag == 2:method$heard2__ENA;pipe$enq$v$tag == 1:method$heard__ENA;
//METAGUARD; pipe$enq; method$heard__RDY & method$heard2__RDY;
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard__ENA
//METAGUARD; method$heard2; pipe$enq__RDY;
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; method; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v$tag == 2:method$say2__ENA;pipe$enq$v$tag == 1:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY & method$say2__RDY;
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; method$say2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$say2__ENA; method$say__ENA
//METAGUARD; method$say2; pipe$enq__RDY;
//METAINVOKE; method$say__ENA; :pipe$enq__ENA;
//METAGUARD; method$say; pipe$enq__RDY;
//METASTART; l_module_OC_Hardware
//METAEXTERNAL; indication; l_ainterface_OC_PipeIn_OC_0;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METACONNECT; request$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; request$enq__RDY; lERI$pipe$enq__RDY
//METACONNECT; lEIO$pipe$enq__ENA; indication$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; indication$enq__RDY
//METACONNECT; lERI$method$say2__ENA; lEcho$request$say2__ENA
//METACONNECT; lERI$method$say2__RDY; lEcho$request$say2__RDY
//METACONNECT; lERI$method$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$method$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEcho$indication$heard2__ENA; lEIO$method$heard2__ENA
//METACONNECT; lEcho$indication$heard2__RDY; lEIO$method$heard2__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$method$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$method$heard__RDY
//METASTART; l_module_OC_Software
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXTERNAL; reqPipe; l_ainterface_OC_PipeIn;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
//METACONNECT; request$say2__ENA; lERO_test$method$say2__ENA
//METACONNECT; request$say2__RDY; lERO_test$method$say2__RDY
//METACONNECT; request$say__ENA; lERO_test$method$say__ENA
//METACONNECT; request$say__RDY; lERO_test$method$say__RDY
//METACONNECT; lEII_test$method$heard2__ENA; indication$heard2__ENA
//METACONNECT; lEII_test$method$heard2__RDY; indication$heard2__RDY
//METACONNECT; lEII_test$method$heard__ENA; indication$heard__ENA
//METACONNECT; lEII_test$method$heard__RDY; indication$heard__RDY
//METACONNECT; indPipe$enq__ENA; lEII_test$pipe$enq__ENA
//METACONNECT; indPipe$enq__RDY; lEII_test$pipe$enq__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; reqPipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; reqPipe$enq__RDY
`endif
