`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1Base_OC_7
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1old
//METAINTERNAL; fifo; Fifo1Base;
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; Fifo1old_OC_5
//METAINTERNAL; fifo; Fifo1Base_OC_7;
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; IVector
//METAEXTERNAL; ind; l_ainterface_OC_IVectorIndication;
//METAINTERNAL; fifo; Fifo1old_OC_5;
//METAINVOKE; RULErespond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond; fifo$out$first__RDY & fifo$out$deq__RDY & ind$heard__RDY;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METARULES; RULErespond
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1old;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
`endif
