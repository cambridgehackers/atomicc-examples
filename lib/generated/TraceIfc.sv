interface TraceIfc#(depth = 1024, head = 77, sensitivity = 99, width = 48);
    logic  CLK;
    logic  nRST;
    logic  enable;
    logic [width - 1:0] data;
    logic clear__ENA;
    logic clear__RDY;
    modport server (input  CLK, nRST, enable, data, clear__ENA,
                    output clear__RDY);
    modport client (output CLK, nRST, enable, data, clear__ENA,
                    input  clear__RDY);
endinterface
