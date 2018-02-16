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
//METAINVOKE; in$enq__ENA; pong ^ 1:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METABEFORE; in$enq__ENA; :out$deq__ENA
//METAGUARD; in$enq; (element2$in$enq__RDY | (pong ^ 1)) & (element1$in$enq__RDY | pong);
//METAINVOKE; out$deq__ENA; pong ^ 1:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; (element2$out$deq__RDY | (pong ^ 1)) & (element1$out$deq__RDY | pong);
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METABEFORE; out$first; :out$deq__ENA
//METAGUARD; out$first; (element2$out$first__RDY | (pong ^ 1)) & (element1$out$first__RDY | pong);
//METASTART; l_module_OC_IVector
//METAEXTERNAL; out; l_ainterface_OC_IVectorIndication;
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
//METAINVOKE; in$say__ENA; in$say$meth == 0:fifo0$in$enq__ENA;(in$say$meth == 1) & ((in$say$meth == 0) ^ 1):fifo1$in$enq__ENA;(in$say$meth == 2) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)):fifo2$in$enq__ENA;(in$say$meth == 3) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))):fifo3$in$enq__ENA;(in$say$meth == 4) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))):fifo4$in$enq__ENA;(in$say$meth == 5) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))):fifo5$in$enq__ENA;(in$say$meth == 6) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))):fifo6$in$enq__ENA;(in$say$meth == 7) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))):fifo7$in$enq__ENA;(in$say$meth == 8) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))):fifo8$in$enq__ENA;((in$say$meth == 8) ^ 1) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))):fifo9$in$enq__ENA;
//METAGUARD; in$say; (((((((((fifo0$in$enq__RDY | (in$say$meth != 0)) & (fifo1$in$enq__RDY | (((in$say$meth == 1) & ((in$say$meth == 0) ^ 1)) ^ 1))) & (fifo2$in$enq__RDY | (((in$say$meth == 2) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))) ^ 1))) & (fifo3$in$enq__RDY | (((in$say$meth == 3) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))) ^ 1))) & (fifo4$in$enq__RDY | (((in$say$meth == 4) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))) ^ 1))) & (fifo5$in$enq__RDY | (((in$say$meth == 5) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))) ^ 1))) & (fifo6$in$enq__RDY | (((in$say$meth == 6) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))) ^ 1))) & (fifo7$in$enq__RDY | (((in$say$meth == 7) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))) ^ 1))) & (fifo8$in$enq__RDY | (((in$say$meth == 8) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))))) ^ 1))) & (fifo9$in$enq__RDY | ((((in$say$meth == 8) ^ 1) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))))) ^ 1));
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
