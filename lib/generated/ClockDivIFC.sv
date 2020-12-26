interface ClockDivIFC;
    logic  CLK;
    logic  CLK_OUT;
    logic  nRST;
    modport server (input  CLK, nRST,
                    output CLK_OUT);
    modport client (output CLK, nRST,
                    input  CLK_OUT);
endinterface
