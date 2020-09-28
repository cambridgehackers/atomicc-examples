`include "before1.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    EchoIndication lEII_test$indication();
    PipeIn#(.width(96)) lEII_test$pipe();
    EchoIndication lEIO$indication();
    PipeIn#(.width(96)) lEIO$pipe();
    PipeIn#(.width(192)) lERI$pipe();
    EchoRequest lERI$request();
    PipeIn#(.width(192)) lERO_test$pipe();
    EchoRequest lERO_test$request();
    EchoIndication lEcho$indication();
    EchoRequest lEcho$request();
    Swap lEcho$swap();
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication(lEcho$indication),
        .pipe(lEIO$pipe));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe(lERO_test$pipe),
        .request(lERI$request));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request(lERI$request),
        .swap(lEcho$swap),
        .indication(lEcho$indication));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request(lERO_test$request),
        .pipe(lERO_test$pipe));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe(lEIO$pipe),
        .indication(indication));
    // Extra assigments, not to output wires
    assign lERO_test$request.say$meth = request.say__ENA ? request.say$meth : 0;
    assign lERO_test$request.say$v = request.say__ENA ? request.say$v : 0;
    assign lERO_test$request.say2$meth = request.say2__ENA ? request.say2$meth : 0;
    assign lERO_test$request.say2$v = request.say2__ENA ? request.say2$v : 0;
    assign lERO_test$request.say2__ENA = request.say2__ENA;
    assign lERO_test$request.say__ENA = request.say__ENA;
    assign lEcho$swap.x2y__ENA = lEcho$swap.y2x__RDY;
    assign lEcho$swap.y2x__ENA = lEcho$swap.x2y__RDY;
    assign lEcho$swap.y2xnull__ENA = 1'd1;
    assign request.say2__RDY = lERO_test$request.say2__RDY;
    assign request.say__RDY = lERO_test$request.say__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (lEcho$swap.y2xnull__RDY) begin // RULE$swap2_rule__ENA
            $display( "swap2_rule:Connect" );
        end; // End of RULE$swap2_rule__ENA
        if (lEcho$swap.x2y__RDY && lEcho$swap.y2x__RDY) begin // RULE$swap_rule__ENA
            $display( "swap_rule:Connect" );
        end; // End of RULE$swap_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
