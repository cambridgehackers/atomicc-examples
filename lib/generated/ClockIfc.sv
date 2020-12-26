interface ClockIfc;
    logic  CLK;
    logic  nRST;
    logic  clockOut;
    modport server (input  CLK, nRST,
                    output clockOut);
    modport client (output CLK, nRST,
                    input  clockOut);
endinterface
