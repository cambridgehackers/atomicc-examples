`ifndef __scounter_GENERATED__VH__
`define __scounter_GENERATED__VH__

//METASTART; PulseWire
//METAGUARD; ifc$send; 1;
//METAGUARD; ifc$value; 1;
//METASTART; SCounterBase
//METAINTERNAL; enqueueing; PulseWire;
//METAINTERNAL; dequeueing; PulseWire;
//METAGUARD; RULE$both; !( 0 == ( dequeueing$ifc$value && enqueueing$ifc$value ) );
//METAEXCLUSIVE; RULE$decCtr__ENA; RULE$incCtr__ENA
//METAGUARD; RULE$decCtr; !( 0 == ( dequeueing$ifc$value && ( enqueueing$ifc$value ^ 1 ) ) );
//METAGUARD; RULE$incCtr; !( 0 == ( enqueueing$ifc$value && ( dequeueing$ifc$value ^ 1 ) ) );
//METAINVOKE; in$enq__ENA; :enqueueing$ifc$send__ENA;
//METAGUARD; in$enq; !( ( c == 10 ) | ( !enqueueing$ifc$send__RDY ) );
//METAINVOKE; out$deq__ENA; :dequeueing$ifc$send__ENA;
//METAGUARD; out$deq; !( ( c == 0 ) | ( !dequeueing$ifc$send__RDY ) );
//METAGUARD; out$first; 1;
//METARULES; RULE$both; RULE$decCtr; RULE$incCtr
`endif
