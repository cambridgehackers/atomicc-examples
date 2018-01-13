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
//METABEFORE; enq__ENA; :deq__ENA
//METAGUARD; enq; 1;
//METAINVOKE; first; :element1$out$first;:element2$out$first;
//METABEFORE; first; :deq__ENA
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
//METAEXTERNAL; out; l_ainterface_OC_IVectorIndication;
//METAINVOKE; in$say__ENA; :(in$say$meth == 0 ? fifo0:&fifo1)$in$enq__ENA;
//METAGUARD; in$say; fifo0$in$enq__RDY & fifo1$in$enq__RDY;
//METAINVOKE; respond_rule_0__ENA; :fifo0$out$deq__ENA;:fifo0$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_0__ENA; respond_rule_1__ENA; respond_rule_2__ENA; respond_rule_3__ENA; respond_rule_4__ENA; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_0; (fifo0$out$first__RDY & fifo0$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_1__ENA; :fifo1$out$deq__ENA;:fifo1$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_1__ENA; respond_rule_2__ENA; respond_rule_3__ENA; respond_rule_4__ENA; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_1; (fifo1$out$first__RDY & fifo1$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_2__ENA; :fifo2$out$deq__ENA;:fifo2$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_2__ENA; respond_rule_3__ENA; respond_rule_4__ENA; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_2; (fifo2$out$first__RDY & fifo2$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_3__ENA; :fifo3$out$deq__ENA;:fifo3$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_3__ENA; respond_rule_4__ENA; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_3; (fifo3$out$first__RDY & fifo3$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_4__ENA; :fifo4$out$deq__ENA;:fifo4$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_4__ENA; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_4; (fifo4$out$first__RDY & fifo4$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_5__ENA; :fifo5$out$deq__ENA;:fifo5$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_5__ENA; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_5; (fifo5$out$first__RDY & fifo5$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_6__ENA; :fifo6$out$deq__ENA;:fifo6$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_6__ENA; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_6; (fifo6$out$first__RDY & fifo6$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_7__ENA; :fifo7$out$deq__ENA;:fifo7$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_7__ENA; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_7; (fifo7$out$first__RDY & fifo7$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_8__ENA; :fifo8$out$deq__ENA;:fifo8$out$first;:out$heard__ENA;
//METAEXCLUSIVE; respond_rule_8__ENA; respond_rule_9__ENA
//METAGUARD; respond_rule_8; (fifo8$out$first__RDY & fifo8$out$deq__RDY) & out$heard__RDY;
//METAINVOKE; respond_rule_9__ENA; :fifo9$out$deq__ENA;:fifo9$out$first;:out$heard__ENA;
//METAGUARD; respond_rule_9; (fifo9$out$first__RDY & fifo9$out$deq__RDY) & out$heard__RDY;
//METARULES; respond_rule_0; respond_rule_1; respond_rule_2; respond_rule_3; respond_rule_4; respond_rule_5; respond_rule_6; respond_rule_7; respond_rule_8; respond_rule_9
//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
`endif
