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
    wire test$MAXIGP0_I$B__ENA;
    wire test$MAXIGP0_I$B__RDY;
    wire [31:0]test$MAXIGP0_I$R$data;
    wire [11:0]test$MAXIGP0_I$R$id;
    wire test$MAXIGP0_I$R$last;
    wire [1:0]test$MAXIGP0_I$R$resp;
    wire test$MAXIGP0_I$R__ENA;
    wire test$MAXIGP0_I$R__RDY;
    wire [31:0]test$MAXIGP0_O$AR$addr;
    wire [11:0]test$MAXIGP0_O$AR$id;
    wire [3:0]test$MAXIGP0_O$AR$len;
    wire test$MAXIGP0_O$AR__ENA;
    wire test$MAXIGP0_O$AR__RDY;
    wire [31:0]test$MAXIGP0_O$AW$addr;
    wire [11:0]test$MAXIGP0_O$AW$id;
    wire [3:0]test$MAXIGP0_O$AW$len;
    wire test$MAXIGP0_O$AW__ENA;
    wire test$MAXIGP0_O$AW__RDY;
    wire [31:0]test$MAXIGP0_O$W$data;
    wire [11:0]test$MAXIGP0_O$W$id;
    wire test$MAXIGP0_O$W$last;
    wire test$MAXIGP0_O$W__ENA;
    wire test$MAXIGP0_O$W__RDY;
    wire zt$CLK;
    wire [14:0]zt$DDR_Addr;
    wire [2:0]zt$DDR_BankAddr;
    wire zt$DDR_CAS_n;
    wire zt$DDR_CKE;
    wire zt$DDR_CS_n;
    wire zt$DDR_Clk_n;
    wire zt$DDR_Clk_p;
    wire [3:0]zt$DDR_DM;
    wire [31:0]zt$DDR_DQ;
    wire [3:0]zt$DDR_DQS_n;
    wire [3:0]zt$DDR_DQS_p;
    wire zt$DDR_DRSTB;
    wire zt$DDR_ODT;
    wire zt$DDR_RAS_n;
    wire zt$DDR_WEB;
    wire [3:0]zt$FCLKCLKTRIGN;
    wire zt$FIXED_IO_ddr_vrn;
    wire zt$FIXED_IO_ddr_vrp;
    wire zt$FIXED_IO_ps_clk;
    wire zt$FIXED_IO_ps_porb;
    wire zt$FIXED_IO_ps_srstb;
    wire [11:0]zt$MAXIGP0_I$B$id;
    wire [1:0]zt$MAXIGP0_I$B$resp;
    wire zt$MAXIGP0_I$B__ENA;
    wire zt$MAXIGP0_I$B__RDY;
    wire [31:0]zt$MAXIGP0_I$R$data;
    wire [11:0]zt$MAXIGP0_I$R$id;
    wire zt$MAXIGP0_I$R$last;
    wire [1:0]zt$MAXIGP0_I$R$resp;
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
    wire [53:0]zt$MIO;
    wire zt$interrupt;
    wire zt$nRST;
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
        .interrupt());
    assign test$MAXIGP0_I$B__ENA = zt$MAXIGP0_I$B__ENA;
    assign test$MAXIGP0_I$B__RDY = zt$MAXIGP0_I$B__RDY;
    assign test$MAXIGP0_I$R__ENA = zt$MAXIGP0_I$R__ENA;
    assign test$MAXIGP0_I$R__RDY = zt$MAXIGP0_I$R__RDY;
    assign test$MAXIGP0_O$AR$addr = zt$MAXIGP0_O$AR$addr;
    assign test$MAXIGP0_O$AR$id = zt$MAXIGP0_O$AR$id;
    assign test$MAXIGP0_O$AR$len = zt$MAXIGP0_O$AR$len;
    assign test$MAXIGP0_O$AR__ENA = zt$MAXIGP0_O$AR__ENA;
    assign test$MAXIGP0_O$AR__RDY = zt$MAXIGP0_O$AR__RDY;
    assign test$MAXIGP0_O$AW$addr = zt$MAXIGP0_O$AW$addr;
    assign test$MAXIGP0_O$AW$id = zt$MAXIGP0_O$AW$id;
    assign test$MAXIGP0_O$AW$len = zt$MAXIGP0_O$AW$len;
    assign test$MAXIGP0_O$AW__ENA = zt$MAXIGP0_O$AW__ENA;
    assign test$MAXIGP0_O$AW__RDY = zt$MAXIGP0_O$AW__RDY;
    assign test$MAXIGP0_O$W$data = zt$MAXIGP0_O$W$data;
    assign test$MAXIGP0_O$W$id = zt$MAXIGP0_O$W$id;
    assign test$MAXIGP0_O$W$last = zt$MAXIGP0_O$W$last;
    assign test$MAXIGP0_O$W__ENA = zt$MAXIGP0_O$W__ENA;
    assign test$MAXIGP0_O$W__RDY = zt$MAXIGP0_O$W__RDY;
    assign zt$CLK = CLK;
    assign zt$DDR_Addr = DDR_Addr;
    assign zt$DDR_BankAddr = DDR_BankAddr;
    assign zt$DDR_CAS_n = DDR_CAS_n;
    assign zt$DDR_CKE = DDR_CKE;
    assign zt$DDR_CS_n = DDR_CS_n;
    assign zt$DDR_Clk_n = DDR_Clk_n;
    assign zt$DDR_Clk_p = DDR_Clk_p;
    assign zt$DDR_DM = DDR_DM;
    assign zt$DDR_DQ = DDR_DQ;
    assign zt$DDR_DQS_n = DDR_DQS_n;
    assign zt$DDR_DQS_p = DDR_DQS_p;
    assign zt$DDR_DRSTB = DDR_DRSTB;
    assign zt$DDR_ODT = DDR_ODT;
    assign zt$DDR_RAS_n = DDR_RAS_n;
    assign zt$DDR_WEB = DDR_WEB;
    assign zt$FCLKCLKTRIGN = FCLKCLKTRIGN;
    assign zt$FIXED_IO_ddr_vrn = FIXED_IO_ddr_vrn;
    assign zt$FIXED_IO_ddr_vrp = FIXED_IO_ddr_vrp;
    assign zt$FIXED_IO_ps_clk = FIXED_IO_ps_clk;
    assign zt$FIXED_IO_ps_porb = FIXED_IO_ps_porb;
    assign zt$FIXED_IO_ps_srstb = FIXED_IO_ps_srstb;
    assign zt$MAXIGP0_I$B$id = test$MAXIGP0_I$B$id;
    assign zt$MAXIGP0_I$B$resp = test$MAXIGP0_I$B$resp;
    assign zt$MAXIGP0_I$R$data = test$MAXIGP0_I$R$data;
    assign zt$MAXIGP0_I$R$id = test$MAXIGP0_I$R$id;
    assign zt$MAXIGP0_I$R$last = test$MAXIGP0_I$R$last;
    assign zt$MAXIGP0_I$R$resp = test$MAXIGP0_I$R$resp;
    assign zt$MIO = MIO;
    assign zt$interrupt = interrupt;
    assign zt$nRST = nRST;
endmodule 

`default_nettype wire    // set back to default value
