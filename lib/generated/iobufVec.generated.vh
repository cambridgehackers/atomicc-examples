`ifndef __iobufVec_GENERATED__VH__
`define __iobufVec_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __MIOBUF_DEF__
`define __MIOBUF_DEF__
interface MIOBUF;
    logic  I;
    logic  IO;
    logic  O;
    logic  T;
    modport server (input  I, T,
                    output O);
    modport client (output I, T,
                    input  O);
endinterface
`endif
`ifndef __IobufVecPins_DEF__
`define __IobufVecPins_DEF__
interface IobufVecPins#(iovecWidth = 999999);
    logic [999999 - 1:0] IO;
    logic [999999 - 1:0] I;
    logic [999999 - 1:0] O;
    logic  T;
    modport server (input  I, T,
                    output O);
    modport client (output I, T,
                    input  O);
endinterface
`endif
//METASTART; IobufVec
//METAINTERNAL; iobufs0; IOBUF;
//METAGUARD; RULE$iobufs; 1;
//METARULES; RULE$iobufs
`endif
