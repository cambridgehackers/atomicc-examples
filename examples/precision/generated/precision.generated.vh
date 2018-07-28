`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 1;
//METAGUARD; out$deq; 1;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_2
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; IVector
//METAEXTERNAL; ind; l_ainterface_OC_IVectorIndication;
//METAINTERNAL; fifo; Fifo1_OC_2;
//METAINVOKE; RULErespond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond; fifo$out$deq__RDY & ind$heard__RDY;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METARULES; RULErespond
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$deq__RDY & out$enq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
`endif
