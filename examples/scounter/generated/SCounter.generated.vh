`ifndef __scounter_GENERATED__VH__
`define __scounter_GENERATED__VH__

//METASTART; PulseWire
//METAGUARD; ifc$send; 1;
//METAGUARD; ifc$value; 1;
//METASTART; SCounterBase
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METABEFORE; in$enq__ENA; :out$deq__ENA
//METAGUARD; in$enq; !( c == depth );
//METAGUARD; out$deq; !( c == 0 );
//METAGUARD; out$first; 1;
`endif
