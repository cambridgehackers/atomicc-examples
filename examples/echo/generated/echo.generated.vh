`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; Echo
//METAINTERNAL; fifo; Fifo1Base(width=32);
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY;
//METAINVOKE; RULE$respond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULE$respond_rule; fifo$out$deq__RDY && fifo$out$first__RDY && ind$heard__RDY;
//METARULES; RULE$respond_rule
//METASTART; EchoInd
`endif
