interface ZynqInterrupt;
    logic  interrupt;
    logic  CLK;
    logic  nRST;
    modport server (input  interrupt, CLK, nRST);
    modport client (output interrupt, CLK, nRST);
endinterface
