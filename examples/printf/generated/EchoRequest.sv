interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic say2__ENA;
    logic [16 - 1:0] say2$a;
    logic [16 - 1:0] say2$b;
    logic say2__RDY;
    logic setLeds__ENA;
    logic [8 - 1:0] setLeds$v;
    logic setLeds__RDY;
    modport server (input  say__ENA, say$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    output say__RDY, say2__RDY, setLeds__RDY);
    modport client (output say__ENA, say$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    input  say__RDY, say2__RDY, setLeds__RDY);
endinterface
