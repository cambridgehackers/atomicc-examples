`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; ind; l_ainterface_OC_EchoIndication;
//METAINTERNAL; fifo; Fifo1Base$__PARAM__$width$32;
//METAINVOKE; RULErespond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond_rule; fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY;
//METARULES; RULErespond_rule
`endif
