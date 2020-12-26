interface PackIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic [8 - 1:0] heard$writeCount;
    logic [8 - 1:0] heard$readCount;
    logic [8 - 1:0] heard$seqno;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v, heard$writeCount, heard$readCount, heard$seqno,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v, heard$writeCount, heard$readCount, heard$seqno,
                    input  heard__RDY);
endinterface
