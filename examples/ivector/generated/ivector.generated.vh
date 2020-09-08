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
    logic [32 - 1:0] say$meth;
    logic [32 - 1:0] say$v;
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
    logic [32 - 1:0] heard$meth;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$meth, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$meth, heard$v,
                    input  heard__RDY);
endinterface
`endif
//METASTART; IVector
//METAINTERNAL; fifo0; FifoPong(width=144);
//METAINTERNAL; fifo1; FifoPong(width=144);
//METAINTERNAL; fifo2; FifoPong(width=144);
//METAINTERNAL; fifo3; FifoPong(width=144);
//METAINTERNAL; fifo4; FifoPong(width=144);
//METAINTERNAL; fifo5; FifoPong(width=144);
//METAINTERNAL; fifo6; FifoPong(width=144);
//METAINTERNAL; fifo7; FifoPong(width=144);
//METAINTERNAL; fifo8; FifoPong(width=144);
//METAINTERNAL; fifo9; FifoPong(width=144);
//METAINVOKE; in.say__ENA; :fifo$in[__inst$Genvar1].enq__ENA;
//METAGUARD; in.say; fifo$in__enq__RDY_or1;
//METAINVOKE; RULE$respond_rule_0__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_0__ENA; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_0; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_1__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_1; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_2__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_2; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_3__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_3; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_4__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_4; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_5__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_5; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_6__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_6; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_7__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_7; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_8__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_8; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METAINVOKE; RULE$respond_rule_9__ENA; :fifo$out[__inst$Genvar1].deq__ENA;:out.heard__ENA;
//METAGUARD; RULE$respond_rule_9; fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
//METARULES; RULE$respond_rule_0; RULE$respond_rule_1; RULE$respond_rule_2; RULE$respond_rule_3; RULE$respond_rule_4; RULE$respond_rule_5; RULE$respond_rule_6; RULE$respond_rule_7; RULE$respond_rule_8; RULE$respond_rule_9
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1Base(width=96);
//METAINTERNAL; element2; Fifo1Base(width=96);
//METAINVOKE; in.enq__ENA; !pong:element1$in.enq__ENA;pong:element2$in.enq__ENA;
//METAGUARD; in.enq; ( element2$in.enq__RDY && ( pong || element1$in.enq__RDY ) ) || ( ( !element2$in.enq__RDY ) && ( !( pong || ( !element1$in.enq__RDY ) ) ) );
//METAINVOKE; out.deq__ENA; !pong:element1$out.deq__ENA;pong:element2$out.deq__ENA;
//METAGUARD; out.deq; ( element2$out.deq__RDY && ( pong || element1$out.deq__RDY ) ) || ( ( !element2$out.deq__RDY ) && ( !( pong || ( !element1$out.deq__RDY ) ) ) );
//METAGUARD; out.first; ( element2$out.first__RDY && ( pong || element1$out.first__RDY ) ) || ( ( !element2$out.first__RDY ) && ( !( pong || ( !element1$out.first__RDY ) ) ) );
`endif
