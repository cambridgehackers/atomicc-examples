`include "ivector.generated.vh"

module IVector (input CLK, input nRST,
    output out$heard__ENA,
    output [31:0]out$heard$meth,
    output [31:0]out$heard$v,
    input out$heard__RDY,
    input in$say__ENA,
    input [31:0]in$say$meth,
    input [31:0]in$say$v,
    output in$say__RDY);
    wire CLK, nRST;
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
    wire respond_rule_1__ENA;
    wire respond_rule_2__ENA;
    wire respond_rule_3__ENA;
    wire respond_rule_4__ENA;
    wire respond_rule_5__ENA;
    wire respond_rule_6__ENA;
    wire respond_rule_7__ENA;
    wire respond_rule_8__ENA;
    wire respond_rule_9__ENA;
    assign respond_rule_0__ENA = fifo0$out$first__RDY  & fifo0$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_1__ENA = fifo1$out$first__RDY  & fifo1$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_2__ENA = fifo2$out$first__RDY  & fifo2$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_3__ENA = fifo3$out$first__RDY  & fifo3$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_4__ENA = fifo4$out$first__RDY  & fifo4$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_5__ENA = fifo5$out$first__RDY  & fifo5$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_6__ENA = fifo6$out$first__RDY  & fifo6$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_7__ENA = fifo7$out$first__RDY  & fifo7$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_8__ENA = fifo8$out$first__RDY  & fifo8$out$deq__RDY  & out$heard__RDY ;
    assign respond_rule_9__ENA = fifo9$out$first__RDY  & fifo9$out$deq__RDY  & out$heard__RDY ;
    FifoPong fifo0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd0 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo0$in$enq__RDY),
        .out$deq__ENA(respond_rule_0__ENA),
        .out$deq__RDY(fifo0$out$deq__RDY),
        .out$first(fifo0$out$first),
        .out$first__RDY(fifo0$out$first__RDY));
    FifoPong fifo1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd1 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo1$in$enq__RDY),
        .out$deq__ENA(respond_rule_1__ENA),
        .out$deq__RDY(fifo1$out$deq__RDY),
        .out$first(fifo1$out$first),
        .out$first__RDY(fifo1$out$first__RDY));
    FifoPong fifo2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd2 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo2$in$enq__RDY),
        .out$deq__ENA(respond_rule_2__ENA),
        .out$deq__RDY(fifo2$out$deq__RDY),
        .out$first(fifo2$out$first),
        .out$first__RDY(fifo2$out$first__RDY));
    FifoPong fifo3 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd3 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo3$in$enq__RDY),
        .out$deq__ENA(respond_rule_3__ENA),
        .out$deq__RDY(fifo3$out$deq__RDY),
        .out$first(fifo3$out$first),
        .out$first__RDY(fifo3$out$first__RDY));
    FifoPong fifo4 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd4 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo4$in$enq__RDY),
        .out$deq__ENA(respond_rule_4__ENA),
        .out$deq__RDY(fifo4$out$deq__RDY),
        .out$first(fifo4$out$first),
        .out$first__RDY(fifo4$out$first__RDY));
    FifoPong fifo5 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd5 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo5$in$enq__RDY),
        .out$deq__ENA(respond_rule_5__ENA),
        .out$deq__RDY(fifo5$out$deq__RDY),
        .out$first(fifo5$out$first),
        .out$first__RDY(fifo5$out$first__RDY));
    FifoPong fifo6 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd6 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo6$in$enq__RDY),
        .out$deq__ENA(respond_rule_6__ENA),
        .out$deq__RDY(fifo6$out$deq__RDY),
        .out$first(fifo6$out$first),
        .out$first__RDY(fifo6$out$first__RDY));
    FifoPong fifo7 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd7 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo7$in$enq__RDY),
        .out$deq__ENA(respond_rule_7__ENA),
        .out$deq__RDY(fifo7$out$deq__RDY),
        .out$first(fifo7$out$first),
        .out$first__RDY(fifo7$out$first__RDY));
    FifoPong fifo8 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd8 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo8$in$enq__RDY),
        .out$deq__ENA(respond_rule_8__ENA),
        .out$deq__RDY(fifo8$out$deq__RDY),
        .out$first(fifo8$out$first),
        .out$first__RDY(fifo8$out$first__RDY));
    FifoPong fifo9 (.CLK(CLK), .nRST(nRST),
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

