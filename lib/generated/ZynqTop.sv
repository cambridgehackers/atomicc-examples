`include "zynqTop.generated.vh"

`default_nettype none
module ZynqTop (
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
    inout wire FIXED_IO_ps_srstb,
    inout wire [54 - 1:0]MIO);
    wire CLK;
    wire nRST;
    wire ps7_fclk_0_c$I;
    wire ps7_fclk_0_c$O;
    wire ps7_freset_0_r$I;
    wire ps7_freset_0_r$O;
    wire [4 - 1:0]ps7_ps7_foo$FCLKCLK;
    wire [4 - 1:0]ps7_ps7_foo$FCLKRESETN;
    wire ps7_ps7_foo$MAXIGP0_I$B__RDY;
    wire ps7_ps7_foo$MAXIGP0_I$R__RDY;
    wire [32 - 1:0]ps7_ps7_foo$MAXIGP0_O$AR$addr;
    wire [12 - 1:0]ps7_ps7_foo$MAXIGP0_O$AR$id;
    wire [4 - 1:0]ps7_ps7_foo$MAXIGP0_O$AR$len;
    wire ps7_ps7_foo$MAXIGP0_O$AR__ENA;
    wire [32 - 1:0]ps7_ps7_foo$MAXIGP0_O$AW$addr;
    wire [12 - 1:0]ps7_ps7_foo$MAXIGP0_O$AW$id;
    wire [4 - 1:0]ps7_ps7_foo$MAXIGP0_O$AW$len;
    wire ps7_ps7_foo$MAXIGP0_O$AW__ENA;
    wire [32 - 1:0]ps7_ps7_foo$MAXIGP0_O$W$data;
    wire [12 - 1:0]ps7_ps7_foo$MAXIGP0_O$W$id;
    wire ps7_ps7_foo$MAXIGP0_O$W$last;
    wire ps7_ps7_foo$MAXIGP0_O$W__ENA;
    wire ps7_ps7_foo$intrCLK;
    wire ps7_ps7_foo$intrinterrupt;
    wire ps7_ps7_foo$intrnRST;
    wire test$CLK;
    wire [12 - 1:0]test$MAXIGP0_I$B$id;
    wire [2 - 1:0]test$MAXIGP0_I$B$resp;
    wire test$MAXIGP0_I$B__ENA;
    wire [32 - 1:0]test$MAXIGP0_I$R$data;
    wire [12 - 1:0]test$MAXIGP0_I$R$id;
    wire test$MAXIGP0_I$R$last;
    wire [2 - 1:0]test$MAXIGP0_I$R$resp;
    wire test$MAXIGP0_I$R__ENA;
    wire test$MAXIGP0_O$AR__RDY;
    wire test$MAXIGP0_O$AW__RDY;
    wire test$MAXIGP0_O$W__RDY;
    wire test$interrupt;
    wire test$nRST;
    MaxiI ps7_ps7_foo$MAXIGP0_I();
    MaxiO test$MAXIGP0_O();
    P7Wrap ps7_ps7_foo (
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
        .intrinterrupt(ps7_ps7_foo$intrinterrupt),
        .intrCLK(ps7_ps7_foo$intrCLK),
        .intrnRST(ps7_ps7_foo$intrnRST),
        .MAXIGP0_O(test$MAXIGP0_O),
        .MAXIGP0_I(ps7_ps7_foo$MAXIGP0_I),
        .MIO(MIO),
        .FCLKCLK(ps7_ps7_foo$FCLKCLK),
        .FCLKCLKTRIGN(0),
        .FCLKRESETN(ps7_ps7_foo$FCLKRESETN));
    AxiTop test (
        .CLK(test$CLK),
        .nRST(test$nRST),
        .interrupt(test$interrupt),
        .MAXIGP0_O(test$MAXIGP0_O),
        .MAXIGP0_I(ps7_ps7_foo$MAXIGP0_I));
    BUFG ps7_fclk_0_c (
        .I(ps7_fclk_0_c$I),
        .O(ps7_fclk_0_c$O));
    BUFG ps7_freset_0_r (
        .I(ps7_freset_0_r$I),
        .O(ps7_freset_0_r$O));
    assign ps7_fclk_0_c$I = ps7_ps7_foo$FCLKCLK[ 0 ];
    assign ps7_freset_0_r$I = ps7_ps7_foo$FCLKRESETN[ 0 ];
    assign ps7_ps7_foo$intrCLK = CLK;
    assign ps7_ps7_foo$intrinterrupt = test$interrupt;
    assign ps7_ps7_foo$intrnRST = nRST;
    assign test$CLK = CLK;
    assign test$nRST = nRST;
    // Extra assigments, not to output wires
    assign CLK = ps7_fclk_0_c$O;
    assign nRST = ps7_freset_0_r$O;
endmodule

`default_nettype wire    // set back to default value
