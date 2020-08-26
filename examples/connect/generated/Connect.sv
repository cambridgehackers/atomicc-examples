`include "connect.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    PipeIn#(.width(32 + 32 + 32)) lEIO$pipe();
    EchoRequest lERI$request();
    PipeIn#(.width(32 + 32 + 32)) lERO_test$pipe();
    EchoIndication lEcho$indication();
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
