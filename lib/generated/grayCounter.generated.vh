`ifndef __grayCounter_GENERATED__VH__
`define __grayCounter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
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
`ifndef __GrayCounterIfc_DEF__
`define __GrayCounterIfc_DEF__
interface GrayCounterIfc#(width = 10);
    logic increment__ENA;
    logic increment__RDY;
    logic decrement__ENA;
    logic decrement__RDY;
    logic readGray;
    logic readGray__RDY;
    logic writeGray__ENA;
    logic [width - 1:0] writeGray$v;
    logic writeGray__RDY;
    logic readBin;
    logic readBin__RDY;
    logic writeBin__ENA;
    logic [width - 1:0] writeBin$v;
    logic writeBin__RDY;
    modport server (input  increment__ENA, decrement__ENA, readGray, writeGray__ENA, writeGray$v, readBin, writeBin__ENA, writeBin$v,
                    output increment__RDY, decrement__RDY, readGray__RDY, writeGray__RDY, readBin__RDY, writeBin__RDY);
    modport client (output increment__ENA, decrement__ENA, readGray, writeGray__ENA, writeGray$v, readBin, writeBin__ENA, writeBin$v,
                    input  increment__RDY, decrement__RDY, readGray__RDY, writeGray__RDY, readBin__RDY, writeBin__RDY);
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
//METASTART; GrayCounter
//METAGUARD; increment; 1;
//METAGUARD; decrement; 1;
//METAGUARD; readGray; 1;
//METAGUARD; writeGray; 1;
//METAGUARD; readBin; 1;
//METAGUARD; writeBin; 1;
//METAGUARD; RULE$incdec; increment__ENA != decrement__ENA;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$incdec; RULE$init
`endif
