`ifndef __mimo_GENERATED__VH__
`define __mimo_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; MIMO
//METAINTERNAL; gear; MIMOBase(widthIn=32,widthOut=128);
//METAINVOKE; in.enq__ENA; :gear.in$enq__ENA;
//METAGUARD; in.enq; gear.in$enq__RDY;
//METAINVOKE; out.deq__ENA; :gear.out$deq__ENA;
//METAGUARD; out.deq; gear.out$deq__RDY;
//METAINVOKE; out.first; :gear.out$first;
//METAGUARD; out.first; gear.out$first__RDY;
//METASTART; MIMOBase
//METAEXCLUSIVE; out.deq__ENA; in.enq__ENA
//METAGUARD; out.deq; 0 != ( c >= widthOut );
//METAGUARD; out.first; 0 != ( c >= widthOut );
//METAGUARD; in.enq; 0 != ( ( c >= widthOut ) ^ 1 );
`endif
