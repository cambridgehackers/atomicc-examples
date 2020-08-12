`ifndef __vsimTop_GENERATED__VH__
`define __vsimTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeInB_DEF__
`define __PipeInB_DEF__
interface PipeInB#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic  enq$last;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$last,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$last,
                    input  enq__RDY);
endinterface
`endif
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
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic NOCDataH enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
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
