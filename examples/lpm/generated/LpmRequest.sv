interface LpmRequest;
    logic enter__ENA;
    logic [32 - 1:0] enter$data;
    logic enter__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$addr;
    logic [32 - 1:0] write$data;
    logic write__RDY;
    modport server (input  enter__ENA, enter$data, write__ENA, write$addr, write$data,
                    output enter__RDY, write__RDY);
    modport client (output enter__ENA, enter$data, write__ENA, write$addr, write$data,
                    input  enter__RDY, write__RDY);
endinterface
