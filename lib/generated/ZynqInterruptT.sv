interface ZynqInterruptT;
    logic  CLK;
    logic  nRST;
    logic  interrupt;
    modport server (input  CLK, nRST,
                    output interrupt);
    modport client (output CLK, nRST,
                    input  interrupt);
endinterface
