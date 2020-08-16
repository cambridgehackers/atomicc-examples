`ifndef __vsimTop_GENERATED__VH__
`define __vsimTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __VsimInterface_DEF__
`define __VsimInterface_DEF__
interface VsimInterface;
    logic  CLK;
    logic  nRST;
    logic  CLK_derivedClock;
    logic  nRST_derivedReset;
    logic  CLK_sys_clk;
    modport server (input  CLK_derivedClock, nRST_derivedReset, CLK_sys_clk);
    modport client (output CLK_derivedClock, nRST_derivedReset, CLK_sys_clk);
endinterface
`endif
//METASTART; VsimTop
//METAINTERNAL; user; UserTop;
//METAINTERNAL; sink_0; VsimReceive(width=32);
//METAINTERNAL; source_0; VsimSend(width=32);
//METACONNECT; user$write.enq__ENA; sink_0$port.enq__ENA
//METACONNECT; user$write.enq__RDY; sink_0$port.enq__RDY
//METACONNECT; user$read.enq__ENA; source_0$port.enq__ENA
//METACONNECT; user$read.enq__RDY; source_0$port.enq__RDY
`endif
