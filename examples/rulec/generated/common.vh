
`ifndef __COMMON_H__
`define __COMMON_H__
interface EchoRequest;//(input logic CLK, input logic nRST);
    logic say__ENA;
    logic [32 - 1:0]say$v;
    logic say__RDY;

    logic say2__ENA;
    logic [16 - 1:0]say2$a;
    logic [16 - 1:0]say2$b;
    logic say2__RDY;

    logic setLeds__ENA;
    logic [8 - 1:0]setLeds$v;
    logic setLeds__RDY;
    modport server (input say__ENA, say$v,
                          say2__ENA, say2$a, say2$b,
                          setLeds__ENA, setLeds$v,
                    output say__RDY, say2__RDY, setLeds__RDY);
    modport client (output say__ENA, say$v,
                          say2__ENA, say2$a, say2$b,
                          setLeds__ENA, setLeds$v,
                    input say__RDY, say2__RDY, setLeds__RDY);
endinterface

interface EchoIndication;//(input logic CLK, input logic nRST);
    logic heard__ENA;
    logic [32 - 1:0]heard$v;
    logic heard__RDY;

    logic heard2__ENA;
    logic [16 - 1:0]heard2$a;
    logic [16 - 1:0]heard2$b;
    logic heard2__RDY;

    logic heard3__ENA;
    logic [16 - 1:0]heard3$a;
    logic [32 - 1:0]heard3$b;
    logic [32 - 1:0]heard3$c;
    logic [16 - 1:0]heard3$d;
    logic heard3__RDY;
    modport server (input heard__ENA, heard$v,
                          heard2__ENA, heard2$a, heard2$b,
                          heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    output heard__RDY, heard2__RDY, heard3__RDY);
    modport client (output heard__ENA, heard$v,
                          heard2__ENA, heard2$a, heard2$b,
                          heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    input heard__RDY, heard2__RDY, heard3__RDY);
endinterface
`endif // __COMMON_H__
