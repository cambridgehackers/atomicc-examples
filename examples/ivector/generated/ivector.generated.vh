`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1Base(width=96);
//METAINTERNAL; element2; Fifo1Base(width=96);
//METAINVOKE; in$enq__ENA; !pong:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( element2$in$enq__RDY && ( pong || element1$in$enq__RDY ) ) || ( ( !element2$in$enq__RDY ) && ( !( pong || ( !element1$in$enq__RDY ) ) ) );
//METAINVOKE; out$deq__ENA; !pong:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( element2$out$deq__RDY && ( pong || element1$out$deq__RDY ) ) || ( ( !element2$out$deq__RDY ) && ( !( pong || ( !element1$out$deq__RDY ) ) ) );
//METAINVOKE; out$first; !pong:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; ( element2$out$first__RDY && ( pong || element1$out$first__RDY ) ) || ( ( !element2$out$first__RDY ) && ( !( pong || ( !element1$out$first__RDY ) ) ) );
//METASTART; IVector
//METAEXTERNAL; out; IVectorIndication;
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
//METAGUARD; in$say; fifo[ __inst$Genvar1 ] fifo fifo fifo in$enq__RDY;
//METAINVOKE; RULE$respond_rule_0__ENA; :fifo[0]out$deq__ENA;:fifo[0]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_0__ENA; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_0; fifo[ 0 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 0 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_1__ENA; :fifo[1]out$deq__ENA;:fifo[1]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_1; fifo[ 1 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 1 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_2__ENA; :fifo[2]out$deq__ENA;:fifo[2]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_2; fifo[ 2 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 2 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_3__ENA; :fifo[3]out$deq__ENA;:fifo[3]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_3; fifo[ 3 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 3 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_4__ENA; :fifo[4]out$deq__ENA;:fifo[4]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_4; fifo[ 4 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 4 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_5__ENA; :fifo[5]out$deq__ENA;:fifo[5]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_5; fifo[ 5 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 5 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_6__ENA; :fifo[6]out$deq__ENA;:fifo[6]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_6; fifo[ 6 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 6 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_7__ENA; :fifo[7]out$deq__ENA;:fifo[7]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_7; fifo[ 7 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 7 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_8__ENA; :fifo[8]out$deq__ENA;:fifo[8]out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_8; fifo[ 8 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 8 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_9__ENA; :fifo[9]out$deq__ENA;:fifo[9]out$first;:out$heard__ENA;
//METAGUARD; RULE$respond_rule_9; fifo[ 9 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 9 ] fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
//METARULES; RULE$respond_rule_0; RULE$respond_rule_1; RULE$respond_rule_2; RULE$respond_rule_3; RULE$respond_rule_4; RULE$respond_rule_5; RULE$respond_rule_6; RULE$respond_rule_7; RULE$respond_rule_8; RULE$respond_rule_9
`endif
