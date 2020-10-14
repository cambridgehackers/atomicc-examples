`ifndef __mimo_GENERATED__VH__
`define __mimo_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; MIMOBase
//METAEXCLUSIVE; out.deq__ENA; in.enq__ENA
//METABEFORE; out.deq__ENA; :in.enq__ENA
//METAGUARD; out.deq; 0 != ( c >= widthOut );
//METAGUARD; out.first; 0 != ( c >= widthOut );
//METAGUARD; in.enq; 0 != ( ( c >= widthOut ) ^ 1 );
`endif
