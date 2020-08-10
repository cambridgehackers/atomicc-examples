`include "packing.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY);
    wire [8 - 1:0]DUT__Pack$indication$heard$readCount;
    wire [8 - 1:0]DUT__Pack$indication$heard$seqno;
    wire [32 - 1:0]DUT__Pack$indication$heard$v;
    wire [8 - 1:0]DUT__Pack$indication$heard$writeCount;
    wire DUT__Pack$indication$heard__ENA;
    wire DUT__Pack$request$say__RDY;
    wire M2P__indication$method$heard__RDY;
    wire [8 - 1:0]P2M__request$method$say$seqno;
    wire [32 - 1:0]P2M__request$method$say$v;
    wire P2M__request$method$say__ENA;
    Pack DUT__Pack (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(P2M__request$method$say__ENA),
        .request$say$v(P2M__request$method$say$v),
        .request$say$seqno(P2M__request$method$say$seqno),
        .request$say__RDY(DUT__Pack$request$say__RDY),
        .indication$heard__ENA(DUT__Pack$indication$heard__ENA),
        .indication$heard$v(DUT__Pack$indication$heard$v),
        .indication$heard$writeCount(DUT__Pack$indication$heard$writeCount),
        .indication$heard$readCount(DUT__Pack$indication$heard$readCount),
        .indication$heard$seqno(DUT__Pack$indication$heard$seqno),
        .indication$heard__RDY(M2P__indication$method$heard__RDY));
    ___M2PPackIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$heard__ENA(DUT__Pack$indication$heard__ENA),
        .method$heard$v(DUT__Pack$indication$heard$v),
        .method$heard$writeCount(DUT__Pack$indication$heard$writeCount),
        .method$heard$readCount(DUT__Pack$indication$heard$readCount),
        .method$heard$seqno(DUT__Pack$indication$heard$seqno),
        .method$heard__RDY(M2P__indication$method$heard__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq__RDY(indication$enq__RDY));
    ___P2MPackRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method$say__ENA(P2M__request$method$say__ENA),
        .method$say$v(P2M__request$method$say$v),
        .method$say$seqno(P2M__request$method$say$seqno),
        .method$say__RDY(DUT__Pack$request$say__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
endmodule

`default_nettype wire    // set back to default value
