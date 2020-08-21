`include "funneltest.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    FunnelIndication DUT__FunnelTest$indication();
    FunnelRequest P2M__request$method();
    FunnelTest DUT__FunnelTest (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__FunnelTest$indication));
    ___M2PFunnelIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__FunnelTest$indication),
        .pipe(indication));
    ___P2MFunnelRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
