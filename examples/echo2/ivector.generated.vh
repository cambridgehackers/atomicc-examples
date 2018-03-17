`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full ^ 1;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
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
//METAGUARD; in$enq; ( element2$in$enq__RDY | ( pong ^ 1 ) ) & ( element1$in$enq__RDY | pong );
//METAINVOKE; out$deq__ENA; pong ^ 1:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( element2$out$deq__RDY | ( pong ^ 1 ) ) & ( element1$out$deq__RDY | pong );
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METABEFORE; out$first; :out$deq__ENA
//METAGUARD; out$first; ( element2$out$first__RDY | ( pong ^ 1 ) ) & ( element1$out$first__RDY | pong );
//METASTART; l_module_OC_IVector
//METAEXTERNAL; ind; l_ainterface_OC_IndIF;
//METAINTERNAL; fifo; l_module_OC_FifoPong;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METAINVOKE; respond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; respond; ( fifo$out$deq__RDY & fifo$out$first__RDY ) & ind$heard__RDY;
//METARULES; respond
`endif
