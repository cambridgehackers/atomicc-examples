`include "out2int.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY);
    wire [32 - 1:0]DUT__Oin$indication$heard$v;
    wire DUT__Oin$indication$heard__ENA;
    wire DUT__Oin$request$say__RDY;
    wire M2P__indication$method$heard__RDY;
    wire [32 - 1:0]P2M__request$method$say$v;
    wire P2M__request$method$say__ENA;
    Oin DUT__Oin (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(P2M__request$method$say__ENA),
        .request$say$v(P2M__request$method$say$v),
        .request$say__RDY(DUT__Oin$request$say__RDY),
        .indication$heard__ENA(DUT__Oin$indication$heard__ENA),
        .indication$heard$v(DUT__Oin$indication$heard$v),
        .indication$heard__RDY(M2P__indication$method$heard__RDY));
    ___M2POinIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$heard__ENA(DUT__Oin$indication$heard__ENA),
        .method$heard$v(DUT__Oin$indication$heard$v),
        .method$heard__RDY(M2P__indication$method$heard__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq__RDY(indication$enq__RDY));
    ___P2MOinRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method$say__ENA(P2M__request$method$say__ENA),
        .method$say$v(P2M__request$method$say$v),
        .method$say__RDY(DUT__Oin$request$say__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
endmodule 

`default_nettype wire    // set back to default value
