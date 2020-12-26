interface Pps7fclk;
    logic [4 - 1:0] CLK;
    logic [4 - 1:0] CLKTRIGN;
    logic [4 - 1:0] RESETN;
    modport server (input  CLKTRIGN,
                    output CLK, RESETN);
    modport client (output CLKTRIGN,
                    input  CLK, RESETN);
endinterface
