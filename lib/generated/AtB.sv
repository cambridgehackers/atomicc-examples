interface AtB#(owidth = 32, width = 48);
    logic clear__ENA;
    logic clear__RDY;
    modport server (input  clear__ENA,
                    output clear__RDY);
    modport client (output clear__ENA,
                    input  clear__RDY);
endinterface
