`include "zynqTop.generated.vh"

`default_nettype none
module ZynqTopNew (
    input wire CLK,
    input wire nRST,
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
    input wire interrupt,
    inout wire [53:0]MIO,
    output wire [3:0]FCLKCLK,
    input wire [3:0]FCLKCLKTRIGN,
    output wire [3:0]FCLKRESETN);
    wire [11:0]test$MAXIGP0_I$B$id;
    wire [1:0]test$MAXIGP0_I$B$resp;
    wire [31:0]test$MAXIGP0_I$R$data;
    wire [11:0]test$MAXIGP0_I$R$id;
    wire test$MAXIGP0_I$R$last;
    wire [1:0]test$MAXIGP0_I$R$resp;
    wire test$interrupt;
    wire zt$MAXIGP0_I$B__ENA;
    wire zt$MAXIGP0_I$B__RDY;
    wire zt$MAXIGP0_I$R__ENA;
    wire zt$MAXIGP0_I$R__RDY;
    wire [31:0]zt$MAXIGP0_O$AR$addr;
    wire [11:0]zt$MAXIGP0_O$AR$id;
    wire [3:0]zt$MAXIGP0_O$AR$len;
    wire zt$MAXIGP0_O$AR__ENA;
    wire zt$MAXIGP0_O$AR__RDY;
    wire [31:0]zt$MAXIGP0_O$AW$addr;
    wire [11:0]zt$MAXIGP0_O$AW$id;
    wire [3:0]zt$MAXIGP0_O$AW$len;
    wire zt$MAXIGP0_O$AW__ENA;
    wire zt$MAXIGP0_O$AW__RDY;
    wire [31:0]zt$MAXIGP0_O$W$data;
    wire [11:0]zt$MAXIGP0_O$W$id;
    wire zt$MAXIGP0_O$W$last;
    wire zt$MAXIGP0_O$W__ENA;
    wire zt$MAXIGP0_O$W__RDY;
    P7Wrap zt (
        .MAXIGP0_O$AR__ENA(zt$MAXIGP0_O$AR__ENA),
        .MAXIGP0_O$AR$addr(zt$MAXIGP0_O$AR$addr),
        .MAXIGP0_O$AR$id(zt$MAXIGP0_O$AR$id),
        .MAXIGP0_O$AR$len(zt$MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__RDY(zt$MAXIGP0_O$AR__RDY),
        .MAXIGP0_O$AW__ENA(zt$MAXIGP0_O$AW__ENA),
        .MAXIGP0_O$AW$addr(zt$MAXIGP0_O$AW$addr),
        .MAXIGP0_O$AW$id(zt$MAXIGP0_O$AW$id),
        .MAXIGP0_O$AW$len(zt$MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__RDY(zt$MAXIGP0_O$AW__RDY),
        .MAXIGP0_O$W__ENA(zt$MAXIGP0_O$W__ENA),
        .MAXIGP0_O$W$data(zt$MAXIGP0_O$W$data),
        .MAXIGP0_O$W$id(zt$MAXIGP0_O$W$id),
        .MAXIGP0_O$W$last(zt$MAXIGP0_O$W$last),
        .MAXIGP0_O$W__RDY(zt$MAXIGP0_O$W__RDY),
        .MAXIGP0_I$B__ENA(zt$MAXIGP0_I$B__ENA),
        .MAXIGP0_I$B$id(test$MAXIGP0_I$B$id),
        .MAXIGP0_I$B$resp(test$MAXIGP0_I$B$resp),
        .MAXIGP0_I$B__RDY(zt$MAXIGP0_I$B__RDY),
        .MAXIGP0_I$R__ENA(zt$MAXIGP0_I$R__ENA),
        .MAXIGP0_I$R$data(test$MAXIGP0_I$R$data),
        .MAXIGP0_I$R$id(test$MAXIGP0_I$R$id),
        .MAXIGP0_I$R$last(test$MAXIGP0_I$R$last),
        .MAXIGP0_I$R$resp(test$MAXIGP0_I$R$resp),
        .MAXIGP0_I$R__RDY(zt$MAXIGP0_I$R__RDY),
        .CLK(CLK),
        .nRST(nRST),
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
        .interrupt(interrupt),
        .MIO(MIO),
        .FCLKCLK(FCLKCLK),
        .FCLKCLKTRIGN(FCLKCLKTRIGN),
        .FCLKRESETN(FCLKRESETN));
    TestTop test (
        .MAXIGP0_O$AR__ENA(zt$MAXIGP0_O$AR__ENA),
        .MAXIGP0_O$AR$addr(zt$MAXIGP0_O$AR$addr),
        .MAXIGP0_O$AR$id(zt$MAXIGP0_O$AR$id),
        .MAXIGP0_O$AR$len(zt$MAXIGP0_O$AR$len),
        .MAXIGP0_O$AR__RDY(zt$MAXIGP0_O$AR__RDY),
        .MAXIGP0_O$AW__ENA(zt$MAXIGP0_O$AW__ENA),
        .MAXIGP0_O$AW$addr(zt$MAXIGP0_O$AW$addr),
        .MAXIGP0_O$AW$id(zt$MAXIGP0_O$AW$id),
        .MAXIGP0_O$AW$len(zt$MAXIGP0_O$AW$len),
        .MAXIGP0_O$AW__RDY(zt$MAXIGP0_O$AW__RDY),
        .MAXIGP0_O$W__ENA(zt$MAXIGP0_O$W__ENA),
        .MAXIGP0_O$W$data(zt$MAXIGP0_O$W$data),
        .MAXIGP0_O$W$id(zt$MAXIGP0_O$W$id),
        .MAXIGP0_O$W$last(zt$MAXIGP0_O$W$last),
        .MAXIGP0_O$W__RDY(zt$MAXIGP0_O$W__RDY),
        .MAXIGP0_I$B__ENA(zt$MAXIGP0_I$B__ENA),
        .MAXIGP0_I$B$id(test$MAXIGP0_I$B$id),
        .MAXIGP0_I$B$resp(test$MAXIGP0_I$B$resp),
        .MAXIGP0_I$B__RDY(zt$MAXIGP0_I$B__RDY),
        .MAXIGP0_I$R__ENA(zt$MAXIGP0_I$R__ENA),
        .MAXIGP0_I$R$data(test$MAXIGP0_I$R$data),
        .MAXIGP0_I$R$id(test$MAXIGP0_I$R$id),
        .MAXIGP0_I$R$last(test$MAXIGP0_I$R$last),
        .MAXIGP0_I$R$resp(test$MAXIGP0_I$R$resp),
        .MAXIGP0_I$R__RDY(zt$MAXIGP0_I$R__RDY),
        .interrupt(test$interrupt));
endmodule 

`default_nettype wire    // set back to default value
