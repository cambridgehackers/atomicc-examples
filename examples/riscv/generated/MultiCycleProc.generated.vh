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
`ifndef __Decoder_DEF__
`define __Decoder_DEF__
interface Decoder;
    logic [32 - 1:0] getOp;
    logic [32 - 1:0] getOp$inst;
    logic getOp__RDY;
    logic [32 - 1:0] getArithOp;
    logic [32 - 1:0] getArithOp$inst;
    logic getArithOp__RDY;
    logic [32 - 1:0] getSrc1;
    logic [32 - 1:0] getSrc1$inst;
    logic getSrc1__RDY;
    logic [32 - 1:0] getSrc2;
    logic [32 - 1:0] getSrc2$inst;
    logic getSrc2__RDY;
    logic [32 - 1:0] getDst;
    logic [32 - 1:0] getDst$inst;
    logic getDst__RDY;
    logic [32 - 1:0] getAddr;
    logic [32 - 1:0] getAddr$inst;
    logic getAddr__RDY;
    modport server (input  getOp$inst, getArithOp$inst, getSrc1$inst, getSrc2$inst, getDst$inst, getAddr$inst,
                    output getOp, getOp__RDY, getArithOp, getArithOp__RDY, getSrc1, getSrc1__RDY, getSrc2, getSrc2__RDY, getDst, getDst__RDY, getAddr, getAddr__RDY);
    modport client (output getOp$inst, getArithOp$inst, getSrc1$inst, getSrc2$inst, getDst$inst, getAddr$inst,
                    input  getOp, getOp__RDY, getArithOp, getArithOp__RDY, getSrc1, getSrc1__RDY, getSrc2, getSrc2__RDY, getDst, getDst__RDY, getAddr, getAddr__RDY);
endinterface
`endif
`ifndef __Executer_DEF__
`define __Executer_DEF__
interface Executer;
    ExecResult basicExec;
    logic [32 - 1:0] basicExec$op;
    logic [32 - 1:0] basicExec$src1;
    logic [32 - 1:0] basicExec$src2;
    logic basicExec__RDY;
    modport server (input  basicExec$op, basicExec$src1, basicExec$src2,
                    output basicExec, basicExec__RDY);
    modport client (output basicExec$op, basicExec$src1, basicExec$src2,
                    input  basicExec, basicExec__RDY);
endinterface
`endif
`ifndef __RegFile_DEF__
`define __RegFile_DEF__
interface RegFile;
    logic [32 - 1:0] read;
    logic [32 - 1:0] read$regnum;
    logic read__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$regnum;
    logic [32 - 1:0] write$regval;
    logic write__RDY;
    modport server (input  read$regnum, write__ENA, write$regnum, write$regval,
                    output read, read__RDY, write__RDY);
    modport client (output read$regnum, write__ENA, write$regnum, write$regval,
                    input  read, read__RDY, write__RDY);
endinterface
`endif
`ifndef __IMem_DEF__
`define __IMem_DEF__
interface IMem;
    logic [32 - 1:0] read;
    logic [32 - 1:0] read$pc;
    logic read__RDY;
    modport server (input  read$pc,
                    output read, read__RDY);
    modport client (output read$pc,
                    input  read, read__RDY);
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
    logic [32 - 1:0] response;
    logic response__RDY;
    modport server (input  request__ENA, request$write_en, request$addr, request$data,
                    output request__RDY, response, response__RDY);
    modport client (output request__ENA, request$write_en, request$addr, request$data,
                    input  request__RDY, response, response__RDY);
endinterface
`endif
//METASTART; MultiCycleProc
//METAEXCLUSIVE; RULE$decode__ENA; RULE$execArith__ENA
//METAGUARD; RULE$decode; ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
//METAEXCLUSIVE; RULE$execArith__ENA; RULE$writeBack__ENA
//METAGUARD; RULE$execArith; ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
//METAINVOKE; RULE$writeBack__ENA; :rf.write__ENA;
//METAGUARD; RULE$writeBack; ( e2w_valid == 1 ) && rf.write__RDY;
//METARULES; RULE$decode; RULE$execArith; RULE$writeBack
`endif
