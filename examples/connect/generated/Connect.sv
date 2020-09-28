`include "connect.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    EchoIndication lEII_test$indication();
    PipeIn#(.width(96)) lEII_test$pipe();
    EchoIndication lEIO$indication();
    PipeIn#(.width(96)) lEIO$pipe();
    PipeIn#(.width(96)) lERI$pipe();
    EchoRequest lERI$request();
    PipeIn#(.width(96)) lERO_test$pipe();
    EchoRequest lERO_test$request();
    EchoIndication lEcho$indication();
    EchoRequest lEcho$request();
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication(lEcho$indication),
        .pipe(lEIO$pipe));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe(lERO_test$pipe),
        .request(lERI$request));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request(lERI$request),
        .indication(lEcho$indication));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request(request),
        .pipe(lERO_test$pipe));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe(lEIO$pipe),
        .indication(indication));
endmodule

`default_nettype wire    // set back to default value
