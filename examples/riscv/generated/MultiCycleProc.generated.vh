`include "atomicclib.vh"

`ifndef __ExecResult_DEF__
`define __ExecResult_DEF__
typedef struct packed {
    logic [32 - 1:0] data;
    logic [32 - 1:0] addr;
    logic [32 - 1:0] nextPC;
} ExecResult;
`endif
//METASTART; MultiCycleProc
//METAEXCLUSIVE; RULE$decode__ENA; RULE$execArith__ENA
//METAGUARD; RULE$decode; ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
//METAEXCLUSIVE; RULE$execArith__ENA; RULE$writeBack__ENA
//METAGUARD; RULE$execArith; ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
//METAINVOKE; RULE$writeBack__ENA; :rf.write__ENA;
//METAGUARD; RULE$writeBack; ( e2w_valid == 1 ) && rf.write__RDY;
//METARULES; RULE$decode; RULE$execArith; RULE$writeBack
