`include "clockTop.generated.vh"

`default_nettype none
module ClockTop #(
    parameter real CLKIN1_PERIOD = 0.0)(
    input wire CLK,
    input wire nRST,
    output wire clockOut);
    wire clkbuf$I;
    wire clkbuf$O;
    wire clkbuf0$I;
    wire ps7_clockGen_pll$CLKFBIN;
    wire ps7_clockGen_pll$CLKFBOUT;
    wire ps7_clockGen_pll$CLKIN1;
    wire ps7_clockGen_pll$CLKIN2;
    wire ps7_clockGen_pll$CLKINSEL;
    wire ps7_clockGen_pll$CLKOUT0;
    wire [7 - 1:0]ps7_clockGen_pll$DADDR;
    wire ps7_clockGen_pll$DCLK;
    wire ps7_clockGen_pll$DEN;
    wire [16 - 1:0]ps7_clockGen_pll$DI;
    wire ps7_clockGen_pll$DWE;
    wire ps7_clockGen_pll$PSCLK;
    wire ps7_clockGen_pll$PSEN;
    wire ps7_clockGen_pll$PSINCDEC;
    wire ps7_clockGen_pll$PWRDWN;
    wire ps7_clockGen_pll$RST;
    wire rinverter$RESET_IN;
    wire rinverter$RESET_OUT;
    MMCME2_ADV#(.REF_JITTER2(1.0e-2),.REF_JITTER1(1.0e-2),.CLKOUT6_PHASE(0.0),.CLKOUT6_DUTY_CYCLE(0.5),.CLKOUT6_DIVIDE(10),.CLKOUT5_PHASE(0.0),.CLKOUT5_DUTY_CYCLE(0.5),.CLKOUT5_DIVIDE(10),.CLKOUT4_PHASE(0.0),.CLKOUT4_DUTY_CYCLE(0.5),.CLKOUT4_DIVIDE(10),.CLKOUT3_PHASE(0.0),.CLKOUT3_DUTY_CYCLE(0.5),.CLKOUT3_DIVIDE(10),.CLKOUT2_PHASE(0.0),.CLKOUT2_DUTY_CYCLE(0.5),.CLKOUT2_DIVIDE(10),.CLKOUT1_PHASE(0.0),.CLKOUT1_DUTY_CYCLE(0.5),.CLKOUT1_DIVIDE(10),.CLKOUT0_PHASE(0.0),.CLKOUT0_DUTY_CYCLE(0.5),.CLKOUT0_DIVIDE_F(5.0),.DIVCLK_DIVIDE(1),.CLKIN2_PERIOD(0.0),.CLKIN1_PERIOD(10.0),.CLKFBOUT_PHASE(0.0),.CLKFBOUT_MULT_F(10.0),.STARTUP_WAIT("FALSE"),.COMPENSATION("ZHOLD"),.CLKOUT4_CASCADE("FALSE"),.CLKOUT6_USE_FINE_PS("FALSE"),.CLKOUT5_USE_FINE_PS("FALSE"),.CLKOUT4_USE_FINE_PS("FALSE"),.CLKOUT3_USE_FINE_PS("FALSE"),.CLKOUT2_USE_FINE_PS("FALSE"),.CLKOUT1_USE_FINE_PS("FALSE"),.CLKOUT0_USE_FINE_PS("FALSE"),.CLKFBOUT_USE_FINE_PS("FALSE"),.BANDWIDTH("OPTIMIZED")) ps7_clockGen_pll (
        .CLKFBIN(ps7_clockGen_pll$CLKFBIN),
        .CLKFBOUT(ps7_clockGen_pll$CLKFBOUT),
        .CLKFBOUTB(),
        .CLKFBSTOPPED(),
        .CLKIN1(ps7_clockGen_pll$CLKIN1),
        .CLKIN2(ps7_clockGen_pll$CLKIN2),
        .CLKINSEL(ps7_clockGen_pll$CLKINSEL),
        .CLKINSTOPPED(),
        .CLKOUT0(ps7_clockGen_pll$CLKOUT0),
        .CLKOUT0B(),
        .CLKOUT1(),
        .CLKOUT1B(),
        .CLKOUT2(),
        .CLKOUT2B(),
        .CLKOUT3(),
        .CLKOUT3B(),
        .CLKOUT4(),
        .CLKOUT5(),
        .CLKOUT6(),
        .DADDR(ps7_clockGen_pll$DADDR),
        .DCLK(ps7_clockGen_pll$DCLK),
        .DEN(ps7_clockGen_pll$DEN),
        .DI(ps7_clockGen_pll$DI),
        .DO(),
        .DRDY(),
        .DWE(ps7_clockGen_pll$DWE),
        .LOCKED(),
        .PSCLK(ps7_clockGen_pll$PSCLK),
        .PSDONE(),
        .PSEN(ps7_clockGen_pll$PSEN),
        .PSINCDEC(ps7_clockGen_pll$PSINCDEC),
        .PWRDWN(ps7_clockGen_pll$PWRDWN),
        .RST(ps7_clockGen_pll$RST));
    ResetInverter rinverter (
        .RESET_IN(rinverter$RESET_IN),
        .RESET_OUT(rinverter$RESET_OUT));
    BUFG clkbuf (
        .I(clkbuf$I),
        .O(clkbuf$O));
    BUFG clkbuf0 (
        .I(clkbuf0$I),
        .O(clockOut));
    assign clkbuf$I = ps7_clockGen_pll$CLKFBOUT;
    assign clkbuf0$I = ps7_clockGen_pll$CLKOUT0;
    assign ps7_clockGen_pll$CLKFBIN = clkbuf$O;
    assign ps7_clockGen_pll$CLKIN1 = CLK;
    assign ps7_clockGen_pll$CLKIN2 = 0;
    assign ps7_clockGen_pll$CLKINSEL = 1;
    assign ps7_clockGen_pll$DADDR = 7'd0;
    assign ps7_clockGen_pll$DCLK = 0;
    assign ps7_clockGen_pll$DEN = 0;
    assign ps7_clockGen_pll$DI = 16'd0;
    assign ps7_clockGen_pll$DWE = 0;
    assign ps7_clockGen_pll$PSCLK = 0;
    assign ps7_clockGen_pll$PSEN = 0;
    assign ps7_clockGen_pll$PSINCDEC = 0;
    assign ps7_clockGen_pll$PWRDWN = 0;
    assign ps7_clockGen_pll$RST = rinverter$RESET_OUT;
    assign rinverter$RESET_IN = nRST;
endmodule 

`default_nettype wire    // set back to default value
