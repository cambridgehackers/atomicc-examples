`ifndef __mux_GENERATED__VH__
`define __mux_GENERATED__VH__

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
