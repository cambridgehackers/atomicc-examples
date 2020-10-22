`ifndef __atomicc_GENERATED__VH__
`define __atomicc_GENERATED__VH__
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
interface PipeIn#(width = 32);
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
interface PipeOut#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic [width - 1:0] first;
    logic first__RDY;
    modport server (input  deq__ENA,
                    output deq__RDY, first, first__RDY);
    modport client (output deq__ENA,
                    input  deq__RDY, first, first__RDY);
endinterface
`endif
`ifndef __PipeInLast_DEF__
`define __PipeInLast_DEF__
interface PipeInLast#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic  enq$last;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$last,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$last,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOutLast_DEF__
`define __PipeOutLast_DEF__
interface PipeOutLast#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic [width - 1:0] first;
    logic first__RDY;
    logic  last;
    logic last__RDY;
    modport server (input  deq__ENA,
                    output deq__RDY, first, first__RDY, last, last__RDY);
    modport client (output deq__ENA,
                    input  deq__RDY, first, first__RDY, last, last__RDY);
endinterface
`endif
`ifndef __PipeInLength_DEF__
`define __PipeInLength_DEF__
interface PipeInLength#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic [16 - 1:0] enq$size;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$size,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$size,
                    input  enq__RDY);
endinterface
`endif
//METASTART; atomiccDummy
`endif
