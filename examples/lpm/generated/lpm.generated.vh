`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

//METASTART; Lpm
//METAEXTERNAL; outQ; PipeIn;
//METAINTERNAL; compBuf; BufTicket;
//METAINTERNAL; inQ; Fifo1Base(width=32);
//METAINTERNAL; fifo; FifoB1Base(width=23);
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; request$enter__ENA; :inQ$in$enq__ENA;
//METAGUARD; request$enter; inQ$in$enq__RDY;
//METAINVOKE; RULE$recirc__ENA; :fifo$in$enq__ENA;:fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$req__ENA;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;
//METAEXCLUSIVE; RULE$recirc__ENA; RULE$enter__ENA; RULE$exitr__ENA
//METAGUARD; RULE$recirc; !( ( ( mem$ifc$resValue & 1 ) == 1 ) | ( !( mem$ifc$resValue__RDY & fifo$out$first__RDY & mem$ifc$resAccept__RDY & mem$ifc$req__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY ) ) );
//METAINVOKE; RULE$exitr__ENA; :fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;:outQ$enq__ENA;
//METAGUARD; RULE$exitr; ( ( mem$ifc$resValue & 1 ) == 1 ) & ( RULE$recirc__ENA == 0 ) & mem$ifc$resValue__RDY & fifo$out$first__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$enq__RDY;
//METAINVOKE; RULE$enter__ENA; :fifo$in$enq__ENA;:inQ$out$deq__ENA;:inQ$out$first;:mem$ifc$req__ENA;
//METAGUARD; RULE$enter; ( RULE$recirc__ENA == 0 ) & inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METARULES; RULE$recirc; RULE$exitr; RULE$enter
`endif
