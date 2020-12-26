interface ClockImageonIfc;
    logic  CLK;
    logic  nRST;
    logic  hdmiClock;
    logic  hdminReset;
    logic  imageonClock;
    logic  imageonnReset;
    modport server (input  CLK, nRST,
                    output hdmiClock, hdminReset, imageonClock, imageonnReset);
    modport client (output CLK, nRST,
                    input  hdmiClock, hdminReset, imageonClock, imageonnReset);
endinterface
