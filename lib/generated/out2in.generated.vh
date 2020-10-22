`ifndef __out2in_GENERATED__VH__
`define __out2in_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; Out2InBase
//METAINVOKE; RULE$copyRule__ENA; :in.deq__ENA;:out.enq__ENA;
//METAGUARD; RULE$copyRule; in.first__RDY && out.enq__RDY && in.deq__RDY;
//METARULES; RULE$copyRule
//METASTART; Out2InLast
//METAINVOKE; RULE$copyRule__ENA; :in.deq__ENA;:out.enq__ENA;
//METAGUARD; RULE$copyRule; in.first__RDY && in.last__RDY && out.enq__RDY && in.deq__RDY;
//METARULES; RULE$copyRule
`endif
