`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; l_module_OC_Fifo1_OC_0
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; l_module_OC_IVector
//METAEXTERNAL; ind; l_ainterface_OC_IVectorIndication;
//METAINTERNAL; fifo; l_module_OC_Fifo1_OC_0;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METAINVOKE; respond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; respond; ( fifo$out$first__RDY & fifo$out$deq__RDY ) & ind$heard__RDY;
//METARULES; respond
`endif
