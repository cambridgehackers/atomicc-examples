`ifndef __fifo_GENERATED__VH__
`define __fifo_GENERATED__VH__

//METASTART; Fifo1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; FifoB1Base
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !( ( ( full ^ 1 ) | out$deq__ENA ) == 0 );
//METAGUARD; out$deq; full || in$enq__ENA;
//METAGUARD; out$first; full || in$enq__ENA;
//METASTART; FifoPBase
//METAINTERNAL; fifo; Fifo1Base(width=999999);
//METAINTERNAL; base; Out2InBase(width=999999);
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METACONNECT; fifo$out$deq__ENA; out$deq__ENA
//METACONNECT; fifo$out$deq__RDY; out$deq__RDY
//METACONNECT; fifo$out$first; out$first
//METACONNECT; fifo$out$first__RDY; out$first__RDY
`endif
