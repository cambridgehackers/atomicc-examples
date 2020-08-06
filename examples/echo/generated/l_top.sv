`include "echo.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY);
    wire [32 - 1:0]DUT__Echo$ind$heard$v;
    wire DUT__Echo$ind$heard__ENA;
    wire DUT__Echo$sout$say__RDY;
    wire M2P__ind$method$heard__RDY;
    wire [(16 + 128) - 1:0]M2P__ind$pipe$enq$v;
    wire M2P__ind$pipe$enq__ENA;
    wire [32 - 1:0]P2M__sout$method$say$v;
    wire P2M__sout$method$say__ENA;
    wire [(16 + 128) - 1:0]funnel$in$enq$v [1 - 1:0];
    wire funnel$in$enq__ENA [1 - 1:0];
    wire funnel$in$enq__RDY [1 - 1:0];
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .sout$say__ENA(P2M__sout$method$say__ENA),
        .sout$say$v(P2M__sout$method$say$v),
        .sout$say__RDY(DUT__Echo$sout$say__RDY),
        .ind$heard__ENA(DUT__Echo$ind$heard__ENA),
        .ind$heard$v(DUT__Echo$ind$heard$v),
        .ind$heard__RDY(M2P__ind$method$heard__RDY));
    ___M2PEchoIndication M2P__ind (.CLK(CLK), .nRST(nRST),
        .method$heard__ENA(DUT__Echo$ind$heard__ENA),
        .method$heard$v(DUT__Echo$ind$heard$v),
        .method$heard__RDY(M2P__ind$method$heard__RDY),
        .pipe$enq__ENA(M2P__ind$pipe$enq__ENA),
        .pipe$enq$v(M2P__ind$pipe$enq$v),
        .pipe$enq__RDY(funnel$in$enq__RDY[ 0 ]));
    ___P2MEchoRequest P2M__sout (.CLK(CLK), .nRST(nRST),
        .method$say__ENA(P2M__sout$method$say__ENA),
        .method$say$v(P2M__sout$method$say$v),
        .method$say__RDY(DUT__Echo$sout$say__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
    FunnelBufferedBase#(.funnelWidth(1),.dataWidth((16 + 128))) funnel (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(funnel$in$enq__ENA),
        .in$enq$v(funnel$in$enq$v),
        .in$enq__RDY(funnel$in$enq__RDY),
        .out$enq__ENA(indication$enq__ENA),
        .out$enq$v(indication$enq$v),
        .out$enq__RDY(indication$enq__RDY));
    // Extra assigments, not to output wires
    assign funnel$in$enq$v[ 0 ] = M2P__ind$pipe$enq$v;
    assign funnel$in$enq__ENA[ 0 ] = M2P__ind$pipe$enq__ENA;
endmodule

`default_nettype wire    // set back to default value
