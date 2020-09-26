`include "ivector.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    IVectorRequest.server in,
    IVectorIndication.client out);
    reg [32 - 1:0]vsize;
    logic RULE$respond_rule_0__RDY;
    logic RULE$respond_rule_1__RDY;
    logic RULE$respond_rule_2__RDY;
    logic RULE$respond_rule_3__RDY;
    logic RULE$respond_rule_4__RDY;
    logic RULE$respond_rule_5__RDY;
    logic RULE$respond_rule_6__RDY;
    logic RULE$respond_rule_7__RDY;
    logic RULE$respond_rule_8__RDY;
    logic RULE$respond_rule_9__RDY;
    ValuePair _RULE$respond_rule_0$temp;
    ValuePair _RULE$respond_rule_1$temp;
    ValuePair _RULE$respond_rule_2$temp;
    ValuePair _RULE$respond_rule_3$temp;
    ValuePair _RULE$respond_rule_4$temp;
    ValuePair _RULE$respond_rule_5$temp;
    ValuePair _RULE$respond_rule_6$temp;
    ValuePair _RULE$respond_rule_7$temp;
    ValuePair _RULE$respond_rule_8$temp;
    ValuePair _RULE$respond_rule_9$temp;
    ValuePair _in$say$agg_2e_tmp;
    ValuePair _in$say$temp;
    PipeIn#(.width(96)) fifo$in [10 - 1:0]();
    logic [ 10 - 1:0]fifo$in__enq__RDY_or;
    logic fifo$in__enq__RDY_or1;
    PipeOut#(.width(96)) fifo$out [10 - 1:0]();
    logic [ 10 - 1:0]fifo$out__deq__RDY_or;
    logic fifo$out__deq__RDY_or1;
    logic [ 10 - 1:0]fifo$out__first__RDY_or;
    logic fifo$out__first__RDY_or1;
    FifoPong#(.width(96)) fifo [10 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    // Extra assigments, not to output wires
    assign RULE$respond_rule_0__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_1__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_2__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_3__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_4__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_5__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_6__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_7__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_8__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign RULE$respond_rule_9__RDY = fifo$out__first__RDY_or1 && fifo$out__deq__RDY_or1 && out.heard__RDY;
    assign _RULE$respond_rule_0$temp = fifo$out[ 0 ].first;
    assign _RULE$respond_rule_1$temp = fifo$out[ 1 ].first;
    assign _RULE$respond_rule_2$temp = fifo$out[ 2 ].first;
    assign _RULE$respond_rule_3$temp = fifo$out[ 3 ].first;
    assign _RULE$respond_rule_4$temp = fifo$out[ 4 ].first;
    assign _RULE$respond_rule_5$temp = fifo$out[ 5 ].first;
    assign _RULE$respond_rule_6$temp = fifo$out[ 6 ].first;
    assign _RULE$respond_rule_7$temp = fifo$out[ 7 ].first;
    assign _RULE$respond_rule_8$temp = fifo$out[ 8 ].first;
    assign _RULE$respond_rule_9$temp = fifo$out[ 9 ].first;
    assign _in$say$agg_2e_tmp = _in$say$temp;
    assign _in$say$temp.b = in.say$v;
    assign fifo$in__enq__RDY_or1 = |fifo$in__enq__RDY_or;
    assign fifo$out__deq__RDY_or1 = |fifo$out__deq__RDY_or;
    assign fifo$out__first__RDY_or1 = |fifo$out__first__RDY_or;
    assign in.say__RDY = fifo$in__enq__RDY_or1;
    assign out.heard$meth = ( RULE$respond_rule_1__RDY ? 1 : 0 ) | ( RULE$respond_rule_2__RDY ? 2 : 0 ) | ( RULE$respond_rule_3__RDY ? 3 : 0 ) | ( RULE$respond_rule_4__RDY ? 4 : 0 ) | ( RULE$respond_rule_5__RDY ? 5 : 0 ) | ( RULE$respond_rule_6__RDY ? 6 : 0 ) | ( RULE$respond_rule_7__RDY ? 7 : 0 ) | ( RULE$respond_rule_8__RDY ? 8 : 0 ) | ( RULE$respond_rule_9__RDY ? 9 : 0 );
    assign out.heard$v = ( RULE$respond_rule_0__RDY ? _RULE$respond_rule_0$temp.b : 0 ) | ( RULE$respond_rule_1__RDY ? _RULE$respond_rule_1$temp.b : 0 ) | ( RULE$respond_rule_2__RDY ? _RULE$respond_rule_2$temp.b : 0 ) | ( RULE$respond_rule_3__RDY ? _RULE$respond_rule_3$temp.b : 0 ) | ( RULE$respond_rule_4__RDY ? _RULE$respond_rule_4$temp.b : 0 ) | ( RULE$respond_rule_5__RDY ? _RULE$respond_rule_5$temp.b : 0 ) | ( RULE$respond_rule_6__RDY ? _RULE$respond_rule_6$temp.b : 0 ) | ( RULE$respond_rule_7__RDY ? _RULE$respond_rule_7$temp.b : 0 ) | ( RULE$respond_rule_8__RDY ? _RULE$respond_rule_8$temp.b : 0 ) | ( RULE$respond_rule_9__RDY ? _RULE$respond_rule_9$temp.b : 0 );
    assign out.heard__ENA = ( |fifo$out__first__RDY_or ) && ( |fifo$out__deq__RDY_or );
for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign fifo$in[__inst$Genvar1].enq$v = _in$say$agg_2e_tmp;
    assign fifo$in[__inst$Genvar1].enq__ENA = in.say__ENA && ( |fifo$in__enq__RDY_or ) && ( in.say$meth == __inst$Genvar1 );
    assign fifo$in__enq__RDY_or[__inst$Genvar1] = fifo$in[ __inst$Genvar1 ].enq__RDY;
    assign fifo$out[__inst$Genvar1].deq__ENA = ( |fifo$out__first__RDY_or ) && ( |fifo$out__deq__RDY_or ) && out.heard__RDY && ( ( 0 == __inst$Genvar1 ) || ( 1 == __inst$Genvar1 ) || ( 2 == __inst$Genvar1 ) || ( 3 == __inst$Genvar1 ) || ( 4 == __inst$Genvar1 ) || ( 5 == __inst$Genvar1 ) || ( 6 == __inst$Genvar1 ) || ( 7 == __inst$Genvar1 ) || ( 8 == __inst$Genvar1 ) || ( 9 == __inst$Genvar1 ) );
    assign fifo$out__deq__RDY_or[__inst$Genvar1] = fifo$out[ __inst$Genvar1 ].deq__RDY;
    assign fifo$out__first__RDY_or[__inst$Genvar1] = fifo$out[ __inst$Genvar1 ].first__RDY;
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
