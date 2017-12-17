`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAINTERNAL; fifo; l_module_OC_Fifo1;
//METAEXTERNAL; ind; l_module_OC_EchoIndication;
//METAINVOKE; respond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$hout$heard__ENA;
//METAGUARD; respond_rule; (fifo$out$deq__RDY & fifo$out$first__RDY) & ind$hout$heard__RDY;
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY;
//METARULES; respond_rule
`endif
