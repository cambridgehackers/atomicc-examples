interface LpmIndication;
    logic out__ENA;
    logic [32 - 1:0] out$data;
    logic out__RDY;
    modport server (input  out__ENA, out$data,
                    output out__RDY);
    modport client (output out__ENA, out$data,
                    input  out__RDY);
endinterface
