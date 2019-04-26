`ifndef __fifo_GENERATED__VH__
`define __fifo_GENERATED__VH__

//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; FifoB1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; full & ( out$deq__ENA != 0 );
//METAGUARD; out$deq; ( __default | ( ( full ^ 1 ) ? in$enq__ENA : 0 ) ) != 0;
//METAGUARD; out$first; ( __default | ( ( full ^ 1 ) ? in$enq__ENA : 0 ) ) != 0;
`endif
