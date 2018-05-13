`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 1;
//METAGUARD; out$deq; 1;
//METAGUARD; out$first; 1;
//METASTART; l_module_OC_Fifo1_OC_3
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 0 == full ;
//METAGUARD; out$deq; 0 != full ;
//METAGUARD; out$first; 0 != full ;
//METASTART; l_module_OC_FifoPong
//METAINTERNAL; element1; l_module_OC_Fifo1_OC_3;
//METAINTERNAL; element2; l_module_OC_Fifo1_OC_3;
//METAINVOKE; in$enq__ENA; pong  ^ 1:element1$in$enq__ENA;pong :element2$in$enq__ENA;
//METAGUARD; in$enq; ( ( pong  ^ 1 ) | element2$in$enq__RDY  ) & ( pong  | element1$in$enq__RDY  );
//METAINVOKE; out$deq__ENA; pong  ^ 1:element1$out$deq__ENA;pong :element2$out$deq__ENA;
//METAGUARD; out$deq; ( ( pong  ^ 1 ) | element2$out$deq__RDY  ) & ( pong  | element1$out$deq__RDY  );
//METAINVOKE; out$first; pong  ^ 1:element1$out$first;pong :element2$out$first;
//METAGUARD; out$first; ( ( pong  ^ 1 ) | element2$out$first__RDY  ) & ( pong  | element1$out$first__RDY  );
//METASTART; l_module_OC_IVector
//METAEXTERNAL; ind; l_ainterface_OC_IndIF;
//METAINTERNAL; fifo; l_module_OC_FifoPong;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY ;
//METAINVOKE; respond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; respond; fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
//METARULES; respond
//METASTART; l_module_OC_MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; l_module_OC_Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY ;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY ;
//METARULES; fifoRule
`endif
