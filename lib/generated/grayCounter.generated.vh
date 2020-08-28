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
