`include "selectouttest.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    SelectOutIndication DUT__SelectOutTest$indication();
    SelectOutRequest DUT__SelectOutTest$request();
    SelectOutIndication M2P__indication$method();
    PipeIn#(.width(16+128)) M2P__indication$pipe();
    SelectOutRequest P2M__request$method();
    PipeIn#(.width(16+128)) P2M__request$pipe();
    ___M2PSelectOutIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__SelectOutTest$indication),
        .pipe(indication));
    SelectOutTest DUT__SelectOutTest (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__SelectOutTest$indication));
    ___P2MSelectOutRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
