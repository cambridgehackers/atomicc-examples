`include "atomicc.generated.vh"
`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    BtestIndication DUT__Btest$indication();
    BtestRequest DUT__Btest$request();
    BtestIndication M2P__indication$method();
    PipeIn#(.width(16+128)) M2P__indication$pipe();
    BtestRequest P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    ___M2PBtestIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__Btest$indication),
        .pipe(indication));
    Btest DUT__Btest (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__Btest$indication));
    ___P2MBtestRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
