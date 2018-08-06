`include "zynqTop.generated.vh"

`default_nettype none
module ZynqTopNew (
    inout wire [14:0]DDR_Addr,
    inout wire [2:0]DDR_BankAddr,
    inout wire DDR_CAS_n,
    inout wire DDR_CKE,
    inout wire DDR_Clk_n,
    inout wire DDR_Clk_p,
    inout wire DDR_CS_n,
    inout wire [3:0]DDR_DM,
    inout wire [31:0]DDR_DQ,
    inout wire [3:0]DDR_DQS_n,
    inout wire [3:0]DDR_DQS_p,
    inout wire DDR_DRSTB,
    inout wire DDR_ODT,
    inout wire DDR_RAS_n,
    inout wire FIXED_IO_ddr_vrn,
    inout wire FIXED_IO_ddr_vrp,
    inout wire DDR_WEB,
    inout wire FIXED_IO_ps_clk,
    inout wire FIXED_IO_ps_porb,
    inout wire FIXED_IO_ps_srstb,
    inout wire [53:0]MIO);
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire ps7_fclk_0_c$O;
    wire ps7_freset_0_r$O;
    wire [3:0]ps7_ps7_foo$FCLKCLK;
    wire [3:0]ps7_ps7_foo$FCLKRESETN;
    wire ps7_ps7_foo$MAXIGP0_I$B__RDY;
    wire ps7_ps7_foo$MAXIGP0_I$R__RDY;
    wire [31:0]ps7_ps7_foo$MAXIGP0_O$AR$addr;
    wire [11:0]ps7_ps7_foo$MAXIGP0_O$AR$id;
    wire [3:0]ps7_ps7_foo$MAXIGP0_O$AR$len;
    wire ps7_ps7_foo$MAXIGP0_O$AR__ENA;
    wire [31:0]ps7_ps7_foo$MAXIGP0_O$AW$addr;
    wire [11:0]ps7_ps7_foo$MAXIGP0_O$AW$id;
    wire [3:0]ps7_ps7_foo$MAXIGP0_O$AW$len;
    wire ps7_ps7_foo$MAXIGP0_O$AW__ENA;
    wire [31:0]ps7_ps7_foo$MAXIGP0_O$W$data;
    wire [11:0]ps7_ps7_foo$MAXIGP0_O$W$id;
    wire ps7_ps7_foo$MAXIGP0_O$W$last;
    wire ps7_ps7_foo$MAXIGP0_O$W__ENA;
    wire [11:0]test$MAXIGP0_I$B$id;
    wire [1:0]test$MAXIGP0_I$B$resp;
    wire test$MAXIGP0_I$B__ENA;
    wire [31:0]test$MAXIGP0_I$R$data;
    wire [11:0]test$MAXIGP0_I$R$id;
    wire test$MAXIGP0_I$R$last;
    wire [1:0]test$MAXIGP0_I$R$resp;
    wire test$MAXIGP0_I$R__ENA;
    wire test$MAXIGP0_O$AR__RDY;
    wire test$MAXIGP0_O$AW__RDY;
    wire test$MAXIGP0_O$W__RDY;
    wire test$interrupt;
    P7Wrap ps7_ps7_foo (
        .MAXIGP0_O$AR__ENA(ps7_ps7_foo$MAXIGP0_O$AR__ENA),
        .MAXIGP0_O$AR$addr(ps7_ps7_foo$MAXIGP0_O$AR$addr),
        .MAXIGP0_O$AR$id(ps7_ps7_foo$MAXIGP0_O$AR$id),
        .MAXIGP0_O$AR$len(ps7_ps7_foo$MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__RDY(test$MAXIGP0_O$AR__RDY),
        .MAXIGP0_O$AW__ENA(ps7_ps7_foo$MAXIGP0_O$AW__ENA),
        .MAXIGP0_O$AW$addr(ps7_ps7_foo$MAXIGP0_O$AW$addr),
        .MAXIGP0_O$AW$id(ps7_ps7_foo$MAXIGP0_O$AW$id),
        .MAXIGP0_O$AW$len(ps7_ps7_foo$MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__RDY(test$MAXIGP0_O$AW__RDY),
        .MAXIGP0_O$W__ENA(ps7_ps7_foo$MAXIGP0_O$W__ENA),
        .MAXIGP0_O$W$data(ps7_ps7_foo$MAXIGP0_O$W$data),
        .MAXIGP0_O$W$id(ps7_ps7_foo$MAXIGP0_O$W$id),
        .MAXIGP0_O$W$last(ps7_ps7_foo$MAXIGP0_O$W$last),
        .MAXIGP0_O$W__RDY(test$MAXIGP0_O$W__RDY),
        .MAXIGP0_I$B__ENA(test$MAXIGP0_I$B__ENA),
        .MAXIGP0_I$B$id(test$MAXIGP0_I$B$id),
        .MAXIGP0_I$B$resp(test$MAXIGP0_I$B$resp),
        .MAXIGP0_I$B__RDY(ps7_ps7_foo$MAXIGP0_I$B__RDY),
        .MAXIGP0_I$R__ENA(test$MAXIGP0_I$R__ENA),
        .MAXIGP0_I$R$data(test$MAXIGP0_I$R$data),
        .MAXIGP0_I$R$id(test$MAXIGP0_I$R$id),
        .MAXIGP0_I$R$last(test$MAXIGP0_I$R$last),
        .MAXIGP0_I$R$resp(test$MAXIGP0_I$R$resp),
        .MAXIGP0_I$R__RDY(ps7_ps7_foo$MAXIGP0_I$R__RDY),
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
        .intrinterrupt(test$interrupt),
        .intrCLK(ps7_fclk_0_c$O),
        .intrnRST(ps7_freset_0_r$O),
        .MIO(MIO),
        .FCLKCLK(ps7_ps7_foo$FCLKCLK),
        .FCLKCLKTRIGN(0),
        .FCLKRESETN(ps7_ps7_foo$FCLKRESETN));
    TestTop test (
        .MAXIGP0_O$AR__ENA(ps7_ps7_foo$MAXIGP0_O$AR__ENA),
        .MAXIGP0_O$AR$addr(ps7_ps7_foo$MAXIGP0_O$AR$addr),
        .MAXIGP0_O$AR$id(ps7_ps7_foo$MAXIGP0_O$AR$id),
        .MAXIGP0_O$AR$len(ps7_ps7_foo$MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__RDY(test$MAXIGP0_O$AR__RDY),
        .MAXIGP0_O$AW__ENA(ps7_ps7_foo$MAXIGP0_O$AW__ENA),
        .MAXIGP0_O$AW$addr(ps7_ps7_foo$MAXIGP0_O$AW$addr),
        .MAXIGP0_O$AW$id(ps7_ps7_foo$MAXIGP0_O$AW$id),
        .MAXIGP0_O$AW$len(ps7_ps7_foo$MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__RDY(test$MAXIGP0_O$AW__RDY),
        .MAXIGP0_O$W__ENA(ps7_ps7_foo$MAXIGP0_O$W__ENA),
        .MAXIGP0_O$W$data(ps7_ps7_foo$MAXIGP0_O$W$data),
        .MAXIGP0_O$W$id(ps7_ps7_foo$MAXIGP0_O$W$id),
        .MAXIGP0_O$W$last(ps7_ps7_foo$MAXIGP0_O$W$last),
        .MAXIGP0_O$W__RDY(test$MAXIGP0_O$W__RDY),
        .MAXIGP0_I$B__ENA(test$MAXIGP0_I$B__ENA),
        .MAXIGP0_I$B$id(test$MAXIGP0_I$B$id),
        .MAXIGP0_I$B$resp(test$MAXIGP0_I$B$resp),
        .MAXIGP0_I$B__RDY(ps7_ps7_foo$MAXIGP0_I$B__RDY),
        .MAXIGP0_I$R__ENA(test$MAXIGP0_I$R__ENA),
        .MAXIGP0_I$R$data(test$MAXIGP0_I$R$data),
        .MAXIGP0_I$R$id(test$MAXIGP0_I$R$id),
        .MAXIGP0_I$R$last(test$MAXIGP0_I$R$last),
        .MAXIGP0_I$R$resp(test$MAXIGP0_I$R$resp),
        .MAXIGP0_I$R__RDY(ps7_ps7_foo$MAXIGP0_I$R__RDY),
        .interrupt(test$interrupt),
        .CLK(ps7_fclk_0_c$O),
        .nRST(ps7_freset_0_r$O));
    BUFG ps7_fclk_0_c (
        .I(ps7_ps7_foo$FCLKCLK[ 0 ]),
        .O(ps7_fclk_0_c$O));
    BUFG ps7_freset_0_r (
        .I(ps7_ps7_foo$FCLKRESETN[ 0 ]),
        .O(ps7_freset_0_r$O));
    // Extra assigments, not to output wires
    assign RULEinit__ENA = 1;
    assign RULEinit__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
