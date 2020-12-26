interface SelectOutIfc#(funnelWidth = 8, width = 16);
    logic select__ENA;
    logic [32 - 1:0] select$v;
    logic select__RDY;
    modport server (input  select__ENA, select$v,
                    output select__RDY);
    modport client (output select__ENA, select$v,
                    input  select__RDY);
endinterface
