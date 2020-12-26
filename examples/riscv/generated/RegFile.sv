interface RegFile;
    logic [32 - 1:0] read;
    logic [32 - 1:0] read$regnum;
    logic read__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$regnum;
    logic [32 - 1:0] write$regval;
    logic write__RDY;
    modport server (input  read$regnum, write__ENA, write$regnum, write$regval,
                    output read, read__RDY, write__RDY);
    modport client (output read$regnum, write__ENA, write$regnum, write$regval,
                    input  read, read__RDY, write__RDY);
endinterface
