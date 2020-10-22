`ifndef __adapter_GENERATED__VH__
`define __adapter_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; AdapterFromBus
//METAEXCLUSIVE; in.enq__ENA; RULE$pushValue__ENA
//METAGUARD; in.enq; 0 != ( waitForEnq ^ 1 );
//METAINVOKE; RULE$pushValue__ENA; :out.enq__ENA;
//METAGUARD; RULE$pushValue; !( ( 0 == waitForEnq ) || ( !out.enq__RDY ) );
//METARULES; RULE$pushValue
//METASTART; AdapterToBus
//METAEXCLUSIVE; in.enq__ENA; out.deq__ENA
//METAGUARD; in.enq; remain == 0;
//METAGUARD; out.last; remain != 0;
//METAGUARD; out.first; remain != 0;
//METABEFORE; out.deq__ENA; :in.enq__ENA
//METAGUARD; out.deq; remain != 0;
`endif
