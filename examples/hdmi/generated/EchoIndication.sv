interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic [32 - 1:0] heard$hdmiCounter;
    logic [32 - 1:0] heard$imageonCounter;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v, heard$hdmiCounter, heard$imageonCounter,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v, heard$hdmiCounter, heard$imageonCounter,
                    input  heard__RDY);
endinterface
