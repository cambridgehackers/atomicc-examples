`ifndef __SCounter_GENERATED__VH__
`define __SCounter_GENERATED__VH__

//METASTART; SizedDFIFOF
//METAINTERNAL; enqueueing; PulseWire;
//METAINTERNAL; dequeueing; PulseWire;
//METAGUARD; RULE$both; !( 0 == ( dequeueing$value && enqueueing$value ) );
//METAEXCLUSIVE; RULE$decCtr__ENA; RULE$incCtr__ENA
//METAGUARD; RULE$decCtr; !( 0 == ( dequeueing$value && ( enqueueing$value ^ 1 ) ) );
//METAGUARD; RULE$incCtr; !( 0 == ( enqueueing$value && ( dequeueing$value ^ 1 ) ) );
//METAINVOKE; in$enq__ENA; :enqueueing$send__ENA;
//METAGUARD; in$enq; !( ( c == 999999 ) | ( !enqueueing$send__RDY ) );
//METAINVOKE; out$deq__ENA; :dequeueing$send__ENA;
//METAGUARD; out$deq; !( ( c == 0 ) | ( !dequeueing$send__RDY ) );
//METAGUARD; out$first; 1;
//METARULES; RULE$both; RULE$decCtr; RULE$incCtr
`endif
