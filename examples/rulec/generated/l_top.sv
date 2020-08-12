`include "rulec.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    EchoRequest DUT__Echo$request;
    EchoIndication M2P__indication$method;
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .request(DUT__Echo$request),
        .indication(M2P__indication$method));
    ___M2PEchoIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(M2P__indication$method),
        .pipe(indication));
    ___P2MEchoRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(DUT__Echo$request),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
