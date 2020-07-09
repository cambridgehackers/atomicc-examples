`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    input wire in$say__ENA,
    input wire [32 - 1:0]in$say$meth,
    input wire [32 - 1:0]in$say$v,
    output wire in$say__RDY,
    output wire out$heard__ENA,
    output wire [32 - 1:0]out$heard$meth,
    output wire [32 - 1:0]out$heard$v,
    input wire out$heard__RDY);
    reg [32 - 1:0]vsize;
    wire [32 - 1:0]RULE$respond_rule_0$temp$b;
    wire RULE$respond_rule_0__RDY;
    wire [32 - 1:0]RULE$respond_rule_1$temp$b;
    wire RULE$respond_rule_1__RDY;
    wire [32 - 1:0]RULE$respond_rule_2$temp$b;
    wire RULE$respond_rule_2__RDY;
    wire [32 - 1:0]RULE$respond_rule_3$temp$b;
    wire RULE$respond_rule_3__RDY;
    wire [32 - 1:0]RULE$respond_rule_4$temp$b;
    wire RULE$respond_rule_4__RDY;
    wire [32 - 1:0]RULE$respond_rule_5$temp$b;
    wire RULE$respond_rule_5__RDY;
    wire [32 - 1:0]RULE$respond_rule_6$temp$b;
    wire RULE$respond_rule_6__RDY;
    wire [32 - 1:0]RULE$respond_rule_7$temp$b;
    wire RULE$respond_rule_7__RDY;
    wire [32 - 1:0]RULE$respond_rule_8$temp$b;
    wire RULE$respond_rule_8__RDY;
    wire [32 - 1:0]RULE$respond_rule_9$temp$b;
    wire RULE$respond_rule_9__RDY;
    wire [((32 + 32) + 32) - 1:0]in$enq$v;
    wire [32 - 1:0]in$enq$v$a [10 - 1:0];
    wire [32 - 1:0]in$enq$v$b [10 - 1:0];
    wire [32 - 1:0]in$enq$v$c [10 - 1:0];
    wire in$enq__RDY;
    wire out$deq__RDY;
    wire out$first__RDY;
    genvar __inst$Genvar1;
    for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin : fifo
      wire in$enq__ENA;
      wire [((32 + 32) + 32) - 1:0]in$enq$v;
      wire in$enq__RDY;
      wire out$deq__ENA;
      wire out$deq__RDY;
      wire [((32 + 32) + 32) - 1:0]out$first;
      wire out$first__RDY;
      FifoPong data (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(in$enq__RDY),
        .out$deq__ENA(out$deq__ENA),
        .out$deq__RDY(out$deq__RDY),
        .out$first(out$first),
        .out$first__RDY(out$first__RDY));
    end;
    assign fifo[0].in$enq$v = { fifo[0].in$enq$v$c , fifo[0].in$enq$v$b , fifo[0].in$enq$v$a };
    assign fifo[0].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[0].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[1].in$enq$v = { fifo[1].in$enq$v$c , fifo[1].in$enq$v$b , fifo[1].in$enq$v$a };
    assign fifo[1].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[1].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[2].in$enq$v = { fifo[2].in$enq$v$c , fifo[2].in$enq$v$b , fifo[2].in$enq$v$a };
    assign fifo[2].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[2].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[3].in$enq$v = { fifo[3].in$enq$v$c , fifo[3].in$enq$v$b , fifo[3].in$enq$v$a };
    assign fifo[3].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[3].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[4].in$enq$v = { fifo[4].in$enq$v$c , fifo[4].in$enq$v$b , fifo[4].in$enq$v$a };
    assign fifo[4].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[4].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[5].in$enq$v = { fifo[5].in$enq$v$c , fifo[5].in$enq$v$b , fifo[5].in$enq$v$a };
    assign fifo[5].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[5].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[6].in$enq$v = { fifo[6].in$enq$v$c , fifo[6].in$enq$v$b , fifo[6].in$enq$v$a };
    assign fifo[6].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[6].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[7].in$enq$v = { fifo[7].in$enq$v$c , fifo[7].in$enq$v$b , fifo[7].in$enq$v$a };
    assign fifo[7].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[7].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[8].in$enq$v = { fifo[8].in$enq$v$c , fifo[8].in$enq$v$b , fifo[8].in$enq$v$a };
    assign fifo[8].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[8].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[9].in$enq$v = { fifo[9].in$enq$v$c , fifo[9].in$enq$v$b , fifo[9].in$enq$v$a };
    assign fifo[9].in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign fifo[9].out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign in$enq$v = { in$enq$v$c , in$enq$v$b , in$enq$v$a };
    assign in$say__RDY = fifo[ __inst$Genvar1 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo in$enq__RDY;
    assign out$heard$meth = ( RULE$respond_rule_1__RDY ? 32'd1 : 32'd0 ) | ( RULE$respond_rule_2__RDY ? 32'd2 : 32'd0 ) | ( RULE$respond_rule_3__RDY ? 32'd3 : 32'd0 ) | ( RULE$respond_rule_4__RDY ? 32'd4 : 32'd0 ) | ( RULE$respond_rule_5__RDY ? 32'd5 : 32'd0 ) | ( RULE$respond_rule_6__RDY ? 32'd6 : 32'd0 ) | ( RULE$respond_rule_7__RDY ? 32'd7 : 32'd0 ) | ( RULE$respond_rule_8__RDY ? 32'd8 : 32'd0 ) | ( RULE$respond_rule_9__RDY ? 32'd9 : 32'd0 );
    assign out$heard$v = ( RULE$respond_rule_0__RDY ? RULE$respond_rule_0$temp$b : 32'd0 ) | ( RULE$respond_rule_1__RDY ? RULE$respond_rule_1$temp$b : 32'd0 ) | ( RULE$respond_rule_2__RDY ? RULE$respond_rule_2$temp$b : 32'd0 ) | ( RULE$respond_rule_3__RDY ? RULE$respond_rule_3$temp$b : 32'd0 ) | ( RULE$respond_rule_4__RDY ? RULE$respond_rule_4$temp$b : 32'd0 ) | ( RULE$respond_rule_5__RDY ? RULE$respond_rule_5$temp$b : 32'd0 ) | ( RULE$respond_rule_6__RDY ? RULE$respond_rule_6$temp$b : 32'd0 ) | ( RULE$respond_rule_7__RDY ? RULE$respond_rule_7$temp$b : 32'd0 ) | ( RULE$respond_rule_8__RDY ? RULE$respond_rule_8$temp$b : 32'd0 ) | ( RULE$respond_rule_9__RDY ? RULE$respond_rule_9$temp$b : 32'd0 );
    assign out$heard__ENA = RULE$respond_rule_0__RDY || RULE$respond_rule_1__RDY || RULE$respond_rule_2__RDY || RULE$respond_rule_3__RDY || RULE$respond_rule_4__RDY || RULE$respond_rule_5__RDY || RULE$respond_rule_6__RDY || RULE$respond_rule_7__RDY || RULE$respond_rule_8__RDY || RULE$respond_rule_9__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond_rule_0$temp$b = fifo[0]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_0__RDY = fifo[ 0 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 0 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_1$temp$b = fifo[1]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_1__RDY = fifo[ 1 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 1 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_2$temp$b = fifo[2]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_2__RDY = fifo[ 2 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 2 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_3$temp$b = fifo[3]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_3__RDY = fifo[ 3 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 3 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_4$temp$b = fifo[4]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_4__RDY = fifo[ 4 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 4 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_5$temp$b = fifo[5]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_5__RDY = fifo[ 5 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 5 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_6$temp$b = fifo[6]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_6__RDY = fifo[ 6 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 6 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_7$temp$b = fifo[7]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_7__RDY = fifo[ 7 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 7 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_8$temp$b = fifo[8]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_8__RDY = fifo[ 8 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 8 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign RULE$respond_rule_9$temp$b = fifo[9]out$first[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_9__RDY = fifo[ 9 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$first__RDY && fifo[ 9 ] fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo fifo out$deq__RDY && out$heard__RDY;
    assign fifo[0].out$first$a = fifo[0].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[0].out$first$b = fifo[0].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[0].out$first$c = fifo[0].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[0]out$deq__ENA = RULE$respond_rule_0__RDY;
    assign fifo[1].out$first$a = fifo[1].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[1].out$first$b = fifo[1].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[1].out$first$c = fifo[1].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[1]out$deq__ENA = RULE$respond_rule_1__RDY;
    assign fifo[2].out$first$a = fifo[2].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[2].out$first$b = fifo[2].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[2].out$first$c = fifo[2].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[2]out$deq__ENA = RULE$respond_rule_2__RDY;
    assign fifo[3].out$first$a = fifo[3].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[3].out$first$b = fifo[3].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[3].out$first$c = fifo[3].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[3]out$deq__ENA = RULE$respond_rule_3__RDY;
    assign fifo[4].out$first$a = fifo[4].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[4].out$first$b = fifo[4].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[4].out$first$c = fifo[4].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[4]out$deq__ENA = RULE$respond_rule_4__RDY;
    assign fifo[5].out$first$a = fifo[5].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[5].out$first$b = fifo[5].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[5].out$first$c = fifo[5].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[5]out$deq__ENA = RULE$respond_rule_5__RDY;
    assign fifo[6].out$first$a = fifo[6].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[6].out$first$b = fifo[6].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[6].out$first$c = fifo[6].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[6]out$deq__ENA = RULE$respond_rule_6__RDY;
    assign fifo[7].out$first$a = fifo[7].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[7].out$first$b = fifo[7].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[7].out$first$c = fifo[7].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[7]out$deq__ENA = RULE$respond_rule_7__RDY;
    assign fifo[8].out$first$a = fifo[8].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[8].out$first$b = fifo[8].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[8].out$first$c = fifo[8].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[8]out$deq__ENA = RULE$respond_rule_8__RDY;
    assign fifo[9].out$first$a = fifo[9].out$first[ ( (-1 + 32) ) : 0 ];
    assign fifo[9].out$first$b = fifo[9].out$first[ ( (31 + 32) ) : 32 ];
    assign fifo[9].out$first$c = fifo[9].out$first[ ( (63 + 32) ) : 64 ];
    assign fifo[9]out$deq__ENA = RULE$respond_rule_9__RDY;
for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign fifo[__inst$Genvar1]in$enq$v = in$say$agg_2e_tmp;
        assign fifo[__inst$Genvar1]in$enq__ENA = in$say__ENA && in$say__RDY && ( __inst$Genvar1 == in$say$meth );
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
