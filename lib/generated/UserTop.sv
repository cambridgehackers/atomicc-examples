`include "userTop.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    PipeInB.server write,
    PipeInB.client read);
    PipeIn#(.width(16 + 128)) ctop$request();
    PipeIn#(.width(16 + 128)) radapter_0$in();
    AdapterToBus#(.width(32)) radapter_0 (.CLK(CLK), .nRST(nRST),
        .in(radapter_0$in),
        .out(read));
    AdapterFromBus#(.width(32)) wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in(write),
        .out(ctop$request));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request(ctop$request),
        .indication(radapter_0$in));
endmodule

`default_nettype wire    // set back to default value
