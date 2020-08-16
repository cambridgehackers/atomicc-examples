`include "funneltest.generated.vh"

`default_nettype none

module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    FunnelRequest DUT__FunnelTest$request();
    FunnelIndication M2P__indication$method();
    FunnelTest DUT__FunnelTest (.CLK(CLK), .nRST(nRST),
        .request(DUT__FunnelTest$request),
        .indication(M2P__indication$method));
    ___M2PFunnelIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(M2P__indication$method),
        .pipe(indication));
    ___P2MFunnelRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(DUT__FunnelTest$request),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
