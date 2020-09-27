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
    assign _in$say$temp.b = in.say$v;
    assign fifo$in__enq__RDY_or1 = |fifo$in__enq__RDY_or;
    assign fifo$out__deq__RDY_or1 = |fifo$out__deq__RDY_or;
    assign fifo$out__first__RDY_or1 = |fifo$out__first__RDY_or;
    assign in.say__RDY = fifo$in__enq__RDY_or1;
    assign out.heard__ENA = ( |fifo$out__first__RDY_or ) && ( |fifo$out__deq__RDY_or );
for(__inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign fifo$in[__inst$Genvar1].enq$v = _in$say$temp;
    assign fifo$in[__inst$Genvar1].enq__ENA = in.say__ENA && ( |fifo$in__enq__RDY_or ) && ( in.say$meth == __inst$Genvar1 );
    assign fifo$in__enq__RDY_or[__inst$Genvar1] = fifo$in[ __inst$Genvar1 ].enq__RDY;
    assign fifo$out[__inst$Genvar1].deq__ENA = ( |fifo$out__first__RDY_or ) && ( |fifo$out__deq__RDY_or ) && out.heard__RDY && ( ( 0 == __inst$Genvar1 ) || ( 1 == __inst$Genvar1 ) || ( 2 == __inst$Genvar1 ) || ( 3 == __inst$Genvar1 ) || ( 4 == __inst$Genvar1 ) || ( 5 == __inst$Genvar1 ) || ( 6 == __inst$Genvar1 ) || ( 7 == __inst$Genvar1 ) || ( 8 == __inst$Genvar1 ) || ( 9 == __inst$Genvar1 ) );
    assign fifo$out__deq__RDY_or[__inst$Genvar1] = fifo$out[ __inst$Genvar1 ].deq__RDY;
    assign fifo$out__first__RDY_or[__inst$Genvar1] = fifo$out[ __inst$Genvar1 ].first__RDY;
    end;
    always_comb begin
    out.heard$meth = 0;
    unique case(1'b1)
    RULE$respond_rule_0__RDY && RULE$respond_rule_0__RDY: out.heard$meth = 0;
    RULE$respond_rule_1__RDY && RULE$respond_rule_1__RDY: out.heard$meth = 1;
    RULE$respond_rule_2__RDY && RULE$respond_rule_2__RDY: out.heard$meth = 2;
    RULE$respond_rule_3__RDY && RULE$respond_rule_3__RDY: out.heard$meth = 3;
    RULE$respond_rule_4__RDY && RULE$respond_rule_4__RDY: out.heard$meth = 4;
    RULE$respond_rule_5__RDY && RULE$respond_rule_5__RDY: out.heard$meth = 5;
    RULE$respond_rule_6__RDY && RULE$respond_rule_6__RDY: out.heard$meth = 6;
    RULE$respond_rule_7__RDY && RULE$respond_rule_7__RDY: out.heard$meth = 7;
    RULE$respond_rule_8__RDY && RULE$respond_rule_8__RDY: out.heard$meth = 8;
    RULE$respond_rule_9__RDY && RULE$respond_rule_9__RDY: out.heard$meth = 9;
    endcase
    end
    always_comb begin
    out.heard$v = 0;
    unique case(1'b1)
    RULE$respond_rule_0__RDY && RULE$respond_rule_0__RDY: out.heard$v = _RULE$respond_rule_0$temp.b;
    RULE$respond_rule_1__RDY && RULE$respond_rule_1__RDY: out.heard$v = _RULE$respond_rule_1$temp.b;
    RULE$respond_rule_2__RDY && RULE$respond_rule_2__RDY: out.heard$v = _RULE$respond_rule_2$temp.b;
    RULE$respond_rule_3__RDY && RULE$respond_rule_3__RDY: out.heard$v = _RULE$respond_rule_3$temp.b;
    RULE$respond_rule_4__RDY && RULE$respond_rule_4__RDY: out.heard$v = _RULE$respond_rule_4$temp.b;
    RULE$respond_rule_5__RDY && RULE$respond_rule_5__RDY: out.heard$v = _RULE$respond_rule_5$temp.b;
    RULE$respond_rule_6__RDY && RULE$respond_rule_6__RDY: out.heard$v = _RULE$respond_rule_6$temp.b;
    RULE$respond_rule_7__RDY && RULE$respond_rule_7__RDY: out.heard$v = _RULE$respond_rule_7$temp.b;
    RULE$respond_rule_8__RDY && RULE$respond_rule_8__RDY: out.heard$v = _RULE$respond_rule_8$temp.b;
    RULE$respond_rule_9__RDY && RULE$respond_rule_9__RDY: out.heard$v = _RULE$respond_rule_9$temp.b;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
