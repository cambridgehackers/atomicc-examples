`include "atomicc.generated.vh"
`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    OinIndication DUT__Oin$indication();
    OinRequest DUT__Oin$request();
    OinIndication M2P__indication$method();
    PipeIn#(.width(16+128)) M2P__indication$pipe();
    OinRequest P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    ___M2POinIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__Oin$indication),
        .pipe(indication));
    Oin DUT__Oin (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__Oin$indication));
    ___P2MOinRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
