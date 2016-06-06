`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

`define l_class_OC_Fifo1_RULE_COUNT (0)

//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
`define l_class_OC_Fifo1_OC_0_RULE_COUNT (0)

//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
`define l_class_OC_IVector_RULE_COUNT (1 + `l_class_OC_Fifo1_OC_0_RULE_COUNT)

//METAINVOKE; respond; :fifo$out$deq;:fifo$out$first;:ind$heard;
//METAGUARD; respond; (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; say; :fifo$in$enq;
//METAGUARD; say; fifo$in$enq__RDY;
//METARULES; respond
//METAINTERNAL; fifo; l_class_OC_Fifo1_OC_0;
//METAEXTERNAL; ind; l_class_OC_IVectorIndication;
`endif
