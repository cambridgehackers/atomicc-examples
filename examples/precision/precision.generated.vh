`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

//METASTART; l_class_OC_Fifo1
//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
//METASTART; l_class_OC_Fifo1_OC_0
//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
//METASTART; l_class_OC_IVector
//METAINTERNAL; fifo; l_class_OC_Fifo1_OC_0;
//METAEXTERNAL; ind; l_class_OC_IVectorIndication;
//METAINVOKE; respond; :fifo$out$deq;:fifo$out$first;:ind$heard;
//METAGUARD; respond; (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; say; :fifo$in$enq;
//METAGUARD; say; fifo$in$enq__RDY;
//METARULES; respond
`endif
