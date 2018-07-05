`include "zynqTop.generated.vh"

module l_module_OC_Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$data3  , element$data2  , element$data1  , element$data0  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_MuxPipe (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input forward$enq__ENA,
    input [127:0]forward$enq$v,
    output forward$enq__RDY,
    output out$enq__ENA,
    output [127:0]out$enq$v,
    input out$enq__RDY);
    wire fifoRule__ENA;
    wire fifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    assign fifoRule__ENA = fifoRule__RDY ;
    assign fifoRule__RDY = forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
    l_module_OC_Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(fifoRule__ENA),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    assign in$enq__RDY = out$enq__RDY ;
    assign out$enq$v = fifoRule__ENA  ? { forwardFifo$out$first[127:96]  , forwardFifo$out$first[95:64]  , forwardFifo$out$first[63:32]  , forwardFifo$out$first[31:0]  } : in$enq$v ;
    assign out$enq__ENA = fifoRule__ENA  || in$enq__ENA ;
endmodule 

module l_module_OC_ZynqTop (input CLK, input nRST);
    wire init__ENA;
    wire init__RDY;
    wire mmcm$CLKFBOUTB;
    wire mmcm$CLKFBSTOPPED;
    wire mmcm$CLKINSTOPPED;
    wire mmcm$CLKOUT1;
    wire mmcm$CLKOUT1B;
    wire mmcm$CLKOUT2;
    wire mmcm$CLKOUT2B;
    wire mmcm$CLKOUT3;
    wire mmcm$CLKOUT3B;
    wire mmcm$CLKOUT4;
    wire mmcm$CLKOUT5;
    wire mmcm$CLKOUT6;
    wire [15:0]mmcm$DO;
    wire mmcm$DRDY;
    wire mmcm$LOCKED;
    wire mmcm$PSDONE;
    assign init__ENA = init__RDY ;
    assign init__RDY = 1;
    l_module_OC_MMCME2_ADV#(.REF_JITTER2(1.0e-2),.REF_JITTER1(1.0e-2),.CLKOUT6_PHASE(0.0),.CLKOUT6_DUTY_CYCLE(0.5),.CLKOUT6_DIVIDE(10),.CLKOUT5_PHASE(0.0),.CLKOUT5_DUTY_CYCLE(0.5),.CLKOUT5_DIVIDE(10),.CLKOUT4_PHASE(0.0),.CLKOUT4_DUTY_CYCLE(0.5),.CLKOUT4_DIVIDE(10),.CLKOUT3_PHASE(0.0),.CLKOUT3_DUTY_CYCLE(0.5),.CLKOUT3_DIVIDE(10),.CLKOUT2_PHASE(0.0),.CLKOUT2_DUTY_CYCLE(0.5),.CLKOUT2_DIVIDE(10),.CLKOUT1_PHASE(0.0),.CLKOUT1_DUTY_CYCLE(0.5),.CLKOUT1_DIVIDE(10),.CLKOUT0_PHASE(0.0),.CLKOUT0_DUTY_CYCLE(0.5),.CLKOUT0_DIVIDE_F(5.0),.DIVCLK_DIVIDE(1),.CLKIN2_PERIOD(0.0),.CLKIN1_PERIOD(10.0),.CLKFBOUT_PHASE(0.0),.CLKFBOUT_MULT_F(10.0),.STARTUP_WAIT("FALSE"),.COMPENSATION("ZHOLD"),.CLKOUT4_CASCADE("FALSE"),.CLKOUT6_USE_FINE_PS("FALSE"),.CLKOUT5_USE_FINE_PS("FALSE"),.CLKOUT4_USE_FINE_PS("FALSE"),.CLKOUT3_USE_FINE_PS("FALSE"),.CLKOUT2_USE_FINE_PS("FALSE"),.CLKOUT1_USE_FINE_PS("FALSE"),.CLKOUT0_USE_FINE_PS("FALSE"),.CLKFBOUT_USE_FINE_PS("FALSE"),.BANDWIDTH("OPTIMIZED")) mmcm (
        .CLKFBIN(1'd1),
        .CLKFBOUT(1'd1),
        .CLKFBOUTB(mmcm$CLKFBOUTB),
        .CLKFBSTOPPED(mmcm$CLKFBSTOPPED),
        .CLKIN1(1'd1),
        .CLKIN2(1'd0),
        .CLKINSEL(1'd1),
        .CLKINSTOPPED(mmcm$CLKINSTOPPED),
        .CLKOUT0(1'd1),
        .CLKOUT0B(1'd1),
        .CLKOUT1(mmcm$CLKOUT1),
        .CLKOUT1B(mmcm$CLKOUT1B),
        .CLKOUT2(mmcm$CLKOUT2),
        .CLKOUT2B(mmcm$CLKOUT2B),
        .CLKOUT3(mmcm$CLKOUT3),
        .CLKOUT3B(mmcm$CLKOUT3B),
        .CLKOUT4(mmcm$CLKOUT4),
        .CLKOUT5(mmcm$CLKOUT5),
        .CLKOUT6(mmcm$CLKOUT6),
        .DADDR(7'd0),
        .DCLK(1'd0),
        .DEN(1'd0),
        .DI(16'd0),
        .DO(mmcm$DO),
        .DRDY(mmcm$DRDY),
        .DWE(1'd0),
        .LOCKED(mmcm$LOCKED),
        .PSCLK(1'd0),
        .PSDONE(mmcm$PSDONE),
        .PSEN(1'd0),
        .PSINCDEC(1'd0),
        .PWRDWN(1'd0),
        .RST(1'd1));
endmodule 

