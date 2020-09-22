`include "userTop.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    PipeInB.server write,
    PipeInB.client read);
    PipeIn#(.width(144)) ctop$indication();
    PipeIn#(.width(144)) ctop$request();
    PipeIn#(.width(144)) radapter_0$in();
    PipeInB#(.width(32)) radapter_0$out();
    PipeInB#(.width(32)) wadapter_0$in();
    PipeIn#(.width(144)) wadapter_0$out();
    AdapterToBus#(.width(32)) radapter_0 (.CLK(CLK), .nRST(nRST),
        .in(ctop$indication),
        .out(read));
    AdapterFromBus#(.width(32)) wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in(write),
        .out(wadapter_0$out));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request(wadapter_0$out),
        .indication(ctop$indication));
endmodule

`default_nettype wire    // set back to default value
