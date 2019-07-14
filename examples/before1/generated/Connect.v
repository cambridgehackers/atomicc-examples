`include "before1.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$meth,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    input wire request$say2__ENA,
    input wire [32 - 1:0]request$say2$meth,
    input wire [32 - 1:0]request$say2$v,
    output wire request$say2__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$meth,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    wire RULE$swap_rule__RDY;
    wire lEII_test$pipe$enq__RDY;
    wire lEIO$indication$heard__RDY;
    wire [(32 + (32 + 32)) - 1:0]lEIO$pipe$enq$v;
    wire lEIO$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [32 - 1:0]lERI$request$say$meth;
    wire [32 - 1:0]lERI$request$say$v;
    wire [32 - 1:0]lERI$request$say2$meth;
    wire [32 - 1:0]lERI$request$say2$v;
    wire lERI$request$say2__ENA;
    wire lERI$request$say__ENA;
    wire [(32 + ((32 + 32) + ((32 + 32) + 32))) - 1:0]lERO_test$pipe$enq$v;
    wire lERO_test$pipe$enq__ENA;
    wire lERO_test$request$say2__RDY;
    wire lERO_test$request$say__RDY;
    wire [32 - 1:0]lEcho$indication$heard$meth;
    wire [32 - 1:0]lEcho$indication$heard$v;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    wire lEcho$swap$x2y__RDY;
    wire lEcho$swap$y2x__RDY;
    wire lEcho$swap$y2xnull__RDY;
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY),
        .request$say2__ENA(lERI$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY),
        .request$say2__ENA(lERI$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .swap$y2x__ENA(RULE$swap_rule__RDY),
        .swap$y2x__RDY(lEcho$swap$y2x__RDY),
        .swap$y2xnull__ENA(1),
        .swap$y2xnull__RDY(lEcho$swap$y2xnull__RDY),
        .swap$x2y__ENA(RULE$swap_rule__RDY),
        .swap$x2y__RDY(lEcho$swap$x2y__RDY),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(request$say__ENA),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say__RDY(lERO_test$request$say__RDY),
        .request$say2__ENA(request$say2__ENA),
        .request$say2$meth(request$say2$meth),
        .request$say2$v(request$say2$v),
        .request$say2__RDY(lERO_test$request$say2__RDY),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY));
    assign request$say2__RDY = lERO_test$request$say2__RDY;
    assign request$say__RDY = lERO_test$request$say__RDY;
    // Extra assigments, not to output wires
    assign RULE$swap_rule__RDY = lEcho$swap$x2y__RDY & lEcho$swap$y2x__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (lEcho$swap$y2xnull__RDY) begin // RULE$swap2_rule__ENA
            $display( "swap2_rule:Connect" );
        end; // End of RULE$swap2_rule__ENA
        if (RULE$swap_rule__RDY) begin // RULE$swap_rule__ENA
            $display( "swap_rule:Connect" );
        end; // End of RULE$swap_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
