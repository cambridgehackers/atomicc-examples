interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic setup__ENA;
    logic [16 - 1:0] setup$ahEnd;
    logic [16 - 1:0] setup$ahFrontEnd;
    logic [8 - 1:0] setup$ahBackSync;
    logic [8 - 1:0] setup$ahSyncWidth;
    logic [16 - 1:0] setup$avEnd;
    logic [16 - 1:0] setup$avFrontEnd;
    logic [8 - 1:0] setup$avBackSync;
    logic [8 - 1:0] setup$avSyncWidth;
    logic setup__RDY;
    modport server (input  say__ENA, say$v, setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    output say__RDY, setup__RDY);
    modport client (output say__ENA, say$v, setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    input  say__RDY, setup__RDY);
endinterface
