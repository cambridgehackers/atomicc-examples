`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; ind; l_ainterface_OC_EchoIndication;
//METAINTERNAL; fifo; Fifo1_OC_11;
//METAINVOKE; RULErespond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond_rule; fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY;
//METARULES; RULErespond_rule
//METASTART; Fifo1
//METAINTERNAL; fifo; Fifo1Base$__PARAM__$width$128;
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METAINVOKE; out$deq__ENA; :fifo$out$deq__ENA;
//METAGUARD; out$deq; fifo$out$deq__RDY;
//METAINVOKE; out$first; :fifo$out$first;
//METAGUARD; out$first; fifo$out$first__RDY;
//METASTART; Fifo1_OC_11
//METAINTERNAL; fifo; Fifo1Base$__PARAM__$width$32;
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METAINVOKE; out$deq__ENA; :fifo$out$deq__ENA;
//METAGUARD; out$deq; fifo$out$deq__RDY;
//METAINVOKE; out$first; :fifo$out$first;
//METAGUARD; out$first; fifo$out$first__RDY;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
`endif
