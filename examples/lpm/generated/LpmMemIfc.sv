interface LpmMemIfc;
    logic read__ENA;
    logic [32 - 1:0] read$addr;
    logic read__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$addr;
    logic [32 - 1:0] write$data;
    logic write__RDY;
    modport server (input  read__ENA, read$addr, write__ENA, write$addr, write$data,
                    output read__RDY, write__RDY);
    modport client (output read__ENA, read$addr, write__ENA, write$addr, write$data,
                    input  read__RDY, write__RDY);
endinterface
