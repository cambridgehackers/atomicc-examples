`ifndef __grayCounter_GENERATED__VH__
`define __grayCounter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __GrayCounterIfc_DEF__
`define __GrayCounterIfc_DEF__
interface GrayCounterIfc#(width = 10);
    logic increment__ENA;
    logic increment__RDY;
    logic decrement__ENA;
    logic decrement__RDY;
    logic [width - 1:0] readGray;
    logic readGray__RDY;
    logic writeGray__ENA;
    logic [width - 1:0] writeGray$v;
    logic writeGray__RDY;
    logic [width - 1:0] readBin;
    logic readBin__RDY;
    logic writeBin__ENA;
    logic [width - 1:0] writeBin$v;
    logic writeBin__RDY;
    modport server (input  increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    output increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
    modport client (output increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    input  increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
endinterface
`endif
`ifndef __TraceIfc_DEF__
`define __TraceIfc_DEF__
interface TraceIfc#(depth = 1024, sensitivity = 99, width = 4);
    logic  CLK;
    logic  nRST;
    logic  enable;
    logic [width - 1:0] data;
    logic clear__ENA;
    logic clear__RDY;
    modport server (input  CLK, nRST, enable, data, clear__ENA,
                    output clear__RDY);
    modport client (output CLK, nRST, enable, data, clear__ENA,
                    input  clear__RDY);
endinterface
`endif
//METASTART; GrayCounter
//METAINTERNAL; __traceMemory; Trace(width=4,depth=1024,sensitivity=99);
//METAGUARD; increment; 1'd1;
//METAGUARD; decrement; 1'd1;
//METAGUARD; readGray; 1'd1;
//METAGUARD; writeGray; 1'd1;
//METAGUARD; readBin; 1'd1;
//METAGUARD; writeBin; 1'd1;
//METAGUARD; RULE$incdec; increment__ENA != decrement__ENA;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$incdec; RULE$init
`endif
