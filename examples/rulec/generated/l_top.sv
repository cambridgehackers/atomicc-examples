`include "rulec.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    PipeIn.server request,
    PipeIn.client indication);
    EchoIndication DUT__Echo$indication();
    EchoRequest P2M__request$method();
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .request(P2M__request$method),
        .indication(DUT__Echo$indication));
    ___M2PEchoIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(DUT__Echo$indication),
        .pipe(indication));
    ___P2MEchoRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(P2M__request$method),
        .pipe(request));
endmodule

`default_nettype wire    // set back to default value
