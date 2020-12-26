`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
//METASTART; atomiccDummy
