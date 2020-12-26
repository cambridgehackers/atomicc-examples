interface MBSCANE2IFC;
    logic  CAPTURE;
    logic  DRCK;
    logic  RESET;
    logic  RUNTEST;
    logic  SEL;
    logic  SHIFT;
    logic  TCK;
    logic  TDI;
    logic  TDO;
    logic  TMS;
    logic  UPDATE;
    modport server (input  TDO,
                    output CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE);
    modport client (output TDO,
                    input  CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE);
endinterface
