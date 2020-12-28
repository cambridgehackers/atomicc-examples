`include "atomicc.generated.vh"
`include "lpm.generated.vh"
`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    LpmIndication DUT__LpmTest$indication();
    LpmRequest DUT__LpmTest$request();
    LpmIndication M2P__indication$method();
    PipeIn#(.width(16+128)) M2P__indication$pipe();
    LpmRequest P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    ___M2PLpmIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__LpmTest$indication),
        .pipe(indication));
    LpmTest DUT__LpmTest (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__LpmTest$indication));
    ___P2MLpmRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
