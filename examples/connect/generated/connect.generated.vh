`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

//METASTART; Connect
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METACONNECT; lERI$request$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$request$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEIO$pipe$enq__ENA; lEII_test$pipe$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; lEII_test$pipe$enq__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$indication$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$indication$heard__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; lERI$pipe$enq__RDY
//METACONNECT; request$say__ENA; lERO_test$request$say__ENA
//METACONNECT; request$say__RDY; lERO_test$request$say__RDY
//METACONNECT; indication$heard__ENA; lEII_test$indication$heard__ENA
//METACONNECT; indication$heard__RDY; lEII_test$indication$heard__RDY
//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; EchoIndicationInput
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v_2e_addr$tag == 1:indication$heard__ENA;
//METAGUARD; pipe$enq; indication$heard__RDY;
//METASTART; EchoIndicationOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_4;
//METAINVOKE; indication$heard__ENA; :pipe$enq__ENA;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; EchoRequestInput
//METAEXTERNAL; request; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v_2e_addr$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; request$say__RDY;
//METASTART; EchoRequestOutput
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn_OC_3;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1Base$__PARAM__$width$128;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
`endif
