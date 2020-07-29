`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

//METASTART; Lpm
//METAINTERNAL; compBuf; BufTicket;
//METAINTERNAL; inQ; Fifo1Base(width=32);
//METAINTERNAL; fifo; FifoB1Base(width=23);
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; enter__ENA; :inQ$in$enq__ENA;
//METAGUARD; enter; inQ$in$enq__RDY;
//METAINVOKE; RULE$recirc__ENA; :fifo$in$enq__ENA;:fifo$out$deq__ENA;:fifo$out$first;:mem$req__ENA;:mem$resAccept__ENA;:mem$resValue;
//METAEXCLUSIVE; RULE$recirc__ENA; RULE$enter__ENA; RULE$exitr__ENA
//METAGUARD; RULE$recirc; !( ( 0 == ( ( ( mem$resValue & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out$first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out$deq__RDY && fifo$in$enq__RDY ) ) );
//METAINVOKE; RULE$exitr__ENA; :fifo$out$deq__ENA;:fifo$out$first;:mem$resAccept__ENA;:mem$resValue;:outQ$enq__ENA;
//METAGUARD; RULE$exitr; ( ( mem$resValue & 1 ) == 1 ) && ( RULE$recirc__ENA == 0 ) && mem$resValue__RDY && fifo$out$first__RDY && mem$resAccept__RDY && fifo$out$deq__RDY && outQ$enq__RDY;
//METAINVOKE; RULE$enter__ENA; :fifo$in$enq__ENA;:inQ$out$deq__ENA;:inQ$out$first;:mem$req__ENA;
//METAGUARD; RULE$enter; !( ( 0 == ( ( RULE$recirc__ENA != 0 ) ^ 1 ) ) || ( !( inQ$out$first__RDY && inQ$out$deq__RDY && fifo$in$enq__RDY && mem$req__RDY ) ) );
//METARULES; RULE$recirc; RULE$exitr; RULE$enter
`endif
