`include "hdmi.generated.vh"

`default_nettype none
module ClockImageon (
    input wire CLK,
    input wire nRST,
    output wire hdmiClock,
    output wire imageonClock);
    logic fbclockb$O;
    logic imageon_pll$CLKFBOUT;
    logic imageon_pll$CLKOUT0;
    logic imageon_pll$CLKOUT1;
    logic rinverter$RESET_OUT;
    MMCME2_ADV#(.REF_JITTER2(0.01),.REF_JITTER1(0.01),.CLKOUT2_PHASE(0.0),.CLKOUT2_DUTY_CYCLE(0.5),.CLKOUT2_DIVIDE(1),.CLKOUT1_PHASE(0.0),.CLKOUT1_DUTY_CYCLE(0.5),.CLKOUT1_DIVIDE(32),.CLKOUT0_PHASE(0.0),.CLKOUT0_DUTY_CYCLE(0.5),.CLKOUT0_DIVIDE_F(8.0),.DIVCLK_DIVIDE(1),.CLKIN2_PERIOD(6.7340070000000001),.CLKIN1_PERIOD(10.0),.CLKFBOUT_PHASE(0.0),.CLKFBOUT_MULT_F(8.0),.STARTUP_WAIT("FALSE"),.COMPENSATION("ZHOLD"),.CLKOUT4_CASCADE("FALSE"),.CLKOUT2_USE_FINE_PS("FALSE"),.CLKOUT1_USE_FINE_PS("FALSE"),.CLKOUT0_USE_FINE_PS("FALSE"),.CLKFBOUT_USE_FINE_PS("FALSE"),.BANDWIDTH("OPTIMIZED")) imageon_pll (
        .CLKFBIN(fbclockb$O),
        .CLKFBOUT(imageon_pll$CLKFBOUT),
        .CLKFBOUTB(),
        .CLKFBSTOPPED(),
        .CLKIN1(CLK),
        .CLKIN2(1'd0),
        .CLKINSEL(1'd1),
        .CLKINSTOPPED(),
        .CLKOUT0(imageon_pll$CLKOUT0),
        .CLKOUT0B(),
        .CLKOUT1(imageon_pll$CLKOUT1),
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
        .RESET_IN(nRST),
        .RESET_OUT(rinverter$RESET_OUT));
    BUFG fbclockb (
        .I(imageon_pll$CLKFBOUT),
        .O(fbclockb$O));
    BUFG hdmi_clockb (
        .I(imageon_pll$CLKOUT0),
        .O(hdmiClock));
    BUFG imageon_clockb (
        .I(imageon_pll$CLKOUT1),
        .O(imageonClock));
endmodule

`default_nettype wire    // set back to default value
