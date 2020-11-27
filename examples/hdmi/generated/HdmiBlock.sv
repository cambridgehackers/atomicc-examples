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
    reg once;
    reg vSync;
    logic RULE$initHdmi__ENA;
    logic RULE$init__ENA;
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
        .setup__ENA(( !once ) && patternBlock$setup__RDY),
        .setup$ahEnd(( ( !once ) && patternBlock$setup__RDY ) ? ( 12'd2200 - 12'd1 ) : 12'd0),
        .setup$ahFrontEnd(( ( !once ) && patternBlock$setup__RDY ) ? ( ( 12'd2200 - 12'd1 ) - 12'd88 ) : 12'd0),
        .setup$ahBackSync(( ( !once ) && patternBlock$setup__RDY ) ? ( 12'd148 + 12'd44 ) : 12'd0),
        .setup$ahSyncWidth(( ( !once ) && patternBlock$setup__RDY ) ? 12'd44 : 12'd0),
        .setup$avEnd(( ( !once ) && patternBlock$setup__RDY ) ? ( 12'd1125 - 12'd1 ) : 12'd0),
        .setup$avFrontEnd(( ( !once ) && patternBlock$setup__RDY ) ? ( ( 12'd1125 - 12'd1 ) - 12'd4 ) : 12'd0),
        .setup$avBackSync(( ( !once ) && patternBlock$setup__RDY ) ? ( 12'd36 + 12'd5 ) : 12'd0),
        .setup$avSyncWidth(( ( !once ) && patternBlock$setup__RDY ) ? 12'd5 : 12'd0),
        .setup__RDY(syncBlock$setup__RDY),
        .data(syncBlock$data));
    HdmiPattern#(.widthAddr(12),.heightAddr(12)) patternBlock (.CLK(CLK), .nRST(nRST),
        .setup__ENA(( !once ) && syncBlock$setup__RDY),
        .setup$aactivePixels(( ( !once ) && syncBlock$setup__RDY ) ? ( ( ( 12'd2200 - 12'd1 ) - 12'd88 ) - ( 12'd148 + 12'd44 ) ) : 12'd0),
        .setup$aactiveLines(( ( !once ) && syncBlock$setup__RDY ) ? ( ( ( 12'd1125 - 12'd1 ) - 12'd4 ) - ( 12'd36 + 12'd5 ) ) : 12'd0),
        .setup$apattern(( ( !once ) && syncBlock$setup__RDY ) ? 8'd4 : 8'd0),
        .setup$arampStep(( ( !once ) && syncBlock$setup__RDY ) ? 20'd546 : 20'd0),
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
    assign setup__ACK = ( ( !REGGTEMP_setup__ACK ) && ( !once ) ) || REGGTEMP_setup__ACK;
    // Extra assigments, not to output wires
    assign RULE$initHdmi__ENA = patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY;
    assign RULE$init__ENA = ( !once ) && syncBlock$setup__RDY && patternBlock$setup__RDY;
    assign setup__RDY = ( !REGGTEMP_setup__ACK ) && ( !once );

    always @( posedge CLK) begin
      if (!nRST) begin
        REGGTEMP_setup__ACK <= 0;
        _setupS__ACK <= 0;
        dataEnable <= 0;
        hSync <= 0;
        once <= 0;
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
        if (( !once ) && syncBlock$setup__RDY && patternBlock$setup__RDY && RULE$init__ENA) begin // RULE$init__ENA
            once <= 1'd1;
        end; // End of RULE$init__ENA
        if (( !REGGTEMP_setup__ACK ) && ( !once ) && _setupS__ENA) begin // setup__ENA
            once <= 1'd1;
            REGGTEMP_setup__ACK <= 1;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
