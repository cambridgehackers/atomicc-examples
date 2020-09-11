`ifndef __zynqTop_GENERATED__VH__
`define __zynqTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ZynqInterruptT_DEF__
`define __ZynqInterruptT_DEF__
interface ZynqInterruptT;
    logic  CLK;
    logic  nRST;
    logic  interrupt;
    modport server (input  CLK, nRST,
                    output interrupt);
    modport client (output CLK, nRST,
                    input  interrupt);
endinterface
`endif
`ifndef __MaxiO_DEF__
`define __MaxiO_DEF__
interface MaxiO;
    logic AR__ENA;
    logic [32 - 1:0] AR$addr;
    logic [12 - 1:0] AR$id;
    logic [4 - 1:0] AR$len;
    logic AR__RDY;
    logic AW__ENA;
    logic [32 - 1:0] AW$addr;
    logic [12 - 1:0] AW$id;
    logic [4 - 1:0] AW$len;
    logic AW__RDY;
    logic W__ENA;
    logic [32 - 1:0] W$data;
    logic [12 - 1:0] W$id;
    logic  W$last;
    logic W__RDY;
    modport server (input  AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    output AR__RDY, AW__RDY, W__RDY);
    modport client (output AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    input  AR__RDY, AW__RDY, W__RDY);
endinterface
`endif
`ifndef __MaxiI_DEF__
`define __MaxiI_DEF__
interface MaxiI;
    logic R__ENA;
    logic [32 - 1:0] R$data;
    logic [12 - 1:0] R$id;
    logic  R$last;
    logic [2 - 1:0] R$resp;
    logic R__RDY;
    logic B__ENA;
    logic [12 - 1:0] B$id;
    logic [2 - 1:0] B$resp;
    logic B__RDY;
    modport server (input  R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    output R__RDY, B__RDY);
    modport client (output R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    input  R__RDY, B__RDY);
endinterface
`endif
`ifndef __MbufgBUFG_DEF__
`define __MbufgBUFG_DEF__
interface MbufgBUFG;
    logic  I;
    logic  O;
    modport server (input  I,
                    output O);
    modport client (output I,
                    input  O);
endinterface
`endif
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
`ifndef __ZynqClock_DEF__
`define __ZynqClock_DEF__
interface ZynqClock;
    logic [15 - 1:0] DDR_Addr;
    logic [3 - 1:0] DDR_BankAddr;
    logic  DDR_CAS_n;
    logic  DDR_CKE;
    logic  DDR_Clk_n;
    logic  DDR_Clk_p;
    logic  DDR_CS_n;
    logic [4 - 1:0] DDR_DM;
    logic [32 - 1:0] DDR_DQ;
    logic [4 - 1:0] DDR_DQS_n;
    logic [4 - 1:0] DDR_DQS_p;
    logic  DDR_DRSTB;
    logic  DDR_ODT;
    logic  DDR_RAS_n;
    logic  FIXED_IO_ddr_vrn;
    logic  FIXED_IO_ddr_vrp;
    logic  DDR_WEB;
    logic  FIXED_IO_ps_clk;
    logic  FIXED_IO_ps_porb;
    logic  FIXED_IO_ps_srstb;
endinterface
`endif
`ifndef __ZynqInterrupt_DEF__
`define __ZynqInterrupt_DEF__
interface ZynqInterrupt;
    logic  interrupt;
    logic  CLK;
    logic  nRST;
    modport server (input  interrupt, CLK, nRST);
    modport client (output interrupt, CLK, nRST);
endinterface
`endif
`ifndef __Pps7fclk_DEF__
`define __Pps7fclk_DEF__
interface Pps7fclk;
    logic [4 - 1:0] CLK;
    logic [4 - 1:0] CLKTRIGN;
    logic [4 - 1:0] RESETN;
    modport server (input  CLKTRIGN,
                    output CLK, RESETN);
    modport client (output CLKTRIGN,
                    input  CLK, RESETN);
endinterface
`endif
`ifndef __P7WrapIfc_DEF__
`define __P7WrapIfc_DEF__
interface P7WrapIfc;
    logic [54 - 1:0] MIO;
endinterface
`endif
`ifndef __ZynqTopIFC_DEF__
`define __ZynqTopIFC_DEF__
interface ZynqTopIFC;
    logic [54 - 1:0] MIO;
endinterface
`endif
//METASTART; P7Wrap
//METAINTERNAL; pps; PS7;
//METAINTERNAL; pclockTop; ClockTop;
//METAGUARD; MAXIGP0_I.R; 0 != pps$MAXIGP0RREADY;
//METAGUARD; MAXIGP0_I.B; 0 != pps$MAXIGP0BREADY;
//METAGUARD; RULE$init; 1;
//METAINVOKE; RULE$gp0ar__ENA; :MAXIGP0_O.AR__ENA;
//METAGUARD; RULE$gp0ar; !( ( 0 == pps$MAXIGP0ARVALID ) || ( !MAXIGP0_O.AR__RDY ) );
//METAINVOKE; RULE$gp0aw__ENA; :MAXIGP0_O.AW__ENA;
//METAGUARD; RULE$gp0aw; !( ( 0 == pps$MAXIGP0AWVALID ) || ( !MAXIGP0_O.AW__RDY ) );
//METAINVOKE; RULE$gp0w__ENA; :MAXIGP0_O.W__ENA;
//METAGUARD; RULE$gp0w; !( ( 0 == pps$MAXIGP0WVALID ) || ( !MAXIGP0_O.W__RDY ) );
//METARULES; RULE$init; RULE$gp0ar; RULE$gp0aw; RULE$gp0w
//METASTART; ZynqTop
//METAINTERNAL; ps7_ps7_foo; P7Wrap;
//METAINTERNAL; test; AxiTop;
//METAINTERNAL; ps7_fclk_0_c; BUFG;
//METAINTERNAL; ps7_freset_0_r; BUFG;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
//METACONNECT; test$MAXIGP0_O.AR__ENA; ps7_ps7_foo$MAXIGP0_O.AR__ENA
//METACONNECT; test$MAXIGP0_O.AR__RDY; ps7_ps7_foo$MAXIGP0_O.AR__RDY
//METACONNECT; test$MAXIGP0_O.AW__ENA; ps7_ps7_foo$MAXIGP0_O.AW__ENA
//METACONNECT; test$MAXIGP0_O.AW__RDY; ps7_ps7_foo$MAXIGP0_O.AW__RDY
//METACONNECT; test$MAXIGP0_O.W__ENA; ps7_ps7_foo$MAXIGP0_O.W__ENA
//METACONNECT; test$MAXIGP0_O.W__RDY; ps7_ps7_foo$MAXIGP0_O.W__RDY
//METACONNECT; test$MAXIGP0_I.R__ENA; ps7_ps7_foo$MAXIGP0_I.R__ENA
//METACONNECT; test$MAXIGP0_I.R__RDY; ps7_ps7_foo$MAXIGP0_I.R__RDY
//METACONNECT; test$MAXIGP0_I.B__ENA; ps7_ps7_foo$MAXIGP0_I.B__ENA
//METACONNECT; test$MAXIGP0_I.B__RDY; ps7_ps7_foo$MAXIGP0_I.B__RDY
`endif
