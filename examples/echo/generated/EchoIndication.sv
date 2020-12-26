interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    logic heards__ENA;
    logic [16 - 1:0] heards$ahEnd;
    logic [16 - 1:0] heards$ahFrontEnd;
    logic [8 - 1:0] heards$ahBackSync;
    logic [8 - 1:0] heards$ahSyncWidth;
    logic [16 - 1:0] heards$avEnd;
    logic [16 - 1:0] heards$avFrontEnd;
    logic [8 - 1:0] heards$avBackSync;
    logic [8 - 1:0] heards$avSyncWidth;
    logic heards__RDY;
    modport server (input  heard__ENA, heard$v, heards__ENA, heards$ahEnd, heards$ahFrontEnd, heards$ahBackSync, heards$ahSyncWidth, heards$avEnd, heards$avFrontEnd, heards$avBackSync, heards$avSyncWidth,
                    output heard__RDY, heards__RDY);
    modport client (output heard__ENA, heard$v, heards__ENA, heards$ahEnd, heards$ahFrontEnd, heards$ahBackSync, heards$ahSyncWidth, heards$avEnd, heards$avFrontEnd, heards$avBackSync, heards$avSyncWidth,
                    input  heard__RDY, heards__RDY);
endinterface
