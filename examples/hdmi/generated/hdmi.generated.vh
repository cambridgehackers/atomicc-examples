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
    logic  hdminReset;
    logic  imageonClock;
    logic  imageonnReset;
    modport server (input  CLK, nRST,
                    output hdmiClock, hdminReset, imageonClock, imageonnReset);
    modport client (output CLK, nRST,
                    input  hdmiClock, hdminReset, imageonClock, imageonnReset);
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
    logic run__ENA;
    logic run__RDY;
    logic setuph__ENA;
    logic [12 - 1:0] setuph$ahEnd;
    logic [12 - 1:0] setuph$ahFrontEnd;
    logic [8 - 1:0] setuph$ahBackSync;
    logic [8 - 1:0] setuph$ahSyncWidth;
    logic setuph__RDY;
    logic setupv__ENA;
    logic [12 - 1:0] setupv$avEnd;
    logic [12 - 1:0] setupv$avFrontEnd;
    logic [8 - 1:0] setupv$avBackSync;
    logic [8 - 1:0] setupv$avSyncWidth;
    logic setupv__RDY;
    logic setupTest__ENA;
    logic [8 - 1:0] setupTest$apattern;
    logic [20 - 1:0] setupTest$aramp;
    logic setupTest__RDY;
    modport server (input  say__ENA, say$v, muxreset__ENA, muxreset$v, run__ENA, setuph__ENA, setuph$ahEnd, setuph$ahFrontEnd, setuph$ahBackSync, setuph$ahSyncWidth, setupv__ENA, setupv$avEnd, setupv$avFrontEnd, setupv$avBackSync, setupv$avSyncWidth, setupTest__ENA, setupTest$apattern, setupTest$aramp,
                    output say__RDY, muxreset__RDY, run__RDY, setuph__RDY, setupv__RDY, setupTest__RDY);
    modport client (output say__ENA, say$v, muxreset__ENA, muxreset$v, run__ENA, setuph__ENA, setuph$ahEnd, setuph$ahFrontEnd, setuph$ahBackSync, setuph$ahSyncWidth, setupv__ENA, setupv$avEnd, setupv$avFrontEnd, setupv$avBackSync, setupv$avSyncWidth, setupTest__ENA, setupTest$apattern, setupTest$aramp,
                    input  say__RDY, muxreset__RDY, run__RDY, setuph__RDY, setupv__RDY, setupTest__RDY);
endinterface
`endif
`ifndef __EchoIndication_DEF__
`define __EchoIndication_DEF__
interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic [32 - 1:0] heard$hdmiCounter;
    logic [32 - 1:0] heard$imageonCounter;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v, heard$hdmiCounter, heard$imageonCounter,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v, heard$hdmiCounter, heard$imageonCounter,
                    input  heard__RDY);
endinterface
`endif
`ifndef __EchoIfc_DEF__
`define __EchoIfc_DEF__
interface EchoIfc;
    logic  CLK;
    logic  nRST;
    logic  fmc_video_clk1_v;
    logic  i2c_mux_reset_n;
    modport server (input  CLK, nRST, fmc_video_clk1_v,
                    output i2c_mux_reset_n);
    modport client (output CLK, nRST, fmc_video_clk1_v,
                    input  i2c_mux_reset_n);
endinterface
`endif
`ifndef __HdmiBlockIfc_DEF__
`define __HdmiBlockIfc_DEF__
interface HdmiBlockIfc;
    logic setup__ENA;
    logic [16 - 1:0] setup$ahEnd;
    logic [16 - 1:0] setup$ahFrontEnd;
    logic [8 - 1:0] setup$ahBackSync;
    logic [8 - 1:0] setup$ahSyncWidth;
    logic [16 - 1:0] setup$avEnd;
    logic [16 - 1:0] setup$avFrontEnd;
    logic [8 - 1:0] setup$avBackSync;
    logic [8 - 1:0] setup$avSyncWidth;
    logic [8 - 1:0] setup$apattern;
    logic [20 - 1:0] setup$aramp;
    logic setup__ACK;
    logic run__ENA;
    logic run__ACK;
    modport server (input  setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth, setup$apattern, setup$aramp, run__ENA,
                    output setup__ACK, run__ACK);
    modport client (output setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth, setup$apattern, setup$aramp, run__ENA,
                    input  setup__ACK, run__ACK);
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
`ifndef __HdmiImageonIfc_DEF__
`define __HdmiImageonIfc_DEF__
interface HdmiImageonIfc;
    logic  CLK;
    logic  nRST;
    modport server (input  CLK, nRST);
    modport client (output CLK, nRST);
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
    logic run__ENA;
    logic run__RDY;
    modport server (input  setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth, run__ENA,
                    output dataEnable, dataEnable__RDY, hSync, hSync__RDY, vSync, vSync__RDY, setup__RDY, run__RDY);
    modport client (output setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth, run__ENA,
                    input  dataEnable, dataEnable__RDY, hSync, hSync__RDY, vSync, vSync__RDY, setup__RDY, run__RDY);
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
//METAINTERNAL; hdmiSync; SyncBit;
//METAINTERNAL; imageonSync; SyncBit;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
//METASTART; Echo
//METAINTERNAL; iclock; ClockImageon;
//METAINTERNAL; hdmi; HdmiBlock;
//METAINTERNAL; imageon; HdmiImageon;
//METAINTERNAL; videoClock; BUFG;
//METAINTERNAL; __CONTROL_hdmi$run__ENA; AsyncControl;
//METAINTERNAL; __CONTROL_hdmi$setup__ENA; AsyncControl;
//METAGUARD; RULE$updateRuleI; 1'd1;
//METAGUARD; RULE$updateRuleH; 1'd1;
//METAGUARD; RULE$updateRule; 1'd1;
//METABEFORE; RULE$initHdmi__ENA; :request.muxreset__ENA
//METAGUARD; RULE$initHdmi; 1'd1;
//METAEXCLUSIVE; request.say__ENA; RULE$delay_rule__ENA
//METAGUARD; request.say; 0 != ( ( busy != 0 ) ^ 1 );
//METAGUARD; request.muxreset; 1'd1;
//METAGUARD; request.setuph; 1'd1;
//METAGUARD; request.setupv; 1'd1;
//METAEXCLUSIVE; request.setupTest__ENA; RULE$callSetupRule__ENA
//METAGUARD; request.setupTest; 1'd1;
//METAINVOKE; request.run__ENA; :hdmi$run__ENA;
//METAGUARD; request.run; 1'd1;
//METAINVOKE; RULE$callSetupRule__ENA; :hdmi$setup__ENA;
//METAGUARD; RULE$callSetupRule; 0 != callSetup;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
//METAINVOKE; RULE$respond_rule__ENA; :indication.heard__ENA;
//METAGUARD; RULE$respond_rule; busy_delay && indication.heard__RDY;
//METARULES; RULE$updateRuleI; RULE$updateRuleH; RULE$updateRule; RULE$initHdmi; RULE$callSetupRule; RULE$delay_rule; RULE$respond_rule
//METASTART; HdmiBlock
//METAINTERNAL; syncBlock; HdmiSync(widthAddr=12,heightAddr=12);
//METAINTERNAL; patternBlock; HdmiPattern(widthAddr=12,heightAddr=12);
//METAINTERNAL; adv7511_d_pin; ExternalPin(width=36);
//METAINTERNAL; adv7511_de_pin; ExternalPin(width=1);
//METAINTERNAL; adv7511_hs_pin; ExternalPin(width=1);
//METAINTERNAL; adv7511_vs_pin; ExternalPin(width=1);
//METAINTERNAL; adv7511_clk_pin; ExternalPin(width=1);
//METAINVOKE; setup__ENA; :patternBlock$setup__ENA;:syncBlock$setup__ENA;
//METAGUARD; setup; patternBlock$setup__RDY && syncBlock$setup__RDY;
//METAINVOKE; run__ENA; :syncBlock$run__ENA;
//METAGUARD; run; syncBlock$run__RDY;
//METAGUARD; RULE$initHdmi; patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY;
//METARULES; RULE$initHdmi
//METACONNECT; syncBlock$data.setXY__ENA; patternBlock$calculate.setXY__ENA
//METACONNECT; syncBlock$data.setXY__RDY; patternBlock$calculate.setXY__RDY
//METASTART; HdmiImageon
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PEchoIndication;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; P2M__request; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Echo$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Echo$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Echo$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; DUT__Echo$request.muxreset__ENA; P2M__request$method.muxreset__ENA
//METACONNECT; DUT__Echo$request.muxreset__RDY; P2M__request$method.muxreset__RDY
//METACONNECT; DUT__Echo$request.run__ENA; P2M__request$method.run__ENA
//METACONNECT; DUT__Echo$request.run__RDY; P2M__request$method.run__RDY
//METACONNECT; DUT__Echo$request.setuph__ENA; P2M__request$method.setuph__ENA
//METACONNECT; DUT__Echo$request.setuph__RDY; P2M__request$method.setuph__RDY
//METACONNECT; DUT__Echo$request.setupv__ENA; P2M__request$method.setupv__ENA
//METACONNECT; DUT__Echo$request.setupv__RDY; P2M__request$method.setupv__RDY
//METACONNECT; DUT__Echo$request.setupTest__ENA; P2M__request$method.setupTest__ENA
//METACONNECT; DUT__Echo$request.setupTest__RDY; P2M__request$method.setupTest__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.muxreset__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:method.run__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5:method.setupTest__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3:method.setuph__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd4:method.setupv__ENA;
//METAGUARD; pipe.enq; ( method.say__RDY && ( ( method.muxreset__RDY && ( ( method.run__RDY && ( ( method.setuph__RDY && ( ( method.setupv__RDY && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) || ( ( !method.setupv__RDY ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) || ( ( !method.setuph__RDY ) && ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) || ( ( !method.run__RDY ) && ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) ) || ( ( !method.muxreset__RDY ) && ( ( !method.run__RDY ) || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) && ( method.run__RDY || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) ) ) ) || ( ( !method.say__RDY ) && ( ( !method.muxreset__RDY ) || ( ( ( !method.run__RDY ) || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) && ( method.run__RDY || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) ) ) && ( method.muxreset__RDY || ( ( ( !method.run__RDY ) || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) && ( method.run__RDY || ( ( ( !method.setuph__RDY ) || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) && ( method.setuph__RDY || ( ( ( !method.setupv__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) && ( method.setupv__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd4 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd3 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setupTest__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd5 ) ) ) ) ) ) ) ) ) ) );
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
//METAGUARD; run; 1'd1;
//METAINVOKE; RULE$updatePixel__ENA; :data.setXY__ENA;
//METAGUARD; RULE$updatePixel; runFlag && data.setXY__RDY;
//METARULES; RULE$updatePixel
`endif
