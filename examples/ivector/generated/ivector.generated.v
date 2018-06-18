`include "ivector.generated.vh"

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
    assign in$enq__RDY = 1;
    assign out$deq__RDY = 1;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = 1;

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

module l_module_OC_Fifo1_OC_7 (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c;
    reg full;
    assign in$enq__RDY = 0 == full ;
    assign out$deq__RDY = 0 != full ;
    assign out$first = { element$c  , element$b  , element$a  };
    assign out$first__RDY = 0 != full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$c  , element$b  , element$a  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_FifoPong (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire element2$out$first__RDY;
    l_module_OC_Fifo1_OC_7 element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( pong ^ 1 ) & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(( pong ^ 1 ) & out$deq__ENA),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    l_module_OC_Fifo1_OC_7 element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(pong & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element2$in$enq__RDY),
        .out$deq__ENA(pong & out$deq__ENA),
        .out$deq__RDY(element2$out$deq__RDY),
        .out$first(element2$out$first),
        .out$first__RDY(element2$out$first__RDY));
    assign in$enq__RDY = ( ( pong  ^ 1 ) | element2$in$enq__RDY  ) & ( pong  | element1$in$enq__RDY  );
    assign out$deq__RDY = ( ( pong  ^ 1 ) | element2$out$deq__RDY  ) & ( pong  | element1$out$deq__RDY  );
    assign out$first = { pong  ? element2$out$first[95:64]  : element1$out$first[95:64]  , pong  ? element2$out$first[63:32]  : element1$out$first[63:32]  , pong  ? element2$out$first[31:0]  : element1$out$first[31:0]  };
    assign out$first__RDY = ( ( pong  ^ 1 ) | element2$out$first__RDY  ) & ( pong  | element1$out$first__RDY  );

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA) begin
            pong  <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVector (input CLK, input nRST,
    output out$heard__ENA,
    output [31:0]out$heard$meth,
    output [31:0]out$heard$v,
    input out$heard__RDY,
    input in$say__ENA,
    input [31:0]in$say$meth,
    input [31:0]in$say$v,
    output in$say__RDY);
    reg [31:0]vsize;
    wire fifo0$in$enq__RDY;
    wire fifo0$out$deq__RDY;
    wire [95:0]fifo0$out$first;
    wire fifo0$out$first__RDY;
    wire fifo1$in$enq__RDY;
    wire fifo1$out$deq__RDY;
    wire [95:0]fifo1$out$first;
    wire fifo1$out$first__RDY;
    wire fifo2$in$enq__RDY;
    wire fifo2$out$deq__RDY;
    wire [95:0]fifo2$out$first;
    wire fifo2$out$first__RDY;
    wire fifo3$in$enq__RDY;
    wire fifo3$out$deq__RDY;
    wire [95:0]fifo3$out$first;
    wire fifo3$out$first__RDY;
    wire fifo4$in$enq__RDY;
    wire fifo4$out$deq__RDY;
    wire [95:0]fifo4$out$first;
    wire fifo4$out$first__RDY;
    wire fifo5$in$enq__RDY;
    wire fifo5$out$deq__RDY;
    wire [95:0]fifo5$out$first;
    wire fifo5$out$first__RDY;
    wire fifo6$in$enq__RDY;
    wire fifo6$out$deq__RDY;
    wire [95:0]fifo6$out$first;
    wire fifo6$out$first__RDY;
    wire fifo7$in$enq__RDY;
    wire fifo7$out$deq__RDY;
    wire [95:0]fifo7$out$first;
    wire fifo7$out$first__RDY;
    wire fifo8$in$enq__RDY;
    wire fifo8$out$deq__RDY;
    wire [95:0]fifo8$out$first;
    wire fifo8$out$first__RDY;
    wire fifo9$in$enq__RDY;
    wire fifo9$out$deq__RDY;
    wire [95:0]fifo9$out$first;
    wire fifo9$out$first__RDY;
    wire [31:0]in$say__ENA$temp$a;
    wire [31:0]in$say__ENA$temp$c;
    wire respond_rule_0__ENA;
    wire respond_rule_0__RDY;
    wire respond_rule_1__ENA;
    wire respond_rule_1__RDY;
    wire respond_rule_2__ENA;
    wire respond_rule_2__RDY;
    wire respond_rule_3__ENA;
    wire respond_rule_3__RDY;
    wire respond_rule_4__ENA;
    wire respond_rule_4__RDY;
    wire respond_rule_5__ENA;
    wire respond_rule_5__RDY;
    wire respond_rule_6__ENA;
    wire respond_rule_6__RDY;
    wire respond_rule_7__ENA;
    wire respond_rule_7__RDY;
    wire respond_rule_8__ENA;
    wire respond_rule_8__RDY;
    wire respond_rule_9__ENA;
    wire respond_rule_9__RDY;
    assign respond_rule_0__ENA = respond_rule_0__RDY ;
    assign respond_rule_0__RDY = fifo0$out$first__RDY  & fifo0$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_1__ENA = respond_rule_1__RDY ;
    assign respond_rule_1__RDY = fifo1$out$first__RDY  & fifo1$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_2__ENA = respond_rule_2__RDY ;
    assign respond_rule_2__RDY = fifo2$out$first__RDY  & fifo2$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_3__ENA = respond_rule_3__RDY ;
    assign respond_rule_3__RDY = fifo3$out$first__RDY  & fifo3$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_4__ENA = respond_rule_4__RDY ;
    assign respond_rule_4__RDY = fifo4$out$first__RDY  & fifo4$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_5__ENA = respond_rule_5__RDY ;
    assign respond_rule_5__RDY = fifo5$out$first__RDY  & fifo5$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_6__ENA = respond_rule_6__RDY ;
    assign respond_rule_6__RDY = fifo6$out$first__RDY  & fifo6$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_7__ENA = respond_rule_7__RDY ;
    assign respond_rule_7__RDY = fifo7$out$first__RDY  & fifo7$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_8__ENA = respond_rule_8__RDY ;
    assign respond_rule_8__RDY = fifo8$out$first__RDY  & fifo8$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_9__ENA = respond_rule_9__RDY ;
    assign respond_rule_9__RDY = fifo9$out$first__RDY  & fifo9$out$deq__RDY  & out$heard__RDY ;
    l_module_OC_FifoPong fifo0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd0 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo0$in$enq__RDY),
        .out$deq__ENA(respond_rule_0__ENA),
        .out$deq__RDY(fifo0$out$deq__RDY),
        .out$first(fifo0$out$first),
        .out$first__RDY(fifo0$out$first__RDY));
    l_module_OC_FifoPong fifo1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd1 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo1$in$enq__RDY),
        .out$deq__ENA(respond_rule_1__ENA),
        .out$deq__RDY(fifo1$out$deq__RDY),
        .out$first(fifo1$out$first),
        .out$first__RDY(fifo1$out$first__RDY));
    l_module_OC_FifoPong fifo2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd2 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo2$in$enq__RDY),
        .out$deq__ENA(respond_rule_2__ENA),
        .out$deq__RDY(fifo2$out$deq__RDY),
        .out$first(fifo2$out$first),
        .out$first__RDY(fifo2$out$first__RDY));
    l_module_OC_FifoPong fifo3 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd3 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo3$in$enq__RDY),
        .out$deq__ENA(respond_rule_3__ENA),
        .out$deq__RDY(fifo3$out$deq__RDY),
        .out$first(fifo3$out$first),
        .out$first__RDY(fifo3$out$first__RDY));
    l_module_OC_FifoPong fifo4 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd4 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo4$in$enq__RDY),
        .out$deq__ENA(respond_rule_4__ENA),
        .out$deq__RDY(fifo4$out$deq__RDY),
        .out$first(fifo4$out$first),
        .out$first__RDY(fifo4$out$first__RDY));
    l_module_OC_FifoPong fifo5 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd5 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo5$in$enq__RDY),
        .out$deq__ENA(respond_rule_5__ENA),
        .out$deq__RDY(fifo5$out$deq__RDY),
        .out$first(fifo5$out$first),
        .out$first__RDY(fifo5$out$first__RDY));
    l_module_OC_FifoPong fifo6 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd6 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo6$in$enq__RDY),
        .out$deq__ENA(respond_rule_6__ENA),
        .out$deq__RDY(fifo6$out$deq__RDY),
        .out$first(fifo6$out$first),
        .out$first__RDY(fifo6$out$first__RDY));
    l_module_OC_FifoPong fifo7 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd7 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo7$in$enq__RDY),
        .out$deq__ENA(respond_rule_7__ENA),
        .out$deq__RDY(fifo7$out$deq__RDY),
        .out$first(fifo7$out$first),
        .out$first__RDY(fifo7$out$first__RDY));
    l_module_OC_FifoPong fifo8 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd8 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo8$in$enq__RDY),
        .out$deq__ENA(respond_rule_8__ENA),
        .out$deq__RDY(fifo8$out$deq__RDY),
        .out$first(fifo8$out$first),
        .out$first__RDY(fifo8$out$first__RDY));
    l_module_OC_FifoPong fifo9 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd9 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo9$in$enq__RDY),
        .out$deq__ENA(respond_rule_9__ENA),
        .out$deq__RDY(fifo9$out$deq__RDY),
        .out$first(fifo9$out$first),
        .out$first__RDY(fifo9$out$first__RDY));
    assign in$say__RDY = fifo0$in$enq__RDY  & fifo1$in$enq__RDY  & fifo2$in$enq__RDY  & fifo3$in$enq__RDY  & fifo4$in$enq__RDY  & fifo5$in$enq__RDY  & fifo6$in$enq__RDY  & fifo7$in$enq__RDY  & fifo8$in$enq__RDY  & fifo9$in$enq__RDY ;
    assign out$heard$meth = respond_rule_0__ENA  ? 0 : respond_rule_1__ENA  ? 1 : respond_rule_2__ENA  ? 2 : respond_rule_3__ENA  ? 3 : respond_rule_4__ENA  ? 4 : respond_rule_5__ENA  ? 5 : respond_rule_6__ENA  ? 6 : respond_rule_7__ENA  ? 7 : respond_rule_8__ENA  ? 8 : 9;
    assign out$heard$v = respond_rule_0__ENA  ? fifo0$out$first[63:32]  : respond_rule_1__ENA  ? fifo1$out$first[63:32]  : respond_rule_2__ENA  ? fifo2$out$first[63:32]  : respond_rule_3__ENA  ? fifo3$out$first[63:32]  : respond_rule_4__ENA  ? fifo4$out$first[63:32]  : respond_rule_5__ENA  ? fifo5$out$first[63:32]  : respond_rule_6__ENA  ? fifo6$out$first[63:32]  : respond_rule_7__ENA  ? fifo7$out$first[63:32]  : respond_rule_8__ENA  ? fifo8$out$first[63:32]  : fifo9$out$first[63:32] ;
    assign out$heard__ENA = respond_rule_0__ENA  || respond_rule_1__ENA  || respond_rule_2__ENA  || respond_rule_3__ENA  || respond_rule_4__ENA  || respond_rule_5__ENA  || respond_rule_6__ENA  || respond_rule_7__ENA  || respond_rule_8__ENA  || respond_rule_9__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
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

