`ifndef __ReadResp_DEF__
`ifndef YOSYS
`define __ReadResp_DEF__
`endif // YOSYS
typedef struct packed {
    logic [32 - 1:0] data;
    logic [6 - 1:0] id;
} ReadResp;
`endif
