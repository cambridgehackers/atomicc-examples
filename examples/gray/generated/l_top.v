`include "gray.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [128 - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [128 - 1:0]indication$enq$v,
    output wire [16 - 1:0]indication$enq$length,
    input wire indication$enq__RDY);
    wire [4 - 1:0]DUT__Test$indication$value$v;
    wire DUT__Test$indication$value__ENA;
    wire M2P__indication$method$value__RDY;
    Test DUT__Test (.CLK(CLK), .nRST(nRST),
        .indication$value__ENA(DUT__Test$indication$value__ENA),
        .indication$value$v(DUT__Test$indication$value$v),
        .indication$value__RDY(M2P__indication$method$value__RDY),
        .request$decrement__ENA(P2M__request$method$decrement__ENA),
        .request$decrement__RDY(P2M__request$method$decrement__RDY),
        .request$increment__ENA(P2M__request$method$increment__ENA),
        .request$increment__RDY(P2M__request$method$increment__RDY),
        .request$readBin(P2M__request$method$readBin),
        .request$readBin__RDY(P2M__request$method$readBin__RDY),
        .request$readGray(P2M__request$method$readGray),
        .request$readGray__RDY(P2M__request$method$readGray__RDY),
        .request$writeBin__ENA(P2M__request$method$writeBin__ENA),
        .request$writeBin$v(P2M__request$method$writeBin$v),
        .request$writeBin__RDY(P2M__request$method$writeBin__RDY),
        .request$writeGray__ENA(P2M__request$method$writeGray__ENA),
        .request$writeGray$v(P2M__request$method$writeGray$v),
        .request$writeGray__RDY(P2M__request$method$writeGray__RDY));
    ___M2PReturnInd#(4) M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$value__ENA(DUT__Test$indication$value__ENA),
        .method$value$v(DUT__Test$indication$value$v),
        .method$value__RDY(M2P__indication$method$value__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq$length(indication$enq$length),
        .pipe$enq__RDY(indication$enq__RDY));
    assign request$enq__RDY = P2M__request$pipe$enq__RDY;
endmodule 

`default_nettype wire    // set back to default value
