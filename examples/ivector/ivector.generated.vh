`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; l_module_OC_Fifo1_OC_3
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; l_module_OC_FifoPong
//METAINTERNAL; element1; l_module_OC_Fifo1_OC_3;
//METAINTERNAL; element2; l_module_OC_Fifo1_OC_3;
//METAINVOKE; deq__ENA; :element1$out$deq__ENA;:element2$out$deq__ENA;
//METAGUARD; deq; 1;
//METAINVOKE; enq__ENA; :element1$in$enq__ENA;:element2$in$enq__ENA;
//METAGUARD; enq; 1;
//METAINVOKE; first; :element1$out$first;:element2$out$first;
//METAGUARD; first; 1;
//METAINVOKE; in$enq__ENA; :in$enq__ENA;
//METAGUARD; in$enq; in$enq__RDY;
//METAINVOKE; out$deq__ENA; :out$deq__ENA;
//METAGUARD; out$deq; out$deq__RDY;
//METAINVOKE; out$first; :out$first;
//METAGUARD; out$first; out$first__RDY;
//METASTART; l_module_OC_IVector
//METAINTERNAL; fifo0; l_module_OC_FifoPong;
//METAINTERNAL; fifo1; l_module_OC_FifoPong;
//METAINTERNAL; fifo2; l_module_OC_FifoPong;
//METAINTERNAL; fifo3; l_module_OC_FifoPong;
//METAINTERNAL; fifo4; l_module_OC_FifoPong;
//METAINTERNAL; fifo5; l_module_OC_FifoPong;
//METAINTERNAL; fifo6; l_module_OC_FifoPong;
//METAINTERNAL; fifo7; l_module_OC_FifoPong;
//METAINTERNAL; fifo8; l_module_OC_FifoPong;
//METAINTERNAL; fifo9; l_module_OC_FifoPong;
//METAINTERNAL; fifo10; l_module_OC_FifoPong;
//METAEXTERNAL; ind; l_module_OC_IVectorIndication;
//METAINVOKE; in$say__ENA; :in$say__ENA;
//METAGUARD; in$say; in$say__RDY;
//METAINVOKE; respond_rule__ENA; :fifo9$out$deq__ENA;:fifo9$out$first;:ind$heard__ENA;
//METAGUARD; respond_rule; (fifo9$out$first__RDY & fifo9$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; say__ENA; :fifometh$in$enq__ENA;
//METAGUARD; say; 1;
//METARULES; respond_rule
//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
`endif
