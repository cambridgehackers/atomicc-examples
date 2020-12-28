`ifndef __NOCDataH_DEF__
`ifndef YOSYS
`define __NOCDataH_DEF__
`endif // YOSYS
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
