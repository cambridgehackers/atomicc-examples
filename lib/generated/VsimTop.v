`include "vsimTop.generated.vh"

`default_nettype none
module VsimTop (
    input wire CLK,
    input wire nRST,
    input wire CLK_derivedClock,
    input wire nRST_derivedReset,
    input wire CLK_sys_clk);
    wire sink_0$beat$last;
    wire [32 - 1:0]sink_0$beat$v;
    wire sink_0$beat__ENA;
    wire source_0$beat$last;
    wire [32 - 1:0]source_0$beat$v;
    wire source_0$beat__RDY;
    wire [16 - 1:0]user$read$enq$length;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire [16 - 1:0]user$write$enq$length;
    wire [32 - 1:0]user$write$enq$v;
    wire user$write$enq__RDY;
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(sink_0$beat__ENA),
        .write$enq$v(user$write$enq$v),
        .write$enq$length(user$write$enq$length),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$length(user$read$enq$length),
        .read$enq__RDY(source_0$beat__RDY));
    VsimReceive#(32) sink_0 (.CLK(CLK), .nRST(nRST),
        .beat__ENA(sink_0$beat__ENA),
        .beat$v(sink_0$beat$v),
        .beat$last(sink_0$beat$last),
        .beat__RDY(user$write$enq__RDY));
    VsimSend#(32) source_0 (.CLK(CLK), .nRST(nRST),
        .beat__ENA(user$read$enq__ENA),
        .beat$v(source_0$beat$v),
        .beat$last(source_0$beat$last),
        .beat__RDY(source_0$beat__RDY));
    assign source_0$beat$last = user$read$enq$length == 1;
    assign source_0$beat$v = user$read$enq$v;
    assign user$write$enq$length = sink_0$beat$last ? 16'd1 : 16'd2;
    assign user$write$enq$v = sink_0$beat$v;
endmodule 

`default_nettype wire    // set back to default value
