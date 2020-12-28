`ifndef __ExecResult_DEF__
`ifndef YOSYS
`define __ExecResult_DEF__
`endif // YOSYS
typedef struct packed {
    logic [32 - 1:0] data;
    logic [32 - 1:0] addr;
    logic [32 - 1:0] nextPC;
} ExecResult;
`endif
