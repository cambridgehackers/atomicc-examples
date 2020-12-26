interface HdmiImageonIfc;
    logic  CLK;
    logic  nRST;
    modport server (input  CLK, nRST);
    modport client (output CLK, nRST);
endinterface
