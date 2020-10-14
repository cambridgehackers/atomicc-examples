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
//METAEXCLUSIVE; in.enq__ENA; RULE$copyRule__ENA
//METAGUARD; in.enq; remain == 0;
//METAINVOKE; RULE$copyRule__ENA; :out.enq__ENA;
//METABEFORE; RULE$copyRule__ENA; :in.enq__ENA
//METAGUARD; RULE$copyRule; !( ( remain == 0 ) || ( !out.enq__RDY ) );
//METARULES; RULE$copyRule
`endif
