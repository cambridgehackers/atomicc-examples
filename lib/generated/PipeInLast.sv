interface PipeInLast#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic  enq$last;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$last,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$last,
                    input  enq__RDY);
endinterface
