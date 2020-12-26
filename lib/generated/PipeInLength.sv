interface PipeInLength#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic [16 - 1:0] enq$size;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$size,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$size,
                    input  enq__RDY);
endinterface
