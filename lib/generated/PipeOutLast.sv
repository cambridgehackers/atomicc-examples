interface PipeOutLast#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic [width - 1:0] first;
    logic first__RDY;
    logic  last;
    logic last__RDY;
    modport server (input  deq__ENA,
                    output deq__RDY, first, first__RDY, last, last__RDY);
    modport client (output deq__ENA,
                    input  deq__RDY, first, first__RDY, last, last__RDY);
endinterface
