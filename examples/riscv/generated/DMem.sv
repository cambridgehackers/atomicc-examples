interface DMem;
    logic request__ENA;
    logic [32 - 1:0] request$write_en;
    logic [32 - 1:0] request$addr;
    logic [32 - 1:0] request$data;
    logic request__RDY;
    logic [32 - 1:0] response;
    logic response__RDY;
    modport server (input  request__ENA, request$write_en, request$addr, request$data,
                    output request__RDY, response, response__RDY);
    modport client (output request__ENA, request$write_en, request$addr, request$data,
                    input  request__RDY, response, response__RDY);
endinterface
