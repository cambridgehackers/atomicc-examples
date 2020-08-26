`ifndef __precision_GENERATED__VH__
`define __precision_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __IVectorRequest_DEF__
`define __IVectorRequest_DEF__
interface IVectorRequest;
    logic say__ENA;
    logic [6 - 1:0] say$meth;
    logic [4 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$meth, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$meth, say$v,
                    input  say__RDY);
endinterface
`endif
`ifndef __IVectorIndication_DEF__
`define __IVectorIndication_DEF__
interface IVectorIndication;
    logic heard__ENA;
    logic [6 - 1:0] heard$meth;
    logic [4 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$meth, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$meth, heard$v,
                    input  heard__RDY);
endinterface
`endif
//METASTART; IVector
//METAINTERNAL; fifo; Fifo1Base(width=10);
//METAINVOKE; request.say__ENA; :fifo$in.enq__ENA;
//METAGUARD; request.say; fifo$in.enq__RDY;
//METAINVOKE; RULE$respond__ENA; :fifo$out.deq__ENA;:ind.heard__ENA;
//METAGUARD; RULE$respond; fifo$out.first__RDY && fifo$out.deq__RDY && ind.heard__RDY;
//METARULES; RULE$respond
`endif
