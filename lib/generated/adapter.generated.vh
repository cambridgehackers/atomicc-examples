`include "atomicclib.vh"

//METASTART; AdapterFromBus
//METAEXCLUSIVE; in.enq__ENA; RULE$pushValue__ENA
//METAGUARD; in.enq; 0 != ( waitForEnq ^ 1 );
//METAINVOKE; RULE$pushValue__ENA; :out.enq__ENA;
//METAGUARD; RULE$pushValue; waitForEnq && out.enq__RDY;
//METARULES; RULE$pushValue
//METASTART; AdapterToBus
//METAEXCLUSIVE; clear__ENA; in.enq__ENA; out.deq__ENA
//METAGUARD; clear; 1'd1;
//METAEXCLUSIVE; in.enq__ENA; out.deq__ENA
//METAGUARD; in.enq; ( clear__ENA != 0 ) || ( remain == 0 );
//METAGUARD; out.last; ( clear__ENA != 0 ) || ( remain != 0 );
//METAGUARD; out.first; ( clear__ENA != 0 ) || ( remain != 0 );
//METABEFORE; out.deq__ENA; :clear__ENA; :in.enq__ENA
//METAGUARD; out.deq; ( clear__ENA != 0 ) || ( remain != 0 );
