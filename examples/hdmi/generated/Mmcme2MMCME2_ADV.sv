interface Mmcme2MMCME2_ADV;
    logic  CLKFBIN;
    logic  CLKFBOUT;
    logic  CLKFBOUTB;
    logic  CLKFBSTOPPED;
    logic  CLKIN1;
    logic  CLKIN2;
    logic  CLKINSEL;
    logic  CLKINSTOPPED;
    logic  CLKOUT0;
    logic  CLKOUT0B;
    logic  CLKOUT1;
    logic  CLKOUT1B;
    logic  CLKOUT2;
    logic  CLKOUT2B;
    logic  CLKOUT3;
    logic  CLKOUT3B;
    logic  CLKOUT4;
    logic  CLKOUT5;
    logic  CLKOUT6;
    logic [7 - 1:0] DADDR;
    logic  DCLK;
    logic  DEN;
    logic [16 - 1:0] DI;
    logic [16 - 1:0] DO;
    logic  DRDY;
    logic  DWE;
    logic  LOCKED;
    logic  PSCLK;
    logic  PSDONE;
    logic  PSEN;
    logic  PSINCDEC;
    logic  PWRDWN;
    logic  RST;
    modport server (input  CLKFBIN, CLKIN1, CLKIN2, CLKINSEL, DADDR, DCLK, DEN, DI, DWE, PSCLK, PSEN, PSINCDEC, PWRDWN, RST,
                    output CLKFBOUT, CLKFBOUTB, CLKFBSTOPPED, CLKINSTOPPED, CLKOUT0, CLKOUT0B, CLKOUT1, CLKOUT1B, CLKOUT2, CLKOUT2B, CLKOUT3, CLKOUT3B, CLKOUT4, CLKOUT5, CLKOUT6, DO, DRDY, LOCKED, PSDONE);
    modport client (output CLKFBIN, CLKIN1, CLKIN2, CLKINSEL, DADDR, DCLK, DEN, DI, DWE, PSCLK, PSEN, PSINCDEC, PWRDWN, RST,
                    input  CLKFBOUT, CLKFBOUTB, CLKFBSTOPPED, CLKINSTOPPED, CLKOUT0, CLKOUT0B, CLKOUT1, CLKOUT1B, CLKOUT2, CLKOUT2B, CLKOUT3, CLKOUT3B, CLKOUT4, CLKOUT5, CLKOUT6, DO, DRDY, LOCKED, PSDONE);
endinterface
