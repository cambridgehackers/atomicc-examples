`ifndef __ProcessData_DEF__
`ifndef YOSYS
`define __ProcessData_DEF__
`endif // YOSYS
typedef struct packed {
    logic [3 - 1:0] state;
    logic [16 - 1:0] IPA;
    logic [4 - 1:0] ticket;
} ProcessData;
`endif
