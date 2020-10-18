`ifndef __resetInverter_GENERATED__VH__
`define __resetInverter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __MResetInverterResetInverter_DEF__
`define __MResetInverterResetInverter_DEF__
interface MResetInverterResetInverter;
    logic  RESET_IN;
    logic  RESET_OUT;
    modport server (input  RESET_IN,
                    output RESET_OUT);
    modport client (output RESET_IN,
                    input  RESET_OUT);
endinterface
`endif
//METASTART; ResetInverter
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
`endif
