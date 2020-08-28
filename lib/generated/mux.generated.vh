`ifndef __mux_GENERATED__VH__
`define __mux_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; MuxPipe
//METAINTERNAL; forwardFifo; Fifo1Base(width=144);
//METAINVOKE; in.enq__ENA; :out.enq__ENA;
//METAEXCLUSIVE; in.enq__ENA; RULE$fifoRule__ENA
//METAGUARD; in.enq; !( ( 0 == ( ( forwardFifo$out.first__RDY != 0 ) ^ 1 ) ) || ( !out.enq__RDY ) );
//METAINVOKE; forward.enq__ENA; :forwardFifo$in.enq__ENA;
//METAGUARD; forward.enq; forwardFifo$in.enq__RDY;
//METAINVOKE; RULE$fifoRule__ENA; :forwardFifo$out.deq__ENA;:out.enq__ENA;
//METAGUARD; RULE$fifoRule; !( ( 0 == ( ( in.enq__ENA != 0 ) ^ 1 ) ) || ( !( forwardFifo$out.first__RDY && out.enq__RDY && forwardFifo$out.deq__RDY ) ) );
//METARULES; RULE$fifoRule
`endif
