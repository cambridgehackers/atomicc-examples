interface BtestIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
                    input  heard__RDY);
endinterface
