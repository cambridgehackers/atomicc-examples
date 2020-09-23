`include "funneltest.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    FunnelIndication DUT__FunnelTest$indication();
    FunnelRequest DUT__FunnelTest$request();
    FunnelIndication M2P__indication$method();
    PipeIn#(.width(16+128)) M2P__indication$pipe();
    FunnelRequest P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    ___M2PFunnelIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__FunnelTest$indication),
        .pipe(indication));
    FunnelTest DUT__FunnelTest (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__FunnelTest$indication));
    ___P2MFunnelRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
