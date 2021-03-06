`include "atomicc.generated.vh"
`default_nettype none
module Echo (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    reg _hdmi$runS__ENA;
    reg _hdmi$setupS__ENA;
    reg busy;
    reg busy_delay;
    reg callSetup;
    reg [48 - 1:0]counter;
    reg [48 - 1:0]hdmiCounter;
    reg [32 - 1:0]hdmiCounter1;
    reg [32 - 1:0]hdmiCounter2;
    reg i2c_mux_reset_n_reg;
    reg [48 - 1:0]imageonCounter;
    reg [32 - 1:0]imageonCounter1;
    reg [32 - 1:0]imageonCounter2;
    reg [8 - 1:0]jhBackSync;
    reg [16 - 1:0]jhEnd;
    reg [16 - 1:0]jhFrontEnd;
    reg [8 - 1:0]jhSyncWidth;
    reg [8 - 1:0]jpattern;
    reg [20 - 1:0]jrampStep;
    reg [8 - 1:0]jvBackSync;
    reg [16 - 1:0]jvEnd;
    reg [16 - 1:0]jvFrontEnd;
    reg [8 - 1:0]jvSyncWidth;
    reg [32 - 1:0]v_delay;
    reg [32 - 1:0]v_temp;
    reg [32 - 1:0]v_type;
    logic RULE$delay_rule__ENA;
    logic RULE$delay_rule__RDY;
    logic RULE$respond_rule__ENA;
    logic __CONTROL_hdmi$run__ENA$done;
    logic __CONTROL_hdmi$setup__ENA$done;
    logic _hdmi$runS__ACK;
    logic _hdmi$setupS__ACK;
    logic fmc_video_clk1_v_pin$in;
    logic fmc_video_clk1_v_pin$out;
    logic hdmi$run__ACK;
    logic hdmi$run__ENA;
    logic hdmi$setup__ACK;
    logic hdmi$setup__ENA;
    logic i2c_mux_reset_n_pin$in;
    logic i2c_mux_reset_n_pin$out;
    logic iclock$hdmiClock;
    logic iclock$hdminReset;
    logic iclock$imageonClock;
    logic iclock$imageonnReset;
    logic videoClock$O;
    ExternalPin#(.width(1)) fmc_video_clk1_v_pin (
        .in(fmc_video_clk1_v_pin$in),
        .out(fmc_video_clk1_v_pin$out));
    ExternalPin#(.width(1)) i2c_mux_reset_n_pin (
        .in(i2c_mux_reset_n_pin$in),
        .out(i2c_mux_reset_n_pin$out));
    ClockImageon iclock (
        .CLK(videoClock$O),
        .nRST(nRST),
        .hdmiClock(iclock$hdmiClock),
        .hdminReset(iclock$hdminReset),
        .imageonClock(iclock$imageonClock),
        .imageonnReset(iclock$imageonnReset));
    HdmiBlock hdmi (.CLK(iclock$hdmiClock), .nRST(iclock$hdminReset),
        .setup__ENA(hdmi$setup__ENA),
        .setup$ahEnd(jhEnd),
        .setup$ahFrontEnd(jhFrontEnd),
        .setup$ahBackSync(jhBackSync),
        .setup$ahSyncWidth(jhSyncWidth),
        .setup$avEnd(jvEnd),
        .setup$avFrontEnd(jvFrontEnd),
        .setup$avBackSync(jvBackSync),
        .setup$avSyncWidth(jvSyncWidth),
        .setup$apattern(jpattern),
        .setup$aramp(jrampStep),
        .setup__ACK(_hdmi$setupS__ACK),
        .run__ENA(hdmi$run__ENA),
        .run__ACK(_hdmi$runS__ACK));
    HdmiImageon imageon (
        .CLK(iclock$imageonClock),
        .nRST(nRST));
    BUFG videoClock (
        .I(fmc_video_clk1_v_pin$out),
        .O(videoClock$O));
    SyncFF hdmi$run__ACKSyncFF (.CLK(CLK), .nRST(nRST),
        .out(hdmi$run__ACK),
        .in(_hdmi$runS__ACK));
    SyncFF hdmi$setup__ACKSyncFF (.CLK(CLK), .nRST(nRST),
        .out(hdmi$setup__ACK),
        .in(_hdmi$setupS__ACK));
    AsyncControl __CONTROL_hdmi$run__ENA (
        .CLK(CLK),
        .nRST(nRST),
        .start(request.run__ENA),
        .ack(_hdmi$runS__ACK),
        .clear(__CONTROL_hdmi$run__ENA$done),
        .out(hdmi$run__ENA),
        .done(__CONTROL_hdmi$run__ENA$done));
    AsyncControl __CONTROL_hdmi$setup__ENA (
        .CLK(CLK),
        .nRST(nRST),
        .start(callSetup),
        .ack(_hdmi$setupS__ACK),
        .clear(__CONTROL_hdmi$setup__ENA$done),
        .out(hdmi$setup__ENA),
        .done(__CONTROL_hdmi$setup__ENA$done));
    assign fmc_video_clk1_v_pin$in = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign i2c_mux_reset_n_pin$in = i2c_mux_reset_n_reg;
    // Extra assigments, not to output wires
    assign RULE$delay_rule__ENA = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$delay_rule__RDY = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$respond_rule__ENA = busy_delay && indication.heard__RDY;
    assign indication.heard$hdmiCounter = hdmiCounter2;
    assign indication.heard$imageonCounter = imageonCounter2;
    assign indication.heard$v = counter[ ( 48 - 1 ) : 16 ];
    assign indication.heard__ENA = busy_delay;
    assign request.muxreset__RDY = 1'd1;
    assign request.run__RDY = 1'd1;
    assign request.say__RDY = !busy;
    assign request.setupTest__RDY = 1'd1;
    assign request.setuph__RDY = 1'd1;
    assign request.setupv__RDY = 1'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        _hdmi$runS__ENA <= 1'd0;
        _hdmi$setupS__ENA <= 1'd0;
        busy <= 1'd0;
        busy_delay <= 1'd0;
        callSetup <= 1'd0;
        counter <= 48'd0;
        hdmiCounter1 <= 32'd0;
        hdmiCounter2 <= 32'd0;
        i2c_mux_reset_n_reg <= 1'd0;
        imageonCounter1 <= 32'd0;
        imageonCounter2 <= 32'd0;
        jhBackSync <= 8'd0;
        jhEnd <= 16'd0;
        jhFrontEnd <= 16'd0;
        jhSyncWidth <= 8'd0;
        jpattern <= 8'd0;
        jrampStep <= 20'd0;
        jvBackSync <= 8'd0;
        jvEnd <= 16'd0;
        jvFrontEnd <= 16'd0;
        jvSyncWidth <= 8'd0;
        v_delay <= 32'd0;
        v_temp <= 32'd0;
        v_type <= 32'd0;
      end // nRST
      else begin
        if (__CONTROL_hdmi$setup__ENA$done) begin // RULE$callSetupRule__ENA
            callSetup <= 1'd0;
        end; // End of RULE$callSetupRule__ENA
        if (RULE$delay_rule__RDY && RULE$delay_rule__ENA) begin // RULE$delay_rule__ENA
            busy <= 1'd0;
            busy_delay <= 1'd1;
            v_delay <= v_temp;
            hdmiCounter2 <= hdmiCounter1;
            imageonCounter2 <= imageonCounter1;
        end; // End of RULE$delay_rule__ENA
        if (busy_delay && indication.heard__RDY && RULE$respond_rule__ENA) begin // RULE$respond_rule__ENA
            busy_delay <= 1'd0;
        end; // End of RULE$respond_rule__ENA
        // RULE$updateRule__ENA
            counter <= counter + 48'd1;
        // End of RULE$updateRule__ENA
        if (request.muxreset__ENA) begin // request.muxreset__ENA
            i2c_mux_reset_n_reg <= request.muxreset$v;
        end; // End of request.muxreset__ENA
        if (( !busy ) && request.say__ENA) begin // request.say__ENA
            v_temp <= 32'd99999999;
            busy <= 1'd1;
            v_type <= 32'd1;
            hdmiCounter1 <= hdmiCounter[ ( 48 - 1 ) : 16 ];
            imageonCounter1 <= imageonCounter[ ( 48 - 1 ) : 16 ];
            $display( "request$say %x" , request.say$v );
        end; // End of request.say__ENA
        if (request.setupTest__ENA) begin // request.setupTest__ENA
            callSetup <= 1'd1;
            jpattern <= request.setupTest$apattern;
            jrampStep <= request.setupTest$aramp;
        end; // End of request.setupTest__ENA
        if (request.setuph__ENA) begin // request.setuph__ENA
            jhEnd <= request.setuph$ahEnd;
            jhFrontEnd <= request.setuph$ahFrontEnd;
            jhBackSync <= request.setuph$ahBackSync;
            jhSyncWidth <= request.setuph$ahSyncWidth;
        end; // End of request.setuph__ENA
        if (request.setupv__ENA) begin // request.setupv__ENA
            jvEnd <= request.setupv$avEnd;
            jvFrontEnd <= request.setupv$avFrontEnd;
            jvBackSync <= request.setupv$avBackSync;
            jvSyncWidth <= request.setupv$avSyncWidth;
        end; // End of request.setupv__ENA
      end
    end // always @ (posedge CLK)

    always @( posedge iclock$hdmiClock) begin
      if (!iclock$hdminReset) begin
        hdmiCounter <= 48'd0;
      end // nRST
      else begin
        // RULE$updateRuleH__ENA
            hdmiCounter <= hdmiCounter + 48'd1;
        // End of RULE$updateRuleH__ENA
      end
    end // always @ (posedge CLK)

    always @( posedge iclock$imageonClock) begin
      if (!iclock$imageonnReset) begin
        imageonCounter <= 48'd0;
      end // nRST
      else begin
        // RULE$updateRuleI__ENA
            imageonCounter <= imageonCounter + 48'd1;
        // End of RULE$updateRuleI__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
