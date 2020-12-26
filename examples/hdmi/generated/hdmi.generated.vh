`include "atomicclib.vh"

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
//METAINTERNAL; fmc_video_clk1_v_pin; ExternalPin(width=1);
//METAINTERNAL; i2c_mux_reset_n_pin; ExternalPin(width=1);
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
