`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; l_module_OC_EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; pipe$enq__ENA; v_2e_addr_2e_i$tag == 1:indication$heard__ENA;
//METAGUARD; pipe$enq; indication$heard__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1);
//METASTART; l_module_OC_EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_0;
//METAINVOKE; indication$heard__ENA; :pipe$enq__ENA;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; l_module_OC_EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; v_2e_addr_2e_i$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; request$say__RDY | ((v_2e_addr_2e_ifoosufffoosuff$tag == 1) ^ 1);
//METASTART; l_module_OC_EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; l_module_OC_Connect
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINTERNAL; lEIO; l_module_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_module_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINTERNAL; lERO_test; l_module_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_module_OC_EchoIndicationInput;
//METAINVOKE; request$say__ENA; :request$say__ENA;
//METAGUARD; request$say; request$say__RDY;
`endif
