`ifndef __iobufVec_GENERATED__VH__
`define __iobufVec_GENERATED__VH__
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
//METASTART; IobufVec
//METAINTERNAL; iobufs0; IOBUF;
//METAGUARD; RULE$iobufs; 1;
//METARULES; RULE$iobufs
`endif
