`include "connect.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    EchoIndication lEII_test$indication();
    PipeIn#(.width(96)) lEII_test$pipe();
    EchoIndication lEIO$indication();
    PipeIn#(.width(96)) lERI$pipe();
    EchoRequest lERI$request();
    EchoRequest lERO_test$request();
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication(lEIO$indication),
        .pipe(lEII_test$pipe));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe(lERI$pipe),
        .request(lERI$request));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request(lERI$request),
        .indication(lEIO$indication));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request(request),
        .pipe(lERI$pipe));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe(lEII_test$pipe),
        .indication(indication));
endmodule

`default_nettype wire    // set back to default value
