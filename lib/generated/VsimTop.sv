`include "vsimTop.generated.vh"

`default_nettype none
module VsimTop (
    input wire CLK,
    input wire nRST,
    input wire CLK_derivedClock,
    input wire nRST_derivedReset,
    input wire CLK_sys_clk);
    wire sink_0$enq$last;
    wire [32 - 1:0]sink_0$enq$v;
    wire sink_0$enq__ENA;
    wire source_0$enq__RDY;
    wire user$read$enq$last;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$write$enq__RDY;
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(sink_0$enq__ENA),
        .write$enq$v(sink_0$enq$v),
        .write$enq$last(sink_0$enq$last),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$last(user$read$enq$last),
        .read$enq__RDY(source_0$enq__RDY));
    VsimReceive#(.width(32)) sink_0 (.CLK(CLK), .nRST(nRST),
        .enq__ENA(sink_0$enq__ENA),
        .enq$v(sink_0$enq$v),
        .enq$last(sink_0$enq$last),
        .enq__RDY(user$write$enq__RDY));
    VsimSend#(.width(32)) source_0 (.CLK(CLK), .nRST(nRST),
        .enq__ENA(user$read$enq__ENA),
        .enq$v(user$read$enq$v),
        .enq$last(user$read$enq$last),
        .enq__RDY(source_0$enq__RDY));
endmodule

`default_nettype wire    // set back to default value
