interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$meth;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic say2__ENA;
    logic [32 - 1:0] say2$meth;
    logic [32 - 1:0] say2$v;
    logic say2__RDY;
    modport server (input  say__ENA, say$meth, say$v, say2__ENA, say2$meth, say2$v,
                    output say__RDY, say2__RDY);
    modport client (output say__ENA, say$meth, say$v, say2__ENA, say2$meth, say2$v,
                    input  say__RDY, say2__RDY);
endinterface
