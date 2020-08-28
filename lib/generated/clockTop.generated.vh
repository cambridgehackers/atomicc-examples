`ifndef __clockTop_GENERATED__VH__
`define __clockTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ClockIfc_DEF__
`define __ClockIfc_DEF__
interface ClockIfc;
    logic  CLK;
    logic  nRST;
    logic  clockOut;
    modport server (input  CLK, nRST,
                    output clockOut);
    modport client (output CLK, nRST,
                    input  clockOut);
endinterface
`endif
//METASTART; ClockTop
//METAINTERNAL; ps7_clockGen_pll; MMCME2_ADV;
//METAINTERNAL; rinverter; ResetInverter;
//METAINTERNAL; clkbuf; BUFG;
//METAINTERNAL; clkbuf0; BUFG;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
`endif
