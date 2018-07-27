`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 1;
//METAGUARD; out$deq; 1;
//METASTART; Fifo1_OC_3
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1_OC_3;
//METAINTERNAL; element2; Fifo1_OC_3;
//METAINVOKE; in$enq__ENA; pong ^ 1:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
//METAINVOKE; out$deq__ENA; pong ^ 1:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METASTART; IVector
//METAEXTERNAL; out; l_ainterface_OC_IVectorIndication;
//METAINTERNAL; fifo0; FifoPong;
//METAINTERNAL; fifo1; FifoPong;
//METAINTERNAL; fifo2; FifoPong;
//METAINTERNAL; fifo3; FifoPong;
//METAINTERNAL; fifo4; FifoPong;
//METAINTERNAL; fifo5; FifoPong;
//METAINTERNAL; fifo6; FifoPong;
//METAINTERNAL; fifo7; FifoPong;
//METAINTERNAL; fifo8; FifoPong;
//METAINTERNAL; fifo9; FifoPong;
//METAINVOKE; RULErespond_rule_0__ENA; :fifo0$out$deq__ENA;:fifo0$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_0__ENA; RULErespond_rule_1__ENA; RULErespond_rule_2__ENA; RULErespond_rule_3__ENA; RULErespond_rule_4__ENA; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_0; fifo0$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_1__ENA; :fifo1$out$deq__ENA;:fifo1$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_1__ENA; RULErespond_rule_2__ENA; RULErespond_rule_3__ENA; RULErespond_rule_4__ENA; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_1; fifo1$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_2__ENA; :fifo2$out$deq__ENA;:fifo2$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_2__ENA; RULErespond_rule_3__ENA; RULErespond_rule_4__ENA; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_2; fifo2$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_3__ENA; :fifo3$out$deq__ENA;:fifo3$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_3__ENA; RULErespond_rule_4__ENA; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_3; fifo3$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_4__ENA; :fifo4$out$deq__ENA;:fifo4$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_4__ENA; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_4; fifo4$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_5__ENA; :fifo5$out$deq__ENA;:fifo5$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_5__ENA; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_5; fifo5$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_6__ENA; :fifo6$out$deq__ENA;:fifo6$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_6__ENA; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_6; fifo6$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_7__ENA; :fifo7$out$deq__ENA;:fifo7$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_7__ENA; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_7; fifo7$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_8__ENA; :fifo8$out$deq__ENA;:fifo8$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULErespond_rule_8__ENA; RULErespond_rule_9__ENA
//METAGUARD; RULErespond_rule_8; fifo8$out$deq__RDY & out$heard__RDY;
//METAINVOKE; RULErespond_rule_9__ENA; :fifo9$out$deq__ENA;:fifo9$out$first;:out$heard__ENA;
//METAGUARD; RULErespond_rule_9; fifo9$out$deq__RDY & out$heard__RDY;
//METAINVOKE; in$say__ENA; in$say$meth == 0:fifo0$in$enq__ENA;in$say$meth == 1:fifo1$in$enq__ENA;in$say$meth == 2:fifo2$in$enq__ENA;in$say$meth == 3:fifo3$in$enq__ENA;in$say$meth == 4:fifo4$in$enq__ENA;in$say$meth == 5:fifo5$in$enq__ENA;in$say$meth == 6:fifo6$in$enq__ENA;in$say$meth == 7:fifo7$in$enq__ENA;in$say$meth == 8:fifo8$in$enq__ENA;in$say$meth == 9:fifo9$in$enq__ENA;
//METAGUARD; in$say; fifo0$in$enq__RDY & fifo1$in$enq__RDY & fifo2$in$enq__RDY & fifo3$in$enq__RDY & fifo4$in$enq__RDY & fifo5$in$enq__RDY & fifo6$in$enq__RDY & fifo7$in$enq__RDY & fifo8$in$enq__RDY & fifo9$in$enq__RDY;
//METARULES; RULErespond_rule_0; RULErespond_rule_1; RULErespond_rule_2; RULErespond_rule_3; RULErespond_rule_4; RULErespond_rule_5; RULErespond_rule_6; RULErespond_rule_7; RULErespond_rule_8; RULErespond_rule_9
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
