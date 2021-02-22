`include "atomicc.generated.vh"
`include "ivector.generated.vh"
`default_nettype none
module IVector (input wire CLK, input wire nRST,
    IVectorRequest.server in,
    IVectorIndication.client out);
    reg [32 - 1:0]vsize;
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
    logic fifo$in__enq__RDY_or [10 - 1:0];
    logic fifo$in__enq__RDY_or1;
    PipeOut#(.width(96)) fifo$out [10 - 1:0]();
    FifoPong#(.width(96)) fifo [10 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    SelectIndex#(.width(1),.funnelWidth(10)) fifo$in__enq__RDY_orCC (
        .out(fifo$in__enq__RDY_or1),
        .in(fifo$in__enq__RDY_or),
        .index(in.say$meth));
    // Extra assigments, not to output wires
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
    assign in.say__RDY = fifo$in__enq__RDY_or1;
    assign out.heard__ENA = ( fifo$out[ 0 ].first__RDY && fifo$out[ 0 ].deq__RDY ) | ( fifo$out[ 1 ].first__RDY && fifo$out[ 1 ].deq__RDY ) | ( fifo$out[ 2 ].first__RDY && fifo$out[ 2 ].deq__RDY ) | ( fifo$out[ 3 ].first__RDY && fifo$out[ 3 ].deq__RDY ) | ( fifo$out[ 4 ].first__RDY && fifo$out[ 4 ].deq__RDY ) | ( fifo$out[ 5 ].first__RDY && fifo$out[ 5 ].deq__RDY ) | ( fifo$out[ 6 ].first__RDY && fifo$out[ 6 ].deq__RDY ) | ( fifo$out[ 7 ].first__RDY && fifo$out[ 7 ].deq__RDY ) | ( fifo$out[ 8 ].first__RDY && fifo$out[ 8 ].deq__RDY ) | ( fifo$out[ 9 ].first__RDY && fifo$out[ 9 ].deq__RDY );
for(genvar __inst$Genvar1 = 0; __inst$Genvar1 < 10; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign fifo$in[__inst$Genvar1].enq$v = _in$say$temp;
    assign fifo$in[__inst$Genvar1].enq__ENA = in.say__ENA && ( in.say$meth == __inst$Genvar1 );
    assign fifo$in__enq__RDY_or[__inst$Genvar1] = fifo$in[__inst$Genvar1].enq__RDY;
    assign fifo$out[__inst$Genvar1].deq__ENA = ( fifo$out[ 0 ].first__RDY && fifo$out[ 0 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 0 ) ) | ( fifo$out[ 1 ].first__RDY && fifo$out[ 1 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 1 ) ) | ( fifo$out[ 2 ].first__RDY && fifo$out[ 2 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 2 ) ) | ( fifo$out[ 3 ].first__RDY && fifo$out[ 3 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 3 ) ) | ( fifo$out[ 4 ].first__RDY && fifo$out[ 4 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 4 ) ) | ( fifo$out[ 5 ].first__RDY && fifo$out[ 5 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 5 ) ) | ( fifo$out[ 6 ].first__RDY && fifo$out[ 6 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 6 ) ) | ( fifo$out[ 7 ].first__RDY && fifo$out[ 7 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 7 ) ) | ( fifo$out[ 8 ].first__RDY && fifo$out[ 8 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 8 ) ) | ( fifo$out[ 9 ].first__RDY && fifo$out[ 9 ].deq__RDY && out.heard__RDY && ( __inst$Genvar1 == 9 ) );
    end;
    always_comb begin
    out.heard$meth = 0;
    unique case(1'b1)
    fifo$out[ 0 ].first__RDY && fifo$out[ 0 ].deq__RDY: out.heard$meth = 0;
    fifo$out[ 1 ].first__RDY && fifo$out[ 1 ].deq__RDY: out.heard$meth = 1;
    fifo$out[ 2 ].first__RDY && fifo$out[ 2 ].deq__RDY: out.heard$meth = 2;
    fifo$out[ 3 ].first__RDY && fifo$out[ 3 ].deq__RDY: out.heard$meth = 3;
    fifo$out[ 4 ].first__RDY && fifo$out[ 4 ].deq__RDY: out.heard$meth = 4;
    fifo$out[ 5 ].first__RDY && fifo$out[ 5 ].deq__RDY: out.heard$meth = 5;
    fifo$out[ 6 ].first__RDY && fifo$out[ 6 ].deq__RDY: out.heard$meth = 6;
    fifo$out[ 7 ].first__RDY && fifo$out[ 7 ].deq__RDY: out.heard$meth = 7;
    fifo$out[ 8 ].first__RDY && fifo$out[ 8 ].deq__RDY: out.heard$meth = 8;
    fifo$out[ 9 ].first__RDY && fifo$out[ 9 ].deq__RDY: out.heard$meth = 9;
    default:;
    endcase
    end
    always_comb begin
    out.heard$v = 0;
    unique case(1'b1)
    fifo$out[ 0 ].first__RDY && fifo$out[ 0 ].deq__RDY: out.heard$v = _RULE$respond_rule_0$temp.b;
    fifo$out[ 1 ].first__RDY && fifo$out[ 1 ].deq__RDY: out.heard$v = _RULE$respond_rule_1$temp.b;
    fifo$out[ 2 ].first__RDY && fifo$out[ 2 ].deq__RDY: out.heard$v = _RULE$respond_rule_2$temp.b;
    fifo$out[ 3 ].first__RDY && fifo$out[ 3 ].deq__RDY: out.heard$v = _RULE$respond_rule_3$temp.b;
    fifo$out[ 4 ].first__RDY && fifo$out[ 4 ].deq__RDY: out.heard$v = _RULE$respond_rule_4$temp.b;
    fifo$out[ 5 ].first__RDY && fifo$out[ 5 ].deq__RDY: out.heard$v = _RULE$respond_rule_5$temp.b;
    fifo$out[ 6 ].first__RDY && fifo$out[ 6 ].deq__RDY: out.heard$v = _RULE$respond_rule_6$temp.b;
    fifo$out[ 7 ].first__RDY && fifo$out[ 7 ].deq__RDY: out.heard$v = _RULE$respond_rule_7$temp.b;
    fifo$out[ 8 ].first__RDY && fifo$out[ 8 ].deq__RDY: out.heard$v = _RULE$respond_rule_8$temp.b;
    fifo$out[ 9 ].first__RDY && fifo$out[ 9 ].deq__RDY: out.heard$v = _RULE$respond_rule_9$temp.b;
    default:;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
