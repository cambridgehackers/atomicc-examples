`ifndef __hdmi_GENERATED__VH__
`define __hdmi_GENERATED__VH__
`include "atomicclib.vh"

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
`ifndef __ClockImageonIfc_DEF__
`define __ClockImageonIfc_DEF__
interface ClockImageonIfc;
    logic  CLK;
    logic  nRST;
    logic  hdmiClock;
    logic  imageonClock;
    modport server (input  CLK, nRST,
                    output hdmiClock, imageonClock);
    modport client (output CLK, nRST,
                    input  hdmiClock, imageonClock);
endinterface
`endif
`ifndef __EchoRequest_DEF__
`define __EchoRequest_DEF__
interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic muxreset__ENA;
    logic  muxreset$v;
    logic muxreset__RDY;
    logic say2__ENA;
    logic [16 - 1:0] say2$a;
    logic [16 - 1:0] say2$b;
    logic say2__RDY;
    logic setLeds__ENA;
    logic [8 - 1:0] setLeds$v;
    logic setLeds__RDY;
    modport server (input  say__ENA, say$v, muxreset__ENA, muxreset$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    output say__RDY, muxreset__RDY, say2__RDY, setLeds__RDY);
    modport client (output say__ENA, say$v, muxreset__ENA, muxreset$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    input  say__RDY, muxreset__RDY, say2__RDY, setLeds__RDY);
endinterface
`endif
`ifndef __EchoIndication_DEF__
`define __EchoIndication_DEF__
interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    logic heard2__ENA;
    logic [16 - 1:0] heard2$a;
    logic [16 - 1:0] heard2$b;
    logic heard2__RDY;
    logic heard3__ENA;
    logic [16 - 1:0] heard3$a;
    logic [32 - 1:0] heard3$b;
    logic [32 - 1:0] heard3$c;
    logic [16 - 1:0] heard3$d;
    logic heard3__RDY;
    modport server (input  heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    output heard__RDY, heard2__RDY, heard3__RDY);
    modport client (output heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    input  heard__RDY, heard2__RDY, heard3__RDY);
endinterface
`endif
`ifndef __EchoIfc_DEF__
`define __EchoIfc_DEF__
interface EchoIfc;
    logic  CLK;
    logic  nRST;
    logic  fmc_video_clk1_v;
    logic  i2c_mux_reset_n;
    logic  adv7511_clk;
    logic [36 - 1:0] adv7511_d;
    logic  adv7511_de;
    logic  adv7511_hs;
    logic  adv7511_vs;
    modport server (input  CLK, nRST, fmc_video_clk1_v,
                    output i2c_mux_reset_n, adv7511_clk, adv7511_d, adv7511_de, adv7511_hs, adv7511_vs);
    modport client (output CLK, nRST, fmc_video_clk1_v,
                    input  i2c_mux_reset_n, adv7511_clk, adv7511_d, adv7511_de, adv7511_hs, adv7511_vs);
endinterface
`endif
`ifndef __HdmiBlockIfc_DEF__
`define __HdmiBlockIfc_DEF__
interface HdmiBlockIfc;
    logic  CLK;
    logic  nRST;
    logic [36 - 1:0] adv7511_d;
    logic  adv7511_de;
    logic  adv7511_hs;
    logic  adv7511_vs;
    modport server (input  CLK, nRST,
                    output adv7511_d, adv7511_de, adv7511_hs, adv7511_vs);
    modport client (output CLK, nRST,
                    input  adv7511_d, adv7511_de, adv7511_hs, adv7511_vs);
endinterface
`endif
`ifndef __HdmiDataIfc_DEF__
`define __HdmiDataIfc_DEF__
interface HdmiDataIfc#(heightAddr = 13, widthAddr = 12);
    logic setXY__ENA;
    logic [widthAddr - 1:0] setXY$x;
    logic [heightAddr - 1:0] setXY$y;
    logic  setXY$dataEnable;
    logic setXY__RDY;
    modport server (input  setXY__ENA, setXY$x, setXY$y, setXY$dataEnable,
                    output setXY__RDY);
    modport client (output setXY__ENA, setXY$x, setXY$y, setXY$dataEnable,
                    input  setXY__RDY);
endinterface
`endif
`ifndef __HdmiPatternIfc_DEF__
`define __HdmiPatternIfc_DEF__
interface HdmiPatternIfc#(heightAddr = 12, widthAddr = 12);
    logic setup__ENA;
    logic [widthAddr - 1:0] setup$aactivePixels;
    logic [heightAddr - 1:0] setup$aactiveLines;
    logic [8 - 1:0] setup$apattern;
    logic [20 - 1:0] setup$arampStep;
    logic setup__RDY;
    logic [36 - 1:0] data;
    logic data__RDY;
    modport server (input  setup__ENA, setup$aactivePixels, setup$aactiveLines, setup$apattern, setup$arampStep,
                    output setup__RDY, data, data__RDY);
    modport client (output setup__ENA, setup$aactivePixels, setup$aactiveLines, setup$apattern, setup$arampStep,
                    input  setup__RDY, data, data__RDY);
endinterface
`endif
`ifndef __HdmiSyncIfc_DEF__
`define __HdmiSyncIfc_DEF__
interface HdmiSyncIfc#(heightAddr = 12, widthAddr = 12);
    logic  dataEnable;
    logic dataEnable__RDY;
    logic  hSync;
    logic hSync__RDY;
    logic  vSync;
    logic vSync__RDY;
    logic setup__ENA;
    logic [widthAddr - 1:0] setup$ahEnd;
    logic [widthAddr - 1:0] setup$ahFrontEnd;
    logic [widthAddr - 1:0] setup$ahBackSync;
    logic [widthAddr - 1:0] setup$ahSyncWidth;
    logic [heightAddr - 1:0] setup$avEnd;
    logic [heightAddr - 1:0] setup$avFrontEnd;
    logic [heightAddr - 1:0] setup$avBackSync;
    logic [heightAddr - 1:0] setup$avSyncWidth;
    logic setup__RDY;
    modport server (input  setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    output dataEnable, dataEnable__RDY, hSync, hSync__RDY, vSync, vSync__RDY, setup__RDY);
    modport client (output setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    input  dataEnable, dataEnable__RDY, hSync, hSync__RDY, vSync, vSync__RDY, setup__RDY);
endinterface
`endif
`ifndef __Mmcme2MMCME2_ADV_DEF__
`define __Mmcme2MMCME2_ADV_DEF__
interface Mmcme2MMCME2_ADV;
    logic  CLKFBIN;
    logic  CLKFBOUT;
    logic  CLKFBOUTB;
    logic  CLKFBSTOPPED;
    logic  CLKIN1;
    logic  CLKIN2;
    logic  CLKINSEL;
    logic  CLKINSTOPPED;
    logic  CLKOUT0;
    logic  CLKOUT0B;
    logic  CLKOUT1;
    logic  CLKOUT1B;
    logic  CLKOUT2;
    logic  CLKOUT2B;
    logic  CLKOUT3;
    logic  CLKOUT3B;
    logic  CLKOUT4;
    logic  CLKOUT5;
    logic  CLKOUT6;
    logic [7 - 1:0] DADDR;
    logic  DCLK;
    logic  DEN;
    logic [16 - 1:0] DI;
    logic [16 - 1:0] DO;
    logic  DRDY;
    logic  DWE;
    logic  LOCKED;
    logic  PSCLK;
    logic  PSDONE;
    logic  PSEN;
    logic  PSINCDEC;
    logic  PWRDWN;
    logic  RST;
    modport server (input  CLKFBIN, CLKIN1, CLKIN2, CLKINSEL, DADDR, DCLK, DEN, DI, DWE, PSCLK, PSEN, PSINCDEC, PWRDWN, RST,
                    output CLKFBOUT, CLKFBOUTB, CLKFBSTOPPED, CLKINSTOPPED, CLKOUT0, CLKOUT0B, CLKOUT1, CLKOUT1B, CLKOUT2, CLKOUT2B, CLKOUT3, CLKOUT3B, CLKOUT4, CLKOUT5, CLKOUT6, DO, DRDY, LOCKED, PSDONE);
    modport client (output CLKFBIN, CLKIN1, CLKIN2, CLKINSEL, DADDR, DCLK, DEN, DI, DWE, PSCLK, PSEN, PSINCDEC, PWRDWN, RST,
                    input  CLKFBOUT, CLKFBOUTB, CLKFBSTOPPED, CLKINSTOPPED, CLKOUT0, CLKOUT0B, CLKOUT1, CLKOUT1B, CLKOUT2, CLKOUT2B, CLKOUT3, CLKOUT3B, CLKOUT4, CLKOUT5, CLKOUT6, DO, DRDY, LOCKED, PSDONE);
endinterface
`endif
//METASTART; ClockImageon
//METAINTERNAL; imageon_pll; MMCME2_ADV;
//METAINTERNAL; rinverter; ResetInverter;
//METAINTERNAL; fbclockb; BUFG;
//METAINTERNAL; hdmi_clockb; BUFG;
//METAINTERNAL; imageon_clockb; BUFG;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
//METASTART; Echo
//METAINTERNAL; iclock; ClockImageon;
//METAINTERNAL; hdmi; HdmiBlock;
//METABEFORE; RULE$initHdmi__ENA; :request.muxreset__ENA
//METAGUARD; RULE$initHdmi; 1'd1;
//METAEXCLUSIVE; request.say__ENA; RULE$delay_rule__ENA; request.say2__ENA
//METAGUARD; request.say; 0 != ( ( busy != 0 ) ^ 1 );
//METAGUARD; request.muxreset; 1'd1;
//METAEXCLUSIVE; request.say2__ENA; RULE$delay_rule__ENA
//METAGUARD; request.say2; 0 != ( ( busy != 0 ) ^ 1 );
//METAGUARD; request.setLeds; 1'd1;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
//METAINVOKE; RULE$respond_rule__ENA; v_type != 1:indication.heard2__ENA;v_type == 1:indication.heard__ENA;
//METABEFORE; RULE$respond_rule__ENA; :RULE$delay_rule__ENA
//METAGUARD; RULE$respond_rule; busy_delay && ( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( v_type != 1 ) && indication.heard2__RDY ) );
//METARULES; RULE$initHdmi; RULE$delay_rule; RULE$respond_rule
//METASTART; HdmiBlock
//METAINTERNAL; syncBlock; HdmiSync(widthAddr=12,heightAddr=12);
//METAINTERNAL; patternBlock; HdmiPattern(widthAddr=12,heightAddr=12);
//METAGUARD; RULE$initHdmi; patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY;
//METAINVOKE; RULE$init__ENA; :patternBlock$setup__ENA;:syncBlock$setup__ENA;
//METAGUARD; RULE$init; ( !once ) && syncBlock$setup__RDY && patternBlock$setup__RDY;
//METARULES; RULE$initHdmi; RULE$init
//METACONNECT; syncBlock$data.setXY__ENA; patternBlock$calculate.setXY__ENA
//METACONNECT; syncBlock$data.setXY__RDY; patternBlock$calculate.setXY__RDY
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PEchoIndication;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; P2M__request; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Echo$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Echo$indication.heard2__ENA; M2P__indication$method.heard2__ENA
//METACONNECT; DUT__Echo$indication.heard2__RDY; M2P__indication$method.heard2__RDY
//METACONNECT; DUT__Echo$indication.heard3__ENA; M2P__indication$method.heard3__ENA
//METACONNECT; DUT__Echo$indication.heard3__RDY; M2P__indication$method.heard3__RDY
//METACONNECT; DUT__Echo$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Echo$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; DUT__Echo$request.muxreset__ENA; P2M__request$method.muxreset__ENA
//METACONNECT; DUT__Echo$request.muxreset__RDY; P2M__request$method.muxreset__RDY
//METACONNECT; DUT__Echo$request.say2__ENA; P2M__request$method.say2__ENA
//METACONNECT; DUT__Echo$request.say2__RDY; P2M__request$method.say2__RDY
//METACONNECT; DUT__Echo$request.setLeds__ENA; P2M__request$method.setLeds__ENA
//METACONNECT; DUT__Echo$request.setLeds__RDY; P2M__request$method.setLeds__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard__ENA; method.heard2__ENA; method.heard3__ENA
//METAGUARD; method.heard; pipe.enq__RDY;
//METAINVOKE; method.heard2__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard2__ENA; method.heard3__ENA
//METAGUARD; method.heard2; pipe.enq__RDY;
//METAINVOKE; method.heard3__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard3; pipe.enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.muxreset__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:method.say2__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3:method.setLeds__ENA;
//METAGUARD; pipe.enq; ( method.say__RDY && ( ( method.muxreset__RDY && ( ( method.say2__RDY && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) || ( ( !method.say2__RDY ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) ) || ( ( !method.muxreset__RDY ) && ( ( !method.say2__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) && ( method.say2__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) ) ) ) || ( ( !method.say__RDY ) && ( ( !method.muxreset__RDY ) || ( ( ( !method.say2__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) && ( method.say2__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) ) ) && ( method.muxreset__RDY || ( ( ( !method.say2__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) && ( method.say2__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) ) ) ) ) ) );
//METASTART; HdmiData
//METAGUARD; setXY; 1'd1;
//METASTART; HdmiPattern
//METAGUARD; setup; 1'd1;
//METABEFORE; calculate.setXY__ENA; :setup__ENA
//METAGUARD; calculate.setXY; 1'd1;
//METAGUARD; data; 1'd1;
//METASTART; HdmiSync
//METAGUARD; dataEnable; 1'd1;
//METAGUARD; hSync; 1'd1;
//METAGUARD; vSync; 1'd1;
//METAGUARD; setup; 1'd1;
//METAINVOKE; RULE$updatePixel__ENA; :data.setXY__ENA;
//METAGUARD; RULE$updatePixel; run && data.setXY__RDY;
//METARULES; RULE$updatePixel
`endif
