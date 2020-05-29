`ifndef __mux_GENERATED__VH__
`define __mux_GENERATED__VH__

//METASTART; MuxPipe
//METAINTERNAL; forwardFifo; Fifo1Base(width=144);
//METAINTERNAL; forwardFifol; Fifo1Base(width=16);
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAEXCLUSIVE; in$enq__ENA; RULE$fifoRule__ENA
//METAGUARD; in$enq; !( forwardFifo$out$first__RDY || ( !out$enq__RDY ) );
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; RULE$fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAGUARD; RULE$fifoRule; ( in$enq__ENA == 0 ) && forwardFifo$out$first__RDY && out$enq__RDY && forwardFifo$out$deq__RDY;
//METARULES; RULE$fifoRule
`endif
