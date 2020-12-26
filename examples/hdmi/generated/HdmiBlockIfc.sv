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
