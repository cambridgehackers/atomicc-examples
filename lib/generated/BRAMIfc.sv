interface BRAMIfc#(depth = 1024, width = 48);
    logic write__ENA;
    logic [$clog2(depth) - 1:0] write$addr;
    logic [width - 1:0] write$data;
    logic write__RDY;
    logic read__ENA;
    logic [$clog2(depth) - 1:0] read$addr;
    logic read__RDY;
    logic [width - 1:0] dataOut;
    logic dataOut__RDY;
    modport server (input  write__ENA, write$addr, write$data, read__ENA, read$addr,
                    output write__RDY, read__RDY, dataOut, dataOut__RDY);
    modport client (output write__ENA, write$addr, write$data, read__ENA, read$addr,
                    input  write__RDY, read__RDY, dataOut, dataOut__RDY);
endinterface
