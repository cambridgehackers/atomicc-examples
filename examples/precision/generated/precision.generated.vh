`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__

//METASTART; IVector
//METAEXTERNAL; ind; IVectorIndication;
//METAINTERNAL; fifo; Fifo1Base(width=10);
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METAINVOKE; RULE$respond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULE$respond; fifo$out$first__RDY & fifo$out$deq__RDY & ind$heard__RDY;
//METARULES; RULE$respond
`endif
