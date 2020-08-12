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
    wire [((32 + 32) + 32) - 1:0]fifo$in$enq$v [10 - 1:0];
    wire fifo$in$enq__ENA [10 - 1:0];
    wire fifo$in$enq__RDY [10 - 1:0];
    wire [ 10 - 1:0]fifo$in$enq__RDY_or;
    wire fifo$in$enq__RDY_or1;
    wire fifo$out$deq__ENA [10 - 1:0];
    wire fifo$out$deq__RDY [10 - 1:0];
    wire [ 10 - 1:0]fifo$out$deq__RDY_or;
    wire fifo$out$deq__RDY_or1;
    wire [((32 + 32) + 32) - 1:0]fifo$out$first [10 - 1:0];
    wire fifo$out$first__RDY [10 - 1:0];
    wire [ 10 - 1:0]fifo$out$first__RDY_or;
    wire fifo$out$first__RDY_or1;
    FifoPong fifo [10 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign in$say__RDY = fifo$in$enq__RDY_or1;
    assign out$heard$meth = ( RULE$respond_rule_1__RDY ? 32'd1 : 32'd0 ) | ( RULE$respond_rule_2__RDY ? 32'd2 : 32'd0 ) | ( RULE$respond_rule_3__RDY ? 32'd3 : 32'd0 ) | ( RULE$respond_rule_4__RDY ? 32'd4 : 32'd0 ) | ( RULE$respond_rule_5__RDY ? 32'd5 : 32'd0 ) | ( RULE$respond_rule_6__RDY ? 32'd6 : 32'd0 ) | ( RULE$respond_rule_7__RDY ? 32'd7 : 32'd0 ) | ( RULE$respond_rule_8__RDY ? 32'd8 : 32'd0 ) | ( RULE$respond_rule_9__RDY ? 32'd9 : 32'd0 );
    assign out$heard$v = ( RULE$respond_rule_0__RDY ? RULE$respond_rule_0$temp$b : 32'd0 ) | ( RULE$respond_rule_1__RDY ? RULE$respond_rule_1$temp$b : 32'd0 ) | ( RULE$respond_rule_2__RDY ? RULE$respond_rule_2$temp$b : 32'd0 ) | ( RULE$respond_rule_3__RDY ? RULE$respond_rule_3$temp$b : 32'd0 ) | ( RULE$respond_rule_4__RDY ? RULE$respond_rule_4$temp$b : 32'd0 ) | ( RULE$respond_rule_5__RDY ? RULE$respond_rule_5$temp$b : 32'd0 ) | ( RULE$respond_rule_6__RDY ? RULE$respond_rule_6$temp$b : 32'd0 ) | ( RULE$respond_rule_7__RDY ? RULE$respond_rule_7$temp$b : 32'd0 ) | ( RULE$respond_rule_8__RDY ? RULE$respond_rule_8$temp$b : 32'd0 ) | ( RULE$respond_rule_9__RDY ? RULE$respond_rule_9$temp$b : 32'd0 );
    assign out$heard__ENA = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1;
    // Extra assigments, not to output wires
    assign RULE$respond_rule_0$temp$b = RULE$respond_rule_0$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_0$temp$lettemp = fifo[ 0 ]  out$first;
    assign RULE$respond_rule_0__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_1$temp$b = RULE$respond_rule_1$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_1$temp$lettemp = fifo[ 1 ]  out$first;
    assign RULE$respond_rule_1__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_2$temp$b = RULE$respond_rule_2$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_2$temp$lettemp = fifo[ 2 ]  out$first;
    assign RULE$respond_rule_2__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_3$temp$b = RULE$respond_rule_3$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_3$temp$lettemp = fifo[ 3 ]  out$first;
    assign RULE$respond_rule_3__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_4$temp$b = RULE$respond_rule_4$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_4$temp$lettemp = fifo[ 4 ]  out$first;
    assign RULE$respond_rule_4__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_5$temp$b = RULE$respond_rule_5$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_5$temp$lettemp = fifo[ 5 ]  out$first;
    assign RULE$respond_rule_5__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_6$temp$b = RULE$respond_rule_6$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_6$temp$lettemp = fifo[ 6 ]  out$first;
    assign RULE$respond_rule_6__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_7$temp$b = RULE$respond_rule_7$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_7$temp$lettemp = fifo[ 7 ]  out$first;
    assign RULE$respond_rule_7__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_8$temp$b = RULE$respond_rule_8$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_8$temp$lettemp = fifo[ 8 ]  out$first;
    assign RULE$respond_rule_8__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign RULE$respond_rule_9$temp$b = RULE$respond_rule_9$temp$lettemp[ 32 - 1 + 32 : 32 ];
    assign RULE$respond_rule_9$temp$lettemp = fifo[ 9 ]  out$first;
    assign RULE$respond_rule_9__RDY = fifo$out$first__RDY_or1 && fifo$out$deq__RDY_or1 && out$heard__RDY;
    assign fifo$in$enq__RDY_or1 = |fifo$in$enq__RDY_or;
    assign fifo$out$deq__RDY_or1 = |fifo$out$deq__RDY_or;
    assign fifo$out$first__RDY_or1 = |fifo$out$first__RDY_or;
for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign fifo$in$enq$v[__inst$Genvar1] = in$say$agg_2e_tmp;
        assign fifo$in$enq__ENA[__inst$Genvar1] = in$say__ENA && ( in$say$meth == __inst$Genvar1 );
        assign fifo$in$enq__RDY_or[__inst$Genvar1] = fifo$in$enq__RDY[ __inst$Genvar1 ];
        assign fifo$out$deq__ENA[__inst$Genvar1] = fifo$out$first__RDY_or1 && out$heard__RDY && ( ( 0 == __inst$Genvar1 ) || ( 1 == __inst$Genvar1 ) || ( 2 == __inst$Genvar1 ) || ( 3 == __inst$Genvar1 ) || ( 4 == __inst$Genvar1 ) || ( 5 == __inst$Genvar1 ) || ( 6 == __inst$Genvar1 ) || ( 7 == __inst$Genvar1 ) || ( 8 == __inst$Genvar1 ) || ( 9 == __inst$Genvar1 ) );
        assign fifo$out$deq__RDY_or[__inst$Genvar1] = fifo$out$deq__RDY[ __inst$Genvar1 ];
        assign fifo$out$first__RDY_or[__inst$Genvar1] = fifo$out$first__RDY[ __inst$Genvar1 ];
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
