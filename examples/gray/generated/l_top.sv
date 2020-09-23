`include "gray.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    GrayCounterIfc#(.width(4)) DUT__Test$request();
    GrayCounterIfc#(.width(4)) P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    PipeIn#(.width(16+128)) P2M__request$returnInd();
    ___P2MGrayCounterIfc#(.width(4)) P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request),
        .returnInd(indication));
    Test DUT__Test (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method));
endmodule

`default_nettype wire    // set back to default value
