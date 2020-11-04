`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __IVectorTest_DEF__
`define __IVectorTest_DEF__
typedef struct packed {
    IVector ivector;
} IVectorTest;
`endif
`ifndef __ValuePair_DEF__
`define __ValuePair_DEF__
typedef struct packed {
    logic [32 - 1:0] c;
    logic [32 - 1:0] b;
    logic [32 - 1:0] a;
} ValuePair;
`endif
`ifndef __IVectorRequest_DEF__
`define __IVectorRequest_DEF__
interface IVectorRequest;
    logic say__ENA;
    ValuePair say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$v,
                    input  say__RDY);
endinterface
`endif
`ifndef __IVectorIndication_DEF__
`define __IVectorIndication_DEF__
interface IVectorIndication;
    logic heard__ENA;
    ValuePair heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
                    input  heard__RDY);
endinterface
`endif
//METASTART; IVector
//METAINTERNAL; fifo; FifoPong(width=704);
//METAINVOKE; request.say__ENA; :fifo$in.enq__ENA;
//METAGUARD; request.say; fifo$in.enq__RDY;
//METAINVOKE; RULE$respond__ENA; :fifo$out.deq__ENA;:indication.heard__ENA;
//METAGUARD; RULE$respond; fifo$out.deq__RDY && fifo$out.first__RDY && indication.heard__RDY;
//METARULES; RULE$respond
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1Base(width=704);
//METAINTERNAL; element2; Fifo1Base(width=704);
//METAINVOKE; in.enq__ENA; !pong:element1$in.enq__ENA;pong:element2$in.enq__ENA;
//METAGUARD; in.enq; ( element2$in.enq__RDY && ( pong || element1$in.enq__RDY ) ) || ( ( !element2$in.enq__RDY ) && ( !pong ) && element1$in.enq__RDY );
//METAINVOKE; out.deq__ENA; !pong:element1$out.deq__ENA;pong:element2$out.deq__ENA;
//METAGUARD; out.deq; ( element2$out.deq__RDY && ( pong || element1$out.deq__RDY ) ) || ( ( !element2$out.deq__RDY ) && ( !pong ) && element1$out.deq__RDY );
//METAGUARD; out.first; ( element2$out.first__RDY && ( pong || element1$out.first__RDY ) ) || ( ( !element2$out.first__RDY ) && ( !pong ) && element1$out.first__RDY );
`endif
