`ifndef __configCounter_GENERATED__VH__
`define __configCounter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __ConfigCounterIfc_DEF__
`define __ConfigCounterIfc_DEF__
interface ConfigCounterIfc#(count_sz = 10);
    logic decrement__ENA;
    logic [count_sz - 1:0] decrement$v;
    logic decrement__RDY;
    logic maybeDecrement;
    logic [10 - 1:0] maybeDecrement$v;
    logic maybeDecrement__RDY;
    logic increment__ENA;
    logic [count_sz - 1:0] increment$v;
    logic increment__RDY;
    logic read;
    logic read__RDY;
    logic positive;
    logic positive__RDY;
    modport server (input  decrement__ENA, decrement$v, maybeDecrement, maybeDecrement$v, increment__ENA, increment$v, read, positive,
                    output decrement__RDY, maybeDecrement__RDY, increment__RDY, read__RDY, positive__RDY);
    modport client (output decrement__ENA, decrement$v, maybeDecrement, maybeDecrement$v, increment__ENA, increment$v, read, positive,
                    input  decrement__RDY, maybeDecrement__RDY, increment__RDY, read__RDY, positive__RDY);
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
//METASTART; ConfigCounter
//METAGUARD; decrement; 1;
//METAGUARD; maybeDecrement; 1;
//METAGUARD; increment; 1;
//METAGUARD; read; 1;
//METAGUARD; positive; 1;
//METAGUARD; RULE$react; 1;
//METARULES; RULE$react
`endif
