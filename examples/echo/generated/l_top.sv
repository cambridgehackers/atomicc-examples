`include "atomicc.generated.vh"
`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    EchoIndication DUT__Echo$ind();
    EchoRequest DUT__Echo$sout();
    EchoIndication M2P__ind$method();
    PipeIn#(.width(16+128)) M2P__ind$pipe();
    EchoRequest P2M__sout$method();
    PipeIn#(.width(16+128)) P2M__sout$pipe();
    ___M2PEchoIndication M2P__ind (.CLK(CLK), .nRST(nRST),
        .method(DUT__Echo$ind),
        .pipe(indication));
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .sout(P2M__sout$method),
        .ind(DUT__Echo$ind));
    ___P2MEchoRequest P2M__sout (.CLK(CLK), .nRST(nRST),
        .method(P2M__sout$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
