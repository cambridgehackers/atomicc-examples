`ifndef __mux_GENERATED__VH__
`define __mux_GENERATED__VH__

//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeInH;
//METAINTERNAL; forwardFifo; Fifo1Base$__PARAM__$width$128;
//METAINTERNAL; forwardFifol; Fifo1Base$__PARAM__$width$16;
//METAINVOKE; RULE$fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:forwardFifol$out$deq__ENA;:forwardFifol$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULE$fifoRule__ENA; in$enq__ENA
//METAGUARD; RULE$fifoRule; forwardFifo$out$first__RDY & forwardFifol$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY & forwardFifol$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;:forwardFifol$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY & forwardFifol$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; ( !forwardFifo$out$first__RDY ) & out$enq__RDY;
//METARULES; RULE$fifoRule
`endif
