`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAEXTERNAL; ind; l_ainterface_OC_EchoIndication;
//METAINTERNAL; fifo; l_module_OC_Fifo1_OC_3;
//METAINVOKE; respond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; respond_rule; fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY ;
//METARULES; respond_rule
//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 1;
//METAGUARD; out$deq; 1;
//METAGUARD; out$first; 1;
//METASTART; l_module_OC_Fifo1_OC_3
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 0 == full ;
//METAGUARD; out$deq; 0 != full ;
//METAGUARD; out$first; 0 != full ;
//METASTART; l_module_OC_MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; l_module_OC_Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY ;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY ;
//METARULES; fifoRule
`endif
