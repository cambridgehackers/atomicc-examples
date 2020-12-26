interface IVectorRequest;
    logic say__ENA;
    logic [6 - 1:0] say$meth;
    logic [4 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$meth, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$meth, say$v,
                    input  say__RDY);
endinterface
