`include "hdmi.generated.vh"

`default_nettype none
module Echo (
    input wire CLK,
    input wire nRST,
    input wire fmc_video_clk1_v,
    output wire i2c_mux_reset_n,
    output wire adv7511_clk,
    output wire [36 - 1:0]adv7511_d,
    output wire adv7511_de,
    output wire adv7511_hs,
    output wire adv7511_vs,
    EchoRequest.server request,
    EchoIndication.client indication);
    reg _hdmi$setupS__ENA;
    reg [16 - 1:0]a_delay;
    reg [16 - 1:0]a_temp;
    reg [16 - 1:0]b_delay;
    reg [16 - 1:0]b_temp;
    reg busy;
    reg busy_delay;
    reg i2c_mux_reset_n_reg;
    reg [32 - 1:0]v_delay;
    reg [32 - 1:0]v_temp;
    reg [32 - 1:0]v_type;
    logic RULE$delay_rule__ENA;
    logic RULE$delay_rule__RDY;
    logic RULE$respond_rule__ENA;
    logic RULE$respond_rule__RDY;
    logic _hdmi$setupS__ACK;
    PipeIn#(.width(1)) bozo$in();
    PipeOut#(.width(1)) bozo$out();
    logic hdmi$setup__ACK;
    logic hdmi$setup__ENA;
    logic iclock$hdmiClock;
    ClockImageon iclock (
        .CLK(fmc_video_clk1_v),
        .nRST(nRST),
        .hdmiClock(iclock$hdmiClock),
        .imageonClock());
    HdmiBlock hdmi (
        .setup__ENA(hdmi$setup__ENA),
        .setup$ahEnd(hdmi$setup__ENA ? request.setup$ahEnd : 16'd0),
        .setup$ahFrontEnd(hdmi$setup__ENA ? request.setup$ahFrontEnd : 16'd0),
        .setup$ahBackSync(hdmi$setup__ENA ? request.setup$ahBackSync : 8'd0),
        .setup$ahSyncWidth(hdmi$setup__ENA ? request.setup$ahSyncWidth : 8'd0),
        .setup$avEnd(hdmi$setup__ENA ? request.setup$avEnd : 16'd0),
        .setup$avFrontEnd(hdmi$setup__ENA ? request.setup$avFrontEnd : 16'd0),
        .setup$avBackSync(hdmi$setup__ENA ? request.setup$avBackSync : 8'd0),
        .setup$avSyncWidth(hdmi$setup__ENA ? request.setup$avSyncWidth : 8'd0),
        .setup__ACK(_hdmi$setupS__ACK),
        .CLK(iclock$hdmiClock),
        .nRST(nRST),
        .adv7511_d(adv7511_d),
        .adv7511_de(adv7511_de),
        .adv7511_hs(adv7511_hs),
        .adv7511_vs(adv7511_vs));
    Fifo1Base#(.width(1)) bozo (.CLK(CLK), .nRST(nRST),
        .in(bozo$in),
        .out(bozo$out));
    SyncFF hdmi$setup__ACKSyncFF (.CLK(CLK), .nRST(nRST),
        .out(hdmi$setup__ACK),
        .in(_hdmi$setupS__ACK));
    AsyncControl __CONTROL_hdmi$setup__ENA (
        .CLK(CLK),
        .nRST(nRST),
        .start(request.setup__ENA),
        .end(_hdmi$setupS__ACK),
        .clear(bozo$out.deq__ENA),
        .out(hdmi$setup__ENA),
        .done(bozo$out.deq__ENA));
    assign adv7511_clk = ( !iclock$hdmiClock ) && 1'd1;
    assign i2c_mux_reset_n = i2c_mux_reset_n_reg;
    // Extra assigments, not to output wires
    assign RULE$delay_rule__ENA = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$delay_rule__RDY = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$respond_rule__ENA = busy_delay && ( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( v_type != 1 ) && indication.heard2__RDY ) );
    assign RULE$respond_rule__RDY = busy_delay && ( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( v_type != 1 ) && indication.heard2__RDY ) );
    assign indication.heard$v = ( busy_delay && ( v_type == 1 ) ) ? v_delay : 32'd0;
    assign indication.heard2$a = ( ( v_type != 1 ) && busy_delay ) ? a_delay : 16'd0;
    assign indication.heard2$b = ( ( v_type != 1 ) && busy_delay ) ? b_delay : 16'd0;
    assign indication.heard2__ENA = ( v_type != 1 ) && busy_delay;
    assign indication.heard__ENA = busy_delay && ( v_type == 1 );
    assign request.muxreset__RDY = 1'd1;
    assign request.say__RDY = !busy;
    assign request.setup__RDY = bozo$out.deq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        _hdmi$setupS__ENA <= 0;
        a_delay <= 0;
        a_temp <= 0;
        b_delay <= 0;
        b_temp <= 0;
        busy <= 0;
        busy_delay <= 0;
        i2c_mux_reset_n_reg <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (RULE$delay_rule__RDY && RULE$delay_rule__ENA) begin // RULE$delay_rule__ENA
            busy <= 1'd0;
            busy_delay <= 1'd1;
            v_delay <= v_temp;
            a_delay <= a_temp;
            b_delay <= b_temp;
        end; // End of RULE$delay_rule__ENA
        if (RULE$respond_rule__RDY && RULE$respond_rule__ENA) begin // RULE$respond_rule__ENA
            busy_delay <= 1'd0;
        end; // End of RULE$respond_rule__ENA
        if (request.muxreset__ENA) begin // request.muxreset__ENA
            i2c_mux_reset_n_reg <= request.muxreset$v;
        end; // End of request.muxreset__ENA
        if (( !busy ) && request.say__ENA) begin // request.say__ENA
            v_temp <= request.say$v;
            busy <= 1'd1;
            v_type <= 32'd1;
            $display( "request$say %x" , request.say$v );
        end; // End of request.say__ENA
        if (bozo$out.deq__ENA) begin // request.setup__ENA
            b_delay <= 16'd99;
        end; // End of request.setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
