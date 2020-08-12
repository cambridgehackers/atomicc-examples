`ifndef __MultiCycleProc_GENERATED__VH__
`define __MultiCycleProc_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ExecResult_DEF__
`define __ExecResult_DEF__
typedef struct packed {
    logic [32 - 1:0] data;
    logic [32 - 1:0] addr;
    logic [32 - 1:0] nextPC;
} ExecResult;
`endif
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
`ifndef __Decoder_DEF__
`define __Decoder_DEF__
interface Decoder;
    logic getOp;
    logic [32 - 1:0] getOp$inst;
    logic getOp__RDY;
    logic getArithOp;
    logic [32 - 1:0] getArithOp$inst;
    logic getArithOp__RDY;
    logic getSrc1;
    logic [32 - 1:0] getSrc1$inst;
    logic getSrc1__RDY;
    logic getSrc2;
    logic [32 - 1:0] getSrc2$inst;
    logic getSrc2__RDY;
    logic getDst;
    logic [32 - 1:0] getDst$inst;
    logic getDst__RDY;
    logic getAddr;
    logic [32 - 1:0] getAddr$inst;
    logic getAddr__RDY;
    modport server (input  getOp, getOp$inst, getArithOp, getArithOp$inst, getSrc1, getSrc1$inst, getSrc2, getSrc2$inst, getDst, getDst$inst, getAddr, getAddr$inst,
                    output getOp__RDY, getArithOp__RDY, getSrc1__RDY, getSrc2__RDY, getDst__RDY, getAddr__RDY);
    modport client (output getOp, getOp$inst, getArithOp, getArithOp$inst, getSrc1, getSrc1$inst, getSrc2, getSrc2$inst, getDst, getDst$inst, getAddr, getAddr$inst,
                    input  getOp__RDY, getArithOp__RDY, getSrc1__RDY, getSrc2__RDY, getDst__RDY, getAddr__RDY);
endinterface
`endif
`ifndef __Executer_DEF__
`define __Executer_DEF__
interface Executer;
    logic basicExec;
    logic [32 - 1:0] basicExec$op;
    logic [32 - 1:0] basicExec$src1;
    logic [32 - 1:0] basicExec$src2;
    logic basicExec__RDY;
    modport server (input  basicExec, basicExec$op, basicExec$src1, basicExec$src2,
                    output basicExec__RDY);
    modport client (output basicExec, basicExec$op, basicExec$src1, basicExec$src2,
                    input  basicExec__RDY);
endinterface
`endif
`ifndef __RegFile_DEF__
`define __RegFile_DEF__
interface RegFile;
    logic read;
    logic [32 - 1:0] read$regnum;
    logic read__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$regnum;
    logic [32 - 1:0] write$regval;
    logic write__RDY;
    modport server (input  read, read$regnum, write__ENA, write$regnum, write$regval,
                    output read__RDY, write__RDY);
    modport client (output read, read$regnum, write__ENA, write$regnum, write$regval,
                    input  read__RDY, write__RDY);
endinterface
`endif
`ifndef __IMem_DEF__
`define __IMem_DEF__
interface IMem;
    logic read;
    logic [32 - 1:0] read$pc;
    logic read__RDY;
    modport server (input  read, read$pc,
                    output read__RDY);
    modport client (output read, read$pc,
                    input  read__RDY);
endinterface
`endif
`ifndef __DMem_DEF__
`define __DMem_DEF__
interface DMem;
    logic request__ENA;
    logic [32 - 1:0] request$write_en;
    logic [32 - 1:0] request$addr;
    logic [32 - 1:0] request$data;
    logic request__RDY;
    logic response;
    logic response__RDY;
    modport server (input  request__ENA, request$write_en, request$addr, request$data, response,
                    output request__RDY, response__RDY);
    modport client (output request__ENA, request$write_en, request$addr, request$data, response,
                    input  request__RDY, response__RDY);
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
//METASTART; MultiCycleProc
//METAINVOKE; RULE$decode__ENA; :dec$getAddr;:dec$getArithOp;:dec$getDst;:dec$getOp;:dec$getSrc1;:dec$getSrc2;:pgm$read;
//METAEXCLUSIVE; RULE$decode__ENA; RULE$execArith__ENA
//METAGUARD; RULE$decode; ( d2e_valid == 0 ) && pgm$read__RDY && dec$getOp__RDY && dec$getArithOp__RDY && dec$getSrc1__RDY && dec$getSrc2__RDY && dec$getDst__RDY && dec$getAddr__RDY;
//METAINVOKE; RULE$execArith__ENA; :exec$basicExec;:rf$read;
//METAEXCLUSIVE; RULE$execArith__ENA; RULE$writeBack__ENA
//METAGUARD; RULE$execArith; ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf$read__RDY && exec$basicExec__RDY;
//METAINVOKE; RULE$writeBack__ENA; :rf$write__ENA;
//METABEFORE; RULE$writeBack__ENA; :RULE$execArith__ENA
//METAGUARD; RULE$writeBack; ( e2w_valid == 1 ) && rf$write__RDY;
//METARULES; RULE$decode; RULE$execArith; RULE$writeBack
`endif
