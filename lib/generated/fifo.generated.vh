`ifndef __fifo_GENERATED__VH__
`define __fifo_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; Fifo1Base
//METAEXCLUSIVE; in.enq__ENA; out.deq__ENA
//METAGUARD; in.enq; 0 != ( full ^ 1 );
//METAGUARD; out.deq; 0 != full;
//METAGUARD; out.first; 0 != full;
//METASTART; FifoB1Base
//METAEXCLUSIVE; in.enq__ENA; out.deq__ENA
//METAGUARD; in.enq; ( ( full ^ 1 ) | out.deq__ENA ) != 0;
//METAGUARD; out.deq; full | in.enq__ENA;
//METAGUARD; out.first; full | in.enq__ENA;
//METASTART; FifoPBase
//METAINTERNAL; fifo; Fifo1Base(width=32);
//METAINTERNAL; base; Out2InBase(width=32);
//METAINVOKE; in.enq__ENA; :fifo.in$enq__ENA;
//METAGUARD; in.enq; fifo.in$enq__RDY;
//METACONNECT; base$in.deq__ENA; fifo$out.deq__ENA
//METACONNECT; base$in.deq__RDY; fifo$out.deq__RDY
//METACONNECT; base$in.first; fifo$out.first
//METACONNECT; base$in.first__RDY; fifo$out.first__RDY
//METACONNECT; base$out.enq__ENA; out.enq__ENA
//METACONNECT; base$out.enq__RDY; out.enq__RDY
`endif
