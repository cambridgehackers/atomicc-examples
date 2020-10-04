`include "zynqTop.generated.vh"

`default_nettype none
module ZynqTop (
    inout wire [54 - 1:0]MIO,
    inout wire [15 - 1:0]DDR_Addr,
    inout wire [3 - 1:0]DDR_BankAddr,
    inout wire DDR_CAS_n,
    inout wire DDR_CKE,
    inout wire DDR_Clk_n,
    inout wire DDR_Clk_p,
    inout wire DDR_CS_n,
    inout wire [4 - 1:0]DDR_DM,
    inout wire [32 - 1:0]DDR_DQ,
    inout wire [4 - 1:0]DDR_DQS_n,
    inout wire [4 - 1:0]DDR_DQS_p,
    inout wire DDR_DRSTB,
    inout wire DDR_ODT,
    inout wire DDR_RAS_n,
    inout wire FIXED_IO_ddr_vrn,
    inout wire FIXED_IO_ddr_vrp,
    inout wire DDR_WEB,
    inout wire FIXED_IO_ps_clk,
    inout wire FIXED_IO_ps_porb,
    inout wire FIXED_IO_ps_srstb);
    logic CLK;
    logic nRST;
    Pps7fclk ps7_ps7_foo$FCLK();
    MaxiI ps7_ps7_foo$MAXIGP0_I();
    MaxiO ps7_ps7_foo$MAXIGP0_O();
    ZynqInterrupt ps7_ps7_foo$intr();
    MaxiI test$MAXIGP0_I();
    MaxiO test$MAXIGP0_O();
    P7Wrap ps7_ps7_foo (
        .MIO(MIO),
        .DDR_Addr(DDR_Addr),
        .DDR_BankAddr(DDR_BankAddr),
        .DDR_CAS_n(DDR_CAS_n),
        .DDR_CKE(DDR_CKE),
        .DDR_Clk_n(DDR_Clk_n),
        .DDR_Clk_p(DDR_Clk_p),
        .DDR_CS_n(DDR_CS_n),
        .DDR_DM(DDR_DM),
        .DDR_DQ(DDR_DQ),
        .DDR_DQS_n(DDR_DQS_n),
        .DDR_DQS_p(DDR_DQS_p),
        .DDR_DRSTB(DDR_DRSTB),
        .DDR_ODT(DDR_ODT),
        .DDR_RAS_n(DDR_RAS_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_WEB),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .intr(ps7_ps7_foo$intr),
        .MAXIGP0_O(ps7_ps7_foo$MAXIGP0_O),
        .MAXIGP0_I(test$MAXIGP0_I),
        .FCLK(ps7_ps7_foo$FCLK));
    AxiTop test (
        .CLK(CLK),
        .nRST(nRST),
        .interrupt(ps7_ps7_foo$intr.interrupt),
        .MAXIGP0_O(ps7_ps7_foo$MAXIGP0_O),
        .MAXIGP0_I(test$MAXIGP0_I));
    BUFG ps7_fclk_0_c (
        .I(ps7_ps7_foo$FCLK.CLK[ 0 : 0 ]),
        .O(CLK));
    BUFG ps7_freset_0_r (
        .I(ps7_ps7_foo$FCLK.RESETN[ 0 : 0 ]),
        .O(nRST));
    // Extra assigments, not to output wires
    assign ps7_ps7_foo$intr.CLK = CLK;
    assign ps7_ps7_foo$intr.nRST = nRST;
endmodule

`default_nettype wire    // set back to default value
