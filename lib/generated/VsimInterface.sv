interface VsimInterface;
    logic  CLK;
    logic  nRST;
    logic  CLK_derivedClock;
    logic  nRST_derivedReset;
    logic  CLK_sys_clk;
    modport server (input  CLK, nRST, CLK_derivedClock, nRST_derivedReset, CLK_sys_clk);
    modport client (output CLK, nRST, CLK_derivedClock, nRST_derivedReset, CLK_sys_clk);
endinterface
