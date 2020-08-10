`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __IVectorTest_DEF__
`define __IVectorTest_DEF__
typedef struct packed {
    logic [((1 * 10) + 32) - 1:0] ivector;
} IVectorTest;
`endif
`ifndef __ValuePair_DEF__
`define __ValuePair_DEF__
typedef struct packed {
    logic [32 - 1:0] a;
    logic [32 - 1:0] b;
    logic [32 - 1:0] c;
} ValuePair;
`endif
`ifndef __PipeIn_OC_4_DEF__
`define __PipeIn_OC_4_DEF__
interface PipeIn_OC_4#(width = 96);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_5_DEF__
`define __PipeOut_OC_5_DEF__
interface PipeOut_OC_5#(width = 96);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_2_DEF__
`define __PipeIn_OC_2_DEF__
interface PipeIn_OC_2;
    logic enq__ENA;
    logic [((32 + 32) + 32) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_DEF__
`define __PipeOut_DEF__
interface PipeOut;
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
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
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; FifoPong
//METAINTERNAL; element1; Fifo1Base(width=96);
//METAINTERNAL; element2; Fifo1Base(width=96);
//METAINVOKE; in$enq__ENA; !pong:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( element2$in$enq__RDY && ( pong || element1$in$enq__RDY ) ) || ( ( !element2$in$enq__RDY ) && ( !( pong || ( !element1$in$enq__RDY ) ) ) );
//METAINVOKE; out$deq__ENA; !pong:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( element2$out$deq__RDY && ( pong || element1$out$deq__RDY ) ) || ( ( !element2$out$deq__RDY ) && ( !( pong || ( !element1$out$deq__RDY ) ) ) );
//METAINVOKE; out$first; !pong:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; ( element2$out$first__RDY && ( pong || element1$out$first__RDY ) ) || ( ( !element2$out$first__RDY ) && ( !( pong || ( !element1$out$first__RDY ) ) ) );
//METASTART; IVector
//METAINTERNAL; fifo0; FifoPong;
//METAINTERNAL; fifo1; FifoPong;
//METAINTERNAL; fifo2; FifoPong;
//METAINTERNAL; fifo3; FifoPong;
//METAINTERNAL; fifo4; FifoPong;
//METAINTERNAL; fifo5; FifoPong;
//METAINTERNAL; fifo6; FifoPong;
//METAINTERNAL; fifo7; FifoPong;
//METAINTERNAL; fifo8; FifoPong;
//METAINTERNAL; fifo9; FifoPong;
//METAINVOKE; in$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$say; fifo$in$enq__RDY_or1;
//METAINVOKE; RULE$respond_rule_0__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_0__ENA; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_0; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_1__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_1__ENA; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_1; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_2__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_2__ENA; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_2; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_3__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_3__ENA; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_3; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_4__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_4__ENA; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_4; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_5__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_5__ENA; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_5; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_6__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_6__ENA; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_6; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_7__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_7__ENA; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_7; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_8__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAEXCLUSIVE; RULE$respond_rule_8__ENA; RULE$respond_rule_9__ENA
//METAGUARD; RULE$respond_rule_8; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METAINVOKE; RULE$respond_rule_9__ENA; :fifo$out$deq__ENA;:fifo$out$first;:out$heard__ENA;
//METAGUARD; RULE$respond_rule_9; fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
//METARULES; RULE$respond_rule_0; RULE$respond_rule_1; RULE$respond_rule_2; RULE$respond_rule_3; RULE$respond_rule_4; RULE$respond_rule_5; RULE$respond_rule_6; RULE$respond_rule_7; RULE$respond_rule_8; RULE$respond_rule_9
`endif
