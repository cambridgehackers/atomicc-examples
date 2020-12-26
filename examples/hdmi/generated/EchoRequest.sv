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
