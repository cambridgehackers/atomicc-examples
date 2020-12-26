interface MaxiO;
    logic AR__ENA;
    logic [32 - 1:0] AR$addr;
    logic [12 - 1:0] AR$id;
    logic [4 - 1:0] AR$len;
    logic AR__RDY;
    logic AW__ENA;
    logic [32 - 1:0] AW$addr;
    logic [12 - 1:0] AW$id;
    logic [4 - 1:0] AW$len;
    logic AW__RDY;
    logic W__ENA;
    logic [32 - 1:0] W$data;
    logic [12 - 1:0] W$id;
    logic  W$last;
    logic W__RDY;
    modport server (input  AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    output AR__RDY, AW__RDY, W__RDY);
    modport client (output AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    input  AR__RDY, AW__RDY, W__RDY);
endinterface
