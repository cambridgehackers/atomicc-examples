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
    wire DUT__Test$request$decrement__RDY;
    wire DUT__Test$request$increment__RDY;
    wire [4 - 1:0]DUT__Test$request$readBin;
    wire DUT__Test$request$readBin__RDY;
    wire [4 - 1:0]DUT__Test$request$readGray;
    wire DUT__Test$request$readGray__RDY;
    wire DUT__Test$request$writeBin__RDY;
    wire DUT__Test$request$writeGray__RDY;
    wire M2P__indication$method$value__RDY;
    wire P2M__request$method$decrement__ENA;
    wire P2M__request$method$increment__ENA;
    wire [4 - 1:0]P2M__request$method$writeBin$v;
    wire P2M__request$method$writeBin__ENA;
    wire [4 - 1:0]P2M__request$method$writeGray$v;
    wire P2M__request$method$writeGray__ENA;
    Test DUT__Test (.CLK(CLK), .nRST(nRST),
        .indication$value__ENA(DUT__Test$indication$value__ENA),
        .indication$value$v(DUT__Test$indication$value$v),
        .indication$value__RDY(M2P__indication$method$value__RDY),
        .request$decrement__ENA(P2M__request$method$decrement__ENA),
        .request$decrement__RDY(DUT__Test$request$decrement__RDY),
        .request$increment__ENA(P2M__request$method$increment__ENA),
        .request$increment__RDY(DUT__Test$request$increment__RDY),
        .request$readBin(DUT__Test$request$readBin),
        .request$readBin__RDY(DUT__Test$request$readBin__RDY),
        .request$readGray(DUT__Test$request$readGray),
        .request$readGray__RDY(DUT__Test$request$readGray__RDY),
        .request$writeBin__ENA(P2M__request$method$writeBin__ENA),
        .request$writeBin$v(P2M__request$method$writeBin$v),
        .request$writeBin__RDY(DUT__Test$request$writeBin__RDY),
        .request$writeGray__ENA(P2M__request$method$writeGray__ENA),
        .request$writeGray$v(P2M__request$method$writeGray$v),
        .request$writeGray__RDY(DUT__Test$request$writeGray__RDY));
    ___P2MGrayCounterIfc#(4) P2M__request (.CLK(CLK), .nRST(nRST),
        .method$decrement__ENA(P2M__request$method$decrement__ENA),
        .method$decrement__RDY(DUT__Test$request$decrement__RDY),
        .method$increment__ENA(P2M__request$method$increment__ENA),
        .method$increment__RDY(DUT__Test$request$increment__RDY),
        .method$readBin(DUT__Test$request$readBin),
        .method$readBin__RDY(DUT__Test$request$readBin__RDY),
        .method$readGray(DUT__Test$request$readGray),
        .method$readGray__RDY(DUT__Test$request$readGray__RDY),
        .method$writeBin__ENA(P2M__request$method$writeBin__ENA),
        .method$writeBin$v(P2M__request$method$writeBin$v),
        .method$writeBin__RDY(DUT__Test$request$writeBin__RDY),
        .method$writeGray__ENA(P2M__request$method$writeGray__ENA),
        .method$writeGray$v(P2M__request$method$writeGray$v),
        .method$writeGray__RDY(DUT__Test$request$writeGray__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY),
        .returnInd$enq__ENA(),
        .returnInd$enq$v(),
        .returnInd$enq__RDY(0));
    ___M2PReturnInd#(4) M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$value__ENA(DUT__Test$indication$value__ENA),
        .method$value$v(DUT__Test$indication$value$v),
        .method$value__RDY(M2P__indication$method$value__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq$length(indication$enq$length),
        .pipe$enq__RDY(indication$enq__RDY));
endmodule 

`default_nettype wire    // set back to default value
