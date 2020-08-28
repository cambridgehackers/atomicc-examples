`include "gray.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    GrayCounterIfc P2M__request$method();
    Test DUT__Test (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method));
    ___P2MGrayCounterIfc#(.width(4)) P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request),
        .returnInd(indication));
endmodule

`default_nettype wire    // set back to default value
