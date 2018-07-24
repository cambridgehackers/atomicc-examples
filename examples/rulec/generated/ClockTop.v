`include "zynqTop.generated.vh"

`default_nettype none
module ClockTop #(
    parameter real CLKIN1_PERIOD = 0.0)(
    input wire userCLK,
    input wire usernRST,
    output wire clockOut);
    wire CLK;
    wire nRST;
    wire RULEinit$100__ENA;
    wire RULEinit$100__RDY;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire clkbuf$I;
    wire clkbuf$O;
    wire clkbuf0$I;
    wire ps7_clockGen_pll$CLKFBIN;
    wire ps7_clockGen_pll$CLKFBOUT;
    wire ps7_clockGen_pll$CLKIN1;
    wire ps7_clockGen_pll$CLKIN2;
    wire ps7_clockGen_pll$CLKINSEL;
    wire ps7_clockGen_pll$CLKOUT0;
    wire [6:0]ps7_clockGen_pll$DADDR;
    wire ps7_clockGen_pll$DCLK;
    wire ps7_clockGen_pll$DEN;
    wire [15:0]ps7_clockGen_pll$DI;
    wire ps7_clockGen_pll$DWE;
    wire ps7_clockGen_pll$PSCLK;
    wire ps7_clockGen_pll$PSEN;
    wire ps7_clockGen_pll$PSINCDEC;
    wire ps7_clockGen_pll$PWRDWN;
    wire ps7_clockGen_pll$RST;
    wire rinverter$RESET_IN;
    wire rinverter$RESET_OUT;
    assign RULEinit$100__ENA = 1;
    assign RULEinit__ENA = 1;
    MMCME2_ADV#(.REF_JITTER2(1.0e-2),.REF_JITTER1(1.0e-2),.CLKOUT6_PHASE(0.0),.CLKOUT6_DUTY_CYCLE(0.5),.CLKOUT6_DIVIDE(10),.CLKOUT5_PHASE(0.0),.CLKOUT5_DUTY_CYCLE(0.5),.CLKOUT5_DIVIDE(10),.CLKOUT4_PHASE(0.0),.CLKOUT4_DUTY_CYCLE(0.5),.CLKOUT4_DIVIDE(10),.CLKOUT3_PHASE(0.0),.CLKOUT3_DUTY_CYCLE(0.5),.CLKOUT3_DIVIDE(10),.CLKOUT2_PHASE(0.0),.CLKOUT2_DUTY_CYCLE(0.5),.CLKOUT2_DIVIDE(10),.CLKOUT1_PHASE(0.0),.CLKOUT1_DUTY_CYCLE(0.5),.CLKOUT1_DIVIDE(10),.CLKOUT0_PHASE(0.0),.CLKOUT0_DUTY_CYCLE(0.5),.CLKOUT0_DIVIDE_F(5.0),.DIVCLK_DIVIDE(1),.CLKIN2_PERIOD(0.0),.CLKIN1_PERIOD(10.0),.CLKFBOUT_PHASE(0.0),.CLKFBOUT_MULT_F(10.0),.STARTUP_WAIT("FALSE"),.COMPENSATION("ZHOLD"),.CLKOUT4_CASCADE("FALSE"),.CLKOUT6_USE_FINE_PS("FALSE"),.CLKOUT5_USE_FINE_PS("FALSE"),.CLKOUT4_USE_FINE_PS("FALSE"),.CLKOUT3_USE_FINE_PS("FALSE"),.CLKOUT2_USE_FINE_PS("FALSE"),.CLKOUT1_USE_FINE_PS("FALSE"),.CLKOUT0_USE_FINE_PS("FALSE"),.CLKFBOUT_USE_FINE_PS("FALSE"),.BANDWIDTH("OPTIMIZED")) ps7_clockGen_pll (
        .CLKFBIN(clkbuf$O),
        .CLKFBOUT(ps7_clockGen_pll$CLKFBOUT),
        .CLKFBOUTB(),
        .CLKFBSTOPPED(),
        .CLKIN1(userCLK),
        .CLKIN2(1'd0),
        .CLKINSEL(1'd1),
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
        .DADDR(7'd0),
        .DCLK(1'd0),
        .DEN(1'd0),
        .DI(16'd0),
        .DO(),
        .DRDY(),
        .DWE(1'd0),
        .LOCKED(),
        .PSCLK(1'd0),
        .PSDONE(),
        .PSEN(1'd0),
        .PSINCDEC(1'd0),
        .PWRDWN(1'd0),
        .RST(rinverter$RESET_OUT));
    ResetInverter rinverter (
        .RESET_IN(usernRST),
        .RESET_OUT(rinverter$RESET_OUT));
    BUFG clkbuf (
        .I(ps7_clockGen_pll$CLKFBOUT),
        .O(clkbuf$O));
    BUFG clkbuf0 (
        .I(ps7_clockGen_pll$CLKOUT0),
        .O(clockOut));
    assign clkbuf$I = ps7_clockGen_pll$CLKFBOUT;
    assign clkbuf0$I = ps7_clockGen_pll$CLKOUT0;
    assign ps7_clockGen_pll$CLKFBIN = clkbuf$O;
    assign ps7_clockGen_pll$CLKIN1 = userCLK;
    assign ps7_clockGen_pll$CLKIN2 = 1'd0;
    assign ps7_clockGen_pll$CLKINSEL = 1'd1;
    assign ps7_clockGen_pll$DADDR = 7'd0;
    assign ps7_clockGen_pll$DCLK = 1'd0;
    assign ps7_clockGen_pll$DEN = 1'd0;
    assign ps7_clockGen_pll$DI = 16'd0;
    assign ps7_clockGen_pll$DWE = 1'd0;
    assign ps7_clockGen_pll$PSCLK = 1'd0;
    assign ps7_clockGen_pll$PSEN = 1'd0;
    assign ps7_clockGen_pll$PSINCDEC = 1'd0;
    assign ps7_clockGen_pll$PWRDWN = 1'd0;
    assign ps7_clockGen_pll$RST = rinverter$RESET_OUT;
    assign rinverter$RESET_IN = usernRST;
    // Extra assigments, not to output wires
    assign RULEinit$100__RDY = 1;
    assign RULEinit__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
