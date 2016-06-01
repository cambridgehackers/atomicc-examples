`ifndef __fifo_GENERATED__VH__
`define __fifo_GENERATED__VH__

`endif
`define l_class_OC_Fifo1_RULE_COUNT (0)

//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
