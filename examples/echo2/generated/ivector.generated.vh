`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1Base$__PARAM__$width$704;
//METAINTERNAL; element2; Fifo1Base$__PARAM__$width$704;
//METAINVOKE; in$enq__ENA; pong ^ 1:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
//METAINVOKE; out$deq__ENA; pong ^ 1:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; ( ( pong ^ 1 ) | element2$out$first__RDY ) & ( pong | element1$out$first__RDY );
//METASTART; IVector
//METAEXTERNAL; ind; l_ainterface_OC_IndIF;
//METAINTERNAL; fifo; FifoPong;
//METAINVOKE; RULErespond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond; fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METARULES; RULErespond
`endif
