`include "before1.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [31:0]request$say$meth,
    input wire [31:0]request$say$v,
    input wire request$say2__ENA,
    input wire [31:0]request$say2$meth,
    input wire [31:0]request$say2$v,
    output wire request$say2__RDY,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$meth,
    output wire [31:0]indication$heard$v,
    input wire indication$heard__RDY);
    wire RULEswap2_rule__ENA;
    wire RULEswap2_rule__RDY;
    wire RULEswap_rule__ENA;
    wire RULEswap_rule__RDY;
    wire lEII_test$pipe$enq__ENA;
    wire lEII_test$pipe$enq__RDY;
    wire lEIO$indication$heard__ENA;
    wire lEIO$indication$heard__RDY;
    wire [95:0]lEIO$pipe$enq$v;
    wire lERI$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [31:0]lERI$request$say$meth;
    wire [31:0]lERI$request$say$v;
    wire [31:0]lERI$request$say2$meth;
    wire [31:0]lERI$request$say2$v;
    wire [191:0]lERO_test$pipe$enq$v;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire lEcho$request$say2__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__ENA;
    wire lEcho$request$say__RDY;
    wire lEcho$swap$x2y__RDY;
    wire lEcho$swap$y2x__RDY;
    wire lEcho$swap$y2xnull__RDY;
    assign RULEswap2_rule__ENA = lEcho$swap$y2xnull__RDY;
    assign RULEswap_rule__ENA = lEcho$swap$x2y__RDY & lEcho$swap$y2x__RDY;
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication$heard__ENA(lEIO$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY),
        .pipe$enq__ENA(lEII_test$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lERI$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY),
        .request$say__ENA(lEcho$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say2__ENA(lEcho$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__RDY(lEcho$request$say__RDY));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lEcho$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say2__ENA(lEcho$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__RDY(lEcho$request$say__RDY),
        .swap$x2y__ENA(lEcho$swap$y2x__RDY),
        .swap$x2y__RDY(lEcho$swap$x2y__RDY),
        .swap$y2x__ENA(lEcho$swap$x2y__RDY),
        .swap$y2x__RDY(lEcho$swap$y2x__RDY),
        .swap$y2xnull__ENA(1),
        .swap$y2xnull__RDY(lEcho$swap$y2xnull__RDY),
        .indication$heard__ENA(lEIO$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(request$say__ENA),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say2__ENA(request$say2__ENA),
        .request$say2$meth(request$say2$meth),
        .request$say2$v(request$say2$v),
        .request$say2__RDY(request$say2__RDY),
        .request$say__RDY(request$say__RDY),
        .pipe$enq__ENA(lERI$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lEII_test$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY));
    // Extra assigments, not to output wires
    assign RULEswap2_rule__RDY = lEcho$swap$y2xnull__RDY;
    assign RULEswap_rule__RDY = lEcho$swap$x2y__RDY & lEcho$swap$y2x__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (RULEswap2_rule__ENA & RULEswap2_rule__RDY) begin
            $display( "swap2_rule:Connect" );
        end; // End of RULEswap2_rule__ENA
        if (RULEswap_rule__ENA & RULEswap_rule__RDY) begin
            $display( "swap_rule:Connect" );
        end; // End of RULEswap_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
