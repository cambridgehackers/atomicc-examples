`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    output wire out$heard__ENA,
    output wire [31:0]out$heard$meth,
    output wire [31:0]out$heard$v,
    input wire out$heard__RDY,
    input wire in$say__ENA,
    input wire [31:0]in$say$meth,
    input wire [31:0]in$say$v,
    output wire in$say__RDY);
    reg [31:0]vsize;
    wire RULErespond_rule_0__ENA;
    wire RULErespond_rule_0__RDY;
    wire RULErespond_rule_1__ENA;
    wire RULErespond_rule_1__RDY;
    wire RULErespond_rule_2__ENA;
    wire RULErespond_rule_2__RDY;
    wire RULErespond_rule_3__ENA;
    wire RULErespond_rule_3__RDY;
    wire RULErespond_rule_4__ENA;
    wire RULErespond_rule_4__RDY;
    wire RULErespond_rule_5__ENA;
    wire RULErespond_rule_5__RDY;
    wire RULErespond_rule_6__ENA;
    wire RULErespond_rule_6__RDY;
    wire RULErespond_rule_7__ENA;
    wire RULErespond_rule_7__RDY;
    wire RULErespond_rule_8__ENA;
    wire RULErespond_rule_8__RDY;
    wire RULErespond_rule_9__ENA;
    wire RULErespond_rule_9__RDY;
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
    assign RULErespond_rule_0__ENA = fifo0$out$first__RDY & fifo0$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_1__ENA = fifo1$out$first__RDY & fifo1$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_2__ENA = fifo2$out$first__RDY & fifo2$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_3__ENA = fifo3$out$first__RDY & fifo3$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_4__ENA = fifo4$out$first__RDY & fifo4$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_5__ENA = fifo5$out$first__RDY & fifo5$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_6__ENA = fifo6$out$first__RDY & fifo6$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_7__ENA = fifo7$out$first__RDY & fifo7$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_8__ENA = fifo8$out$first__RDY & fifo8$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_9__ENA = fifo9$out$first__RDY & fifo9$out$deq__RDY & out$heard__RDY;
    assign in$say__RDY = fifo0$in$enq__RDY & fifo1$in$enq__RDY & fifo2$in$enq__RDY & fifo3$in$enq__RDY & fifo4$in$enq__RDY & fifo5$in$enq__RDY & fifo6$in$enq__RDY & fifo7$in$enq__RDY & fifo8$in$enq__RDY & fifo9$in$enq__RDY;
    assign out$heard$meth = ( fifo0$out$first__RDY & fifo0$out$deq__RDY & out$heard__RDY ) ? 0 : ( ( fifo1$out$first__RDY & fifo1$out$deq__RDY & out$heard__RDY ) ? 1 : ( ( fifo2$out$first__RDY & fifo2$out$deq__RDY & out$heard__RDY ) ? 2 : ( ( fifo3$out$first__RDY & fifo3$out$deq__RDY & out$heard__RDY ) ? 3 : ( ( fifo4$out$first__RDY & fifo4$out$deq__RDY & out$heard__RDY ) ? 4 : ( ( fifo5$out$first__RDY & fifo5$out$deq__RDY & out$heard__RDY ) ? 5 : ( ( fifo6$out$first__RDY & fifo6$out$deq__RDY & out$heard__RDY ) ? 6 : ( ( fifo7$out$first__RDY & fifo7$out$deq__RDY & out$heard__RDY ) ? 7 : ( ( fifo8$out$first__RDY & fifo8$out$deq__RDY & out$heard__RDY ) ? 8 : 9 ) ) ) ) ) ) ) );
    assign out$heard$v = ( fifo0$out$first__RDY & fifo0$out$deq__RDY & out$heard__RDY ) ? fifo0$out$first[63:32] : ( ( fifo1$out$first__RDY & fifo1$out$deq__RDY & out$heard__RDY ) ? fifo1$out$first[63:32] : ( ( fifo2$out$first__RDY & fifo2$out$deq__RDY & out$heard__RDY ) ? fifo2$out$first[63:32] : ( ( fifo3$out$first__RDY & fifo3$out$deq__RDY & out$heard__RDY ) ? fifo3$out$first[63:32] : ( ( fifo4$out$first__RDY & fifo4$out$deq__RDY & out$heard__RDY ) ? fifo4$out$first[63:32] : ( ( fifo5$out$first__RDY & fifo5$out$deq__RDY & out$heard__RDY ) ? fifo5$out$first[63:32] : ( ( fifo6$out$first__RDY & fifo6$out$deq__RDY & out$heard__RDY ) ? fifo6$out$first[63:32] : ( ( fifo7$out$first__RDY & fifo7$out$deq__RDY & out$heard__RDY ) ? fifo7$out$first[63:32] : ( ( fifo8$out$first__RDY & fifo8$out$deq__RDY & out$heard__RDY ) ? fifo8$out$first[63:32] : fifo9$out$first[63:32] ) ) ) ) ) ) ) );
    assign out$heard__ENA = ( fifo0$out$first__RDY & fifo0$out$deq__RDY ) || ( fifo1$out$first__RDY & fifo1$out$deq__RDY ) || ( fifo2$out$first__RDY & fifo2$out$deq__RDY ) || ( fifo3$out$first__RDY & fifo3$out$deq__RDY ) || ( fifo4$out$first__RDY & fifo4$out$deq__RDY ) || ( fifo5$out$first__RDY & fifo5$out$deq__RDY ) || ( fifo6$out$first__RDY & fifo6$out$deq__RDY ) || ( fifo7$out$first__RDY & fifo7$out$deq__RDY ) || ( fifo8$out$first__RDY & fifo8$out$deq__RDY ) || ( fifo9$out$first__RDY & fifo9$out$deq__RDY );
    FifoPong fifo0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd0 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo0$in$enq__RDY),
        .out$deq__ENA(fifo0$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo0$out$deq__RDY),
        .out$first(fifo0$out$first),
        .out$first__RDY(fifo0$out$first__RDY));
    FifoPong fifo1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd1 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo1$in$enq__RDY),
        .out$deq__ENA(fifo1$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo1$out$deq__RDY),
        .out$first(fifo1$out$first),
        .out$first__RDY(fifo1$out$first__RDY));
    FifoPong fifo2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd2 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo2$in$enq__RDY),
        .out$deq__ENA(fifo2$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo2$out$deq__RDY),
        .out$first(fifo2$out$first),
        .out$first__RDY(fifo2$out$first__RDY));
    FifoPong fifo3 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd3 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo3$in$enq__RDY),
        .out$deq__ENA(fifo3$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo3$out$deq__RDY),
        .out$first(fifo3$out$first),
        .out$first__RDY(fifo3$out$first__RDY));
    FifoPong fifo4 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd4 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo4$in$enq__RDY),
        .out$deq__ENA(fifo4$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo4$out$deq__RDY),
        .out$first(fifo4$out$first),
        .out$first__RDY(fifo4$out$first__RDY));
    FifoPong fifo5 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd5 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo5$in$enq__RDY),
        .out$deq__ENA(fifo5$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo5$out$deq__RDY),
        .out$first(fifo5$out$first),
        .out$first__RDY(fifo5$out$first__RDY));
    FifoPong fifo6 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd6 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo6$in$enq__RDY),
        .out$deq__ENA(fifo6$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo6$out$deq__RDY),
        .out$first(fifo6$out$first),
        .out$first__RDY(fifo6$out$first__RDY));
    FifoPong fifo7 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd7 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo7$in$enq__RDY),
        .out$deq__ENA(fifo7$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo7$out$deq__RDY),
        .out$first(fifo7$out$first),
        .out$first__RDY(fifo7$out$first__RDY));
    FifoPong fifo8 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd8 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo8$in$enq__RDY),
        .out$deq__ENA(fifo8$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo8$out$deq__RDY),
        .out$first(fifo8$out$first),
        .out$first__RDY(fifo8$out$first__RDY));
    FifoPong fifo9 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( in$say$meth == 32'd9 ) & in$say__ENA),
        .in$enq$v({ in$say__ENA$temp$c , in$say$v , in$say__ENA$temp$a }),
        .in$enq__RDY(fifo9$in$enq__RDY),
        .out$deq__ENA(fifo9$out$first__RDY & out$heard__RDY),
        .out$deq__RDY(fifo9$out$deq__RDY),
        .out$first(fifo9$out$first),
        .out$first__RDY(fifo9$out$first__RDY));
    // Extra assigments, not to output wires
    assign RULErespond_rule_0__RDY = fifo0$out$first__RDY & fifo0$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_1__RDY = fifo1$out$first__RDY & fifo1$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_2__RDY = fifo2$out$first__RDY & fifo2$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_3__RDY = fifo3$out$first__RDY & fifo3$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_4__RDY = fifo4$out$first__RDY & fifo4$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_5__RDY = fifo5$out$first__RDY & fifo5$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_6__RDY = fifo6$out$first__RDY & fifo6$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_7__RDY = fifo7$out$first__RDY & fifo7$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_8__RDY = fifo8$out$first__RDY & fifo8$out$deq__RDY & out$heard__RDY;
    assign RULErespond_rule_9__RDY = fifo9$out$first__RDY & fifo9$out$deq__RDY & out$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
