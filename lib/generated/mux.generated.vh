`ifndef __mux_GENERATED__VH__
`define __mux_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
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
`ifndef __PipeOut_OC_4_DEF__
`define __PipeOut_OC_4_DEF__
interface PipeOut_OC_4;
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
interface PipeIn_OC_2#(width = 144);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_DEF__
`define __PipeOut_DEF__
interface PipeOut#(width = 144);
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
`ifndef __PipeIn_OC_6_DEF__
`define __PipeIn_OC_6_DEF__
interface PipeIn_OC_6#(width = 16);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_7_DEF__
`define __PipeOut_OC_7_DEF__
interface PipeOut_OC_7#(width = 16);
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
`ifndef __PipeIn_OC_10_DEF__
`define __PipeIn_OC_10_DEF__
interface PipeIn_OC_10;
    logic enq__ENA;
    logic [16 - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_11_DEF__
`define __PipeOut_OC_11_DEF__
interface PipeOut_OC_11;
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
//METASTART; Fifo1
//METAINTERNAL; fifo; Fifo1Base(width=144);
//METAINVOKE; in.enq__ENA; :fifo.in$enq__ENA;
//METAGUARD; in.enq; fifo.in$enq__RDY;
//METAINVOKE; out.deq__ENA; :fifo.out$deq__ENA;
//METAGUARD; out.deq; fifo.out$deq__RDY;
//METAINVOKE; out.first; :fifo.out$first;
//METAGUARD; out.first; fifo.out$first__RDY;
//METASTART; Fifo1_OC_8
//METAINTERNAL; fifo; Fifo1Base(width=16);
//METAINVOKE; in.enq__ENA; :fifo.in$enq__ENA;
//METAGUARD; in.enq; fifo.in$enq__RDY;
//METAINVOKE; out.deq__ENA; :fifo.out$deq__ENA;
//METAGUARD; out.deq; fifo.out$deq__RDY;
//METAINVOKE; out.first; :fifo.out$first;
//METAGUARD; out.first; fifo.out$first__RDY;
//METASTART; MuxPipe
//METAINTERNAL; forwardFifo; Fifo1;
//METAINTERNAL; forwardFifol; Fifo1_OC_8;
//METAINVOKE; in.enq__ENA; :out.enq__ENA;
//METAEXCLUSIVE; in.enq__ENA; RULE$fifoRule__ENA
//METAGUARD; in.enq; !( ( 0 == ( ( forwardFifo.out$first__RDY != 0 ) ^ 1 ) ) || ( !out.enq__RDY ) );
//METAINVOKE; forward.enq__ENA; :forwardFifo.in$enq__ENA;
//METAGUARD; forward.enq; forwardFifo.in$enq__RDY;
//METAINVOKE; RULE$fifoRule__ENA; :forwardFifo.out$deq__ENA;:forwardFifo.out$first;:out.enq__ENA;
//METAGUARD; RULE$fifoRule; !( ( 0 == ( ( in.enq__ENA != 0 ) ^ 1 ) ) || ( !( forwardFifo.out$first__RDY && out.enq__RDY && forwardFifo.out$deq__RDY ) ) );
//METARULES; RULE$fifoRule
`endif
