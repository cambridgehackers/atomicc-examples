`include "hdmi.generated.vh"

`default_nettype none
module HdmiBlock (
    input wire setup__ENA,
    input wire [16 - 1:0]setup$ahEnd,
    input wire [16 - 1:0]setup$ahFrontEnd,
    input wire [8 - 1:0]setup$ahBackSync,
    input wire [8 - 1:0]setup$ahSyncWidth,
    input wire [16 - 1:0]setup$avEnd,
    input wire [16 - 1:0]setup$avFrontEnd,
    input wire [8 - 1:0]setup$avBackSync,
    input wire [8 - 1:0]setup$avSyncWidth,
    output wire setup__ACK,
    input wire CLK,
    input wire nRST,
    output wire [36 - 1:0]adv7511_d,
    output wire adv7511_de,
    output wire adv7511_hs,
    output wire adv7511_vs);
    reg REGGTEMP_setup__ACK;
    reg _setupS__ACK;
    reg dataEnable;
    reg hSync;
    reg vSync;
    logic RULE$initHdmi__ENA;
    logic _setupS__ENA;
    HdmiDataIfc#(.widthAddr(12),.heightAddr(12)) patternBlock$calculate();
    logic [36 - 1:0]patternBlock$data;
    logic patternBlock$data__RDY;
    logic patternBlock$setup__RDY;
    logic setup__RDY;
    HdmiDataIfc#(.widthAddr(12),.heightAddr(12)) syncBlock$data();
    logic syncBlock$dataEnable;
    logic syncBlock$dataEnable__RDY;
    logic syncBlock$hSync;
    logic syncBlock$hSync__RDY;
    logic syncBlock$setup__RDY;
    logic syncBlock$vSync;
    logic syncBlock$vSync__RDY;
    HdmiSync#(.widthAddr(12),.heightAddr(12)) syncBlock (.CLK(CLK), .nRST(nRST),
        .dataEnable(syncBlock$dataEnable),
        .dataEnable__RDY(syncBlock$dataEnable__RDY),
        .hSync(syncBlock$hSync),
        .hSync__RDY(syncBlock$hSync__RDY),
        .vSync(syncBlock$vSync),
        .vSync__RDY(syncBlock$vSync__RDY),
        .setup__ENA(_setupS__ENA),
        .setup$ahEnd(_setupS__ENA ? ( 12'd2200 - 12'd1 ) : 12'd0),
        .setup$ahFrontEnd(_setupS__ENA ? ( ( 12'd2200 - 12'd1 ) - 12'd88 ) : 12'd0),
        .setup$ahBackSync(_setupS__ENA ? ( 12'd148 + 12'd44 ) : 12'd0),
        .setup$ahSyncWidth(_setupS__ENA ? 12'd44 : 12'd0),
        .setup$avEnd(_setupS__ENA ? ( 12'd1125 - 12'd1 ) : 12'd0),
        .setup$avFrontEnd(_setupS__ENA ? ( ( 12'd1125 - 12'd1 ) - 12'd4 ) : 12'd0),
        .setup$avBackSync(_setupS__ENA ? ( 12'd36 + 12'd5 ) : 12'd0),
        .setup$avSyncWidth(_setupS__ENA ? 12'd5 : 12'd0),
        .setup__RDY(syncBlock$setup__RDY),
        .data(syncBlock$data));
    HdmiPattern#(.widthAddr(12),.heightAddr(12)) patternBlock (.CLK(CLK), .nRST(nRST),
        .setup__ENA(_setupS__ENA),
        .setup$aactivePixels(_setupS__ENA ? ( ( ( 12'd2200 - 12'd1 ) - 12'd88 ) - ( 12'd148 + 12'd44 ) ) : 12'd0),
        .setup$aactiveLines(_setupS__ENA ? ( ( ( 12'd1125 - 12'd1 ) - 12'd4 ) - ( 12'd36 + 12'd5 ) ) : 12'd0),
        .setup$apattern(_setupS__ENA ? 8'd4 : 8'd0),
        .setup$arampStep(_setupS__ENA ? 20'd546 : 20'd0),
        .setup__RDY(patternBlock$setup__RDY),
        .data(patternBlock$data),
        .data__RDY(patternBlock$data__RDY),
        .calculate(syncBlock$data));
    SyncFF setup__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(_setupS__ENA),
        .in(setup__ENA));
    assign adv7511_d = RULE$initHdmi__ENA ? patternBlock$data : 36'd0;
    assign adv7511_de = RULE$initHdmi__ENA && dataEnable;
    assign adv7511_hs = RULE$initHdmi__ENA && hSync;
    assign adv7511_vs = RULE$initHdmi__ENA && vSync;
    assign setup__ACK = ( ( !REGGTEMP_setup__ACK ) && syncBlock$setup__RDY && patternBlock$setup__RDY ) || REGGTEMP_setup__ACK;
    // Extra assigments, not to output wires
    assign RULE$initHdmi__ENA = patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY;
    assign setup__RDY = ( !REGGTEMP_setup__ACK ) && syncBlock$setup__RDY && patternBlock$setup__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        REGGTEMP_setup__ACK <= 0;
        _setupS__ACK <= 0;
        dataEnable <= 0;
        hSync <= 0;
        vSync <= 0;
      end // nRST
      else begin
        // 
            if (( !_setupS__ENA ) && REGGTEMP_setup__ACK)
            REGGTEMP_setup__ACK <= 0;
        // End of 
        if (patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY && RULE$initHdmi__ENA) begin // RULE$initHdmi__ENA
            dataEnable <= syncBlock$dataEnable;
            hSync <= syncBlock$hSync;
            vSync <= syncBlock$vSync;
        end; // End of RULE$initHdmi__ENA
        if (( !REGGTEMP_setup__ACK ) && syncBlock$setup__RDY && patternBlock$setup__RDY && _setupS__ENA) begin // setup__ENA
            REGGTEMP_setup__ACK <= 1;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
