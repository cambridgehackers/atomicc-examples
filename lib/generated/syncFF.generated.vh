`ifndef __syncFF_GENERATED__VH__
`define __syncFF_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __SyncFFIfc_DEF__
`define __SyncFFIfc_DEF__
interface SyncFFIfc;
    logic  CLK;
    logic  nRST;
    logic  out;
    logic  in;
    modport server (input  CLK, nRST, in,
                    output out);
    modport client (output CLK, nRST, in,
                    input  out);
endinterface
`endif
//METASTART; SyncFF
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
`endif
