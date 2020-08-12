`include "vsimTop.generated.vh"

`default_nettype none
module VsimTop (
    input wire CLK,
    input wire nRST,
    input wire CLK_derivedClock,
    input wire nRST_derivedReset,
    input wire CLK_sys_clk);
    PipeInB source_0$port;
    PipeInB user$write;
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write(user$write),
        .read(source_0$port));
    VsimReceive#(.width(32)) sink_0 (.CLK(CLK), .nRST(nRST),
        .port(user$write));
    VsimSend#(.width(32)) source_0 (.CLK(CLK), .nRST(nRST),
        .port(source_0$port));
endmodule

`default_nettype wire    // set back to default value
