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
