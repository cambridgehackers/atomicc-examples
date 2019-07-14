`ifndef __sizedFifo_GENERATED__VH__
`define __sizedFifo_GENERATED__VH__

//METASTART; SizedFifoBase
//METAEXCLUSIVE; out$deq__ENA; in$enq__ENA
//METABEFORE; out$deq__ENA; :in$enq__ENA
//METAGUARD; out$deq; !( c == 0 );
//METAGUARD; out$first; 1;
//METABEFORE; in$enq__ENA; :out$deq__ENA
//METAGUARD; in$enq; !( c == depth );
`endif
