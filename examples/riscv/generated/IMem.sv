interface IMem;
    logic [32 - 1:0] read;
    logic [32 - 1:0] read$pc;
    logic read__RDY;
    modport server (input  read$pc,
                    output read, read__RDY);
    modport client (output read$pc,
                    input  read, read__RDY);
endinterface
