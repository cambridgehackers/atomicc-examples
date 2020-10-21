`include "vsimTop.generated.vh"

`default_nettype none
module VsimTop (
    input wire CLK,
    input wire nRST,
    input wire CLK_derivedClock,
    input wire nRST_derivedReset,
    input wire CLK_sys_clk);
    PipeInLast#(.width(32)) sink_0$port();
    PipeInLast#(.width(32)) source_0$port();
    PipeInLast#(.width(32)) user$read();
    PipeInLast#(.width(32)) user$write();
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write(sink_0$port),
        .read(user$read));
    VsimReceive#(.width(32)) sink_0 (.CLK(CLK), .nRST(nRST),
        .port(sink_0$port));
    VsimSend#(.width(32)) source_0 (.CLK(CLK), .nRST(nRST),
        .port(user$read));
endmodule

`default_nettype wire    // set back to default value
