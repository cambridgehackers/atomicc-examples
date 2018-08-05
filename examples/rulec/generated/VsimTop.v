`include "vsimTop.generated.vh"

`default_nettype none
module VsimTop (
    input wire CLK,
    input wire nRST,
    input wire CLK_derivedClock,
    input wire nRST_derivedReset);
    wire [15:0]readUser$enq$length;
    wire [31:0]readUser$enq$v;
    wire readUser$enq__ENA;
    wire readUser$enq__RDY;
    wire sink_0$beat$beat$last;
    wire [31:0]sink_0$beat$beat$v;
    wire sink_0$beat$beat__ENA;
    wire source_0$beat$beat__RDY;
    wire [15:0]user$read$enq$length;
    wire [31:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$write$enq__RDY;
    wire writeUser$beat$last;
    wire [31:0]writeUser$beat$v;
    wire writeUser$beat__ENA;
    wire writeUser$beat__RDY;
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(sink_0$beat$beat__ENA),
        .write$enq$v(sink_0$beat$beat$v),
        .write$enq$length(sink_0$beat$beat$last ? 1 : 2),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$length(user$read$enq$length),
        .read$enq__RDY(source_0$beat$beat__RDY));
    VsimReceive sink_0 (.CLK(CLK), .nRST(nRST),
        .beat$beat__ENA(sink_0$beat$beat__ENA),
        .beat$beat$v(sink_0$beat$beat$v),
        .beat$beat$last(sink_0$beat$beat$last),
        .beat$beat__RDY(user$write$enq__RDY));
    VsimSend source_0 (.CLK(CLK), .nRST(nRST),
        .beat$beat__ENA(user$read$enq__ENA),
        .beat$beat$v(user$read$enq$v),
        .beat$beat$last(user$read$enq__ENA & ( user$read$enq$length == 16'd1 )),
        .beat$beat__RDY(source_0$beat$beat__RDY));
    assign readUser$enq$length = user$read$enq$length;
    assign readUser$enq$v = user$read$enq$v;
    assign readUser$enq__ENA = user$read$enq__ENA;
    assign writeUser$beat$last = sink_0$beat$beat$last;
    assign writeUser$beat$v = sink_0$beat$beat$v;
    assign writeUser$beat__ENA = sink_0$beat$beat__ENA;
    // Extra assigments, not to output wires
    assign readUser$enq__RDY = source_0$beat$beat__RDY;
    assign writeUser$beat__RDY = user$write$enq__RDY;
endmodule 

`default_nettype wire    // set back to default value
