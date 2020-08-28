`include "echo.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    EchoIndication DUT__Echo$ind();
    EchoRequest P2M__sout$method();
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .sout(P2M__sout$method),
        .ind(DUT__Echo$ind));
    ___M2PEchoIndication M2P__ind (.CLK(CLK), .nRST(nRST),
        .method(DUT__Echo$ind),
        .pipe(indication));
    ___P2MEchoRequest P2M__sout (.CLK(CLK), .nRST(nRST),
        .method(P2M__sout$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value