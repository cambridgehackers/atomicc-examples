`include "packing.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    PackIndication DUT__Pack$indication();
    PackRequest DUT__Pack$request();
    PackIndication M2P__indication$method();
    PipeIn#(.width(16 + 128)) M2P__indication$pipe();
    PackRequest P2M__request$method();
    PipeIn#(.width(16 + 128)) P2M__request$pipe();
    Pack DUT__Pack (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__Pack$indication));
    ___M2PPackIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__Pack$indication),
        .pipe(indication));
    ___P2MPackRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
