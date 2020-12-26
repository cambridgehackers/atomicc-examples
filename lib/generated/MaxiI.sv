interface MaxiI;
    logic R__ENA;
    logic [32 - 1:0] R$data;
    logic [12 - 1:0] R$id;
    logic  R$last;
    logic [2 - 1:0] R$resp;
    logic R__RDY;
    logic B__ENA;
    logic [12 - 1:0] B$id;
    logic [2 - 1:0] B$resp;
    logic B__RDY;
    modport server (input  R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    output R__RDY, B__RDY);
    modport client (output R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    input  R__RDY, B__RDY);
endinterface
