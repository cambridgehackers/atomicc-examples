`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

//METASTART; l_module_OC_Connect
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
//METAINVOKE; request$say__ENA; :lERO_test$request$say__ENA;
//METAGUARD; request$say; lERO_test$request$say__RDY;
//METACONNECT; lERI$request$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$request$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEIO$pipe$enq__ENA; lEII_test$pipe$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; lEII_test$pipe$enq__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$indication$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$indication$heard__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; lERI$pipe$enq__RDY
//METACONNECT; lEII_test$indication$heard__ENA; indication$heard__ENA
//METACONNECT; lEII_test$indication$heard__RDY; indication$heard__RDY
//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; l_module_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v_2e_addr$tag == 1:indication$heard__ENA;
//METAGUARD; pipe$enq; ( pipe$enq__ENA$v_2e_addr$tag != 1 ) | indication$heard__RDY;
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAINVOKE; indication$heard__ENA; :pipe$enq__ENA;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v_2e_addr$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; ( pipe$enq__ENA$v_2e_addr$tag != 1 ) | request$say__RDY;
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
`endif
