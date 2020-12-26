interface Swap;
    logic y2x__ENA;
    logic y2x__RDY;
    logic y2xnull__ENA;
    logic y2xnull__RDY;
    logic x2y__ENA;
    logic x2y__RDY;
    modport server (input  y2x__ENA, y2xnull__ENA, x2y__ENA,
                    output y2x__RDY, y2xnull__RDY, x2y__RDY);
    modport client (output y2x__ENA, y2xnull__ENA, x2y__ENA,
                    input  y2x__RDY, y2xnull__RDY, x2y__RDY);
endinterface
