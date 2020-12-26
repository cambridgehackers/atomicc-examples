interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    logic heard2__ENA;
    logic [16 - 1:0] heard2$a;
    logic [16 - 1:0] heard2$b;
    logic heard2__RDY;
    logic heard3__ENA;
    logic [16 - 1:0] heard3$a;
    logic [32 - 1:0] heard3$b;
    logic [32 - 1:0] heard3$c;
    logic [16 - 1:0] heard3$d;
    logic heard3__RDY;
    modport server (input  heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    output heard__RDY, heard2__RDY, heard3__RDY);
    modport client (output heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    input  heard__RDY, heard2__RDY, heard3__RDY);
endinterface
