`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; Fifo1
//METAINTERNAL; fifo; Fifo1Base$__PARAM__$width$128;
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METAINVOKE; out$deq__ENA; :fifo$out$deq__ENA;
//METAGUARD; out$deq; fifo$out$deq__RDY;
//METAINVOKE; out$first; :fifo$out$first;
//METAGUARD; out$first; fifo$out$first__RDY;
//METASTART; Fifo1_OC_11
//METAINTERNAL; fifo; Fifo1Base$__PARAM__$width$704;
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METAINVOKE; out$deq__ENA; :fifo$out$deq__ENA;
//METAGUARD; out$deq; fifo$out$deq__RDY;
//METAINVOKE; out$first; :fifo$out$first;
//METAGUARD; out$first; fifo$out$first__RDY;
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1_OC_11;
//METAINTERNAL; element2; Fifo1_OC_11;
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
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
`endif
