`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_3
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1_OC_3;
//METAINTERNAL; element2; Fifo1_OC_3;
//METAINVOKE; in$enq__ENA; pong ^ 1:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
//METAINVOKE; out$deq__ENA; pong ^ 1:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; 1;
//METASTART; IVector
//METAEXTERNAL; ind; l_ainterface_OC_IndIF;
//METAINTERNAL; fifo; FifoPong;
//METAINVOKE; RULErespond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULErespond; fifo$out$deq__RDY & ind$heard__RDY;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METARULES; RULErespond
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
