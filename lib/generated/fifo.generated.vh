`ifndef __fifo_GENERATED__VH__
`define __fifo_GENERATED__VH__

//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; FifoB1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !( ( ( full ^ 1 ) | out$deq__ENA ) == 0 );
//METAGUARD; out$deq; full || in$enq__ENA;
//METAGUARD; out$first; full || in$enq__ENA;
`endif
