`include "atomicc.generated.vh"
`default_nettype none
module HdmiBlock (input wire CLK, input wire nRST,
    input wire setup__ENA,
    input wire [16 - 1:0]setup$ahEnd,
    input wire [16 - 1:0]setup$ahFrontEnd,
    input wire [8 - 1:0]setup$ahBackSync,
    input wire [8 - 1:0]setup$ahSyncWidth,
    input wire [16 - 1:0]setup$avEnd,
    input wire [16 - 1:0]setup$avFrontEnd,
    input wire [8 - 1:0]setup$avBackSync,
    input wire [8 - 1:0]setup$avSyncWidth,
    input wire [8 - 1:0]setup$apattern,
    input wire [20 - 1:0]setup$aramp,
    output wire setup__ACK,
    input wire run__ENA,
    output wire run__ACK);
    reg REGGTEMP_run__ACK;
    reg REGGTEMP_setup__ACK;
    reg _runS__ACK;
    reg _setupS__ACK;
    reg dataEnable;
    reg hSync;
    reg vSync;
    logic RULE$initHdmi__ENA;
    logic _runS__ENA;
    logic _setupS__ENA;
    logic adv7511_clk_pin$in;
    logic adv7511_clk_pin$out;
    logic [36 - 1:0]adv7511_d_pin$in;
    logic [36 - 1:0]adv7511_d_pin$out;
    logic adv7511_de_pin$in;
    logic adv7511_de_pin$out;
    logic adv7511_hs_pin$in;
    logic adv7511_hs_pin$out;
    logic adv7511_vs_pin$in;
    logic adv7511_vs_pin$out;
    HdmiDataIfc#(.widthAddr(12),.heightAddr(12)) patternBlock$calculate();
    logic [36 - 1:0]patternBlock$data;
    logic patternBlock$data__RDY;
    logic patternBlock$setup__RDY;
    logic run__RDY;
    logic setup__RDY;
    HdmiDataIfc#(.widthAddr(12),.heightAddr(12)) syncBlock$data();
    logic syncBlock$dataEnable;
    logic syncBlock$dataEnable__RDY;
    logic syncBlock$hSync;
    logic syncBlock$hSync__RDY;
    logic syncBlock$run__RDY;
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
        .setup$ahEnd(setup$ahEnd[ 11 : 0 ]),
        .setup$ahFrontEnd(setup$ahFrontEnd[ 11 : 0 ]),
        .setup$ahBackSync(setup$ahBackSync),
        .setup$ahSyncWidth(setup$ahSyncWidth),
        .setup$avEnd(setup$avEnd[ 11 : 0 ]),
        .setup$avFrontEnd(setup$avFrontEnd[ 11 : 0 ]),
        .setup$avBackSync(setup$avBackSync),
        .setup$avSyncWidth(setup$avSyncWidth),
        .setup__RDY(syncBlock$setup__RDY),
        .run__ENA(_runS__ENA),
        .run__RDY(syncBlock$run__RDY),
        .data(syncBlock$data));
    HdmiPattern#(.widthAddr(12),.heightAddr(12)) patternBlock (.CLK(CLK), .nRST(nRST),
        .setup__ENA(_setupS__ENA),
        .setup$aactivePixels(setup$ahFrontEnd[ 11 : 0 ] - setup$ahBackSync),
        .setup$aactiveLines(setup$avFrontEnd[ 11 : 0 ] - setup$avBackSync),
        .setup$apattern(8'd4),
        .setup$arampStep(20'd546),
        .setup__RDY(patternBlock$setup__RDY),
        .data(patternBlock$data),
        .data__RDY(patternBlock$data__RDY),
        .calculate(syncBlock$data));
    ExternalPin#(.width(36)) adv7511_d_pin (
        .in(adv7511_d_pin$in),
        .out(adv7511_d_pin$out));
    ExternalPin#(.width(1)) adv7511_de_pin (
        .in(adv7511_de_pin$in),
        .out(adv7511_de_pin$out));
    ExternalPin#(.width(1)) adv7511_hs_pin (
        .in(adv7511_hs_pin$in),
        .out(adv7511_hs_pin$out));
    ExternalPin#(.width(1)) adv7511_vs_pin (
        .in(adv7511_vs_pin$in),
        .out(adv7511_vs_pin$out));
    ExternalPin#(.width(1)) adv7511_clk_pin (
        .in(adv7511_clk_pin$in),
        .out(adv7511_clk_pin$out));
    SyncFF run__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(_runS__ENA),
        .in(run__ENA));
    SyncFF setup__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(_setupS__ENA),
        .in(setup__ENA));
    assign adv7511_clk_pin$in = RULE$initHdmi__ENA && ( CLK == 0 );
    assign adv7511_d_pin$in = RULE$initHdmi__ENA ? patternBlock$data : 36'd0;
    assign adv7511_de_pin$in = RULE$initHdmi__ENA && dataEnable;
    assign adv7511_hs_pin$in = RULE$initHdmi__ENA && hSync;
    assign adv7511_vs_pin$in = RULE$initHdmi__ENA && vSync;
    assign run__ACK = ( ( !REGGTEMP_run__ACK ) && syncBlock$run__RDY ) || REGGTEMP_run__ACK;
    assign setup__ACK = ( ( !REGGTEMP_setup__ACK ) && patternBlock$setup__RDY && syncBlock$setup__RDY ) || REGGTEMP_setup__ACK;
    // Extra assigments, not to output wires
    assign RULE$initHdmi__ENA = patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY;
    assign run__RDY = ( !REGGTEMP_run__ACK ) && syncBlock$run__RDY;
    assign setup__RDY = ( !REGGTEMP_setup__ACK ) && patternBlock$setup__RDY && syncBlock$setup__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        REGGTEMP_run__ACK <= 0;
        REGGTEMP_setup__ACK <= 0;
        _runS__ACK <= 0;
        _setupS__ACK <= 0;
        dataEnable <= 0;
        hSync <= 0;
        vSync <= 0;
      end // nRST
      else begin
        // 
            if (( !_runS__ENA ) && REGGTEMP_run__ACK)
            REGGTEMP_run__ACK <= 0;
            if (( !_setupS__ENA ) && REGGTEMP_setup__ACK)
            REGGTEMP_setup__ACK <= 0;
        // End of 
        if (patternBlock$data__RDY && syncBlock$dataEnable__RDY && syncBlock$hSync__RDY && syncBlock$vSync__RDY && RULE$initHdmi__ENA) begin // RULE$initHdmi__ENA
            dataEnable <= syncBlock$dataEnable;
            hSync <= syncBlock$hSync;
            vSync <= syncBlock$vSync;
        end; // End of RULE$initHdmi__ENA
        if (( !REGGTEMP_run__ACK ) && syncBlock$run__RDY && _runS__ENA) begin // run__ENA
            REGGTEMP_run__ACK <= 1;
        end; // End of run__ENA
        if (( !REGGTEMP_setup__ACK ) && patternBlock$setup__RDY && syncBlock$setup__RDY && _setupS__ENA) begin // setup__ENA
            REGGTEMP_setup__ACK <= 1;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
