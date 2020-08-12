`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __IVectorTest_DEF__
`define __IVectorTest_DEF__
typedef struct packed {
    logic  ivector;
} IVectorTest;
`endif
`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __ValuePair_DEF__
`define __ValuePair_DEF__
typedef struct packed {
    logic [32 - 1:0] c;
    logic [32 - 1:0] b;
    logic [32 - 1:0] a;
} ValuePair;
`endif
`ifndef __PipeIn_OC_4_DEF__
`define __PipeIn_OC_4_DEF__
interface PipeIn_OC_4#(width = 704);
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
interface PipeOut_OC_5#(width = 704);
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
    logic [((32 + 32) + (32 * 20)) - 1:0] enq$v;
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
    logic [((32 + 32) + (32 * 20)) - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$v,
                    input  say__RDY);
endinterface
`endif
`ifndef __IndIF_DEF__
`define __IndIF_DEF__
interface IndIF;
    logic heard__ENA;
    logic [((32 + 32) + (32 * 20)) - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
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
//METAINTERNAL; element1; Fifo1Base(width=704);
//METAINTERNAL; element2; Fifo1Base(width=704);
//METAINVOKE; in$enq__ENA; !pong:element1$in$enq__ENA;pong:element2$in$enq__ENA;
//METAGUARD; in$enq; ( element2$in$enq__RDY && ( pong || element1$in$enq__RDY ) ) || ( ( !element2$in$enq__RDY ) && ( !( pong || ( !element1$in$enq__RDY ) ) ) );
//METAINVOKE; out$deq__ENA; !pong:element1$out$deq__ENA;pong:element2$out$deq__ENA;
//METAGUARD; out$deq; ( element2$out$deq__RDY && ( pong || element1$out$deq__RDY ) ) || ( ( !element2$out$deq__RDY ) && ( !( pong || ( !element1$out$deq__RDY ) ) ) );
//METAINVOKE; out$first; !pong:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; ( element2$out$first__RDY && ( pong || element1$out$first__RDY ) ) || ( ( !element2$out$first__RDY ) && ( !( pong || ( !element1$out$first__RDY ) ) ) );
//METASTART; IVector
//METAINTERNAL; fifo; FifoPong;
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY;
//METAINVOKE; RULE$respond__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULE$respond; fifo$out$deq__RDY && fifo$out$first__RDY && ind$heard__RDY;
//METARULES; RULE$respond
`endif
