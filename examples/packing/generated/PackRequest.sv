interface PackRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic [8 - 1:0] say$seqno;
    logic say__RDY;
    modport server (input  say__ENA, say$v, say$seqno,
                    output say__RDY);
    modport client (output say__ENA, say$v, say$seqno,
                    input  say__RDY);
endinterface
