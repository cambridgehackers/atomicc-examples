`include "atomicclib.vh"

//METASTART; SizedFifoBase
//METAEXCLUSIVE; out.deq__ENA; in.enq__ENA
//METABEFORE; out.deq__ENA; :in.enq__ENA
//METAGUARD; out.deq; 0 != ( ( c == 0 ) ^ 1 );
//METAGUARD; out.first; 1'd1;
//METABEFORE; in.enq__ENA; :out.deq__ENA
//METAGUARD; in.enq; 0 != ( ( c == depth ) ^ 1 );
