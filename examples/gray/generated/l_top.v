`include "gray.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY);
    wire DUT__Test$request$decrement__RDY;
    wire DUT__Test$request$increment__RDY;
    wire [4 - 1:0]DUT__Test$request$readBin;
    wire DUT__Test$request$readBin__RDY;
    wire [4 - 1:0]DUT__Test$request$readGray;
    wire DUT__Test$request$readGray__RDY;
    wire DUT__Test$request$writeBin__RDY;
    wire DUT__Test$request$writeGray__RDY;
    wire P2M__request$method$decrement__ENA;
    wire P2M__request$method$increment__ENA;
    wire [width - 1:0]P2M__request$method$writeBin$v;
    wire P2M__request$method$writeBin__ENA;
    wire [width - 1:0]P2M__request$method$writeGray$v;
    wire P2M__request$method$writeGray__ENA;
    Test DUT__Test (.CLK(CLK), .nRST(nRST),
        .request$increment__ENA(P2M__request$method$increment__ENA),
        .request$increment__RDY(DUT__Test$request$increment__RDY),
        .request$decrement__ENA(P2M__request$method$decrement__ENA),
        .request$decrement__RDY(DUT__Test$request$decrement__RDY),
        .request$readGray(DUT__Test$request$readGray),
        .request$readGray__RDY(DUT__Test$request$readGray__RDY),
        .request$writeGray__ENA(P2M__request$method$writeGray__ENA),
        .request$writeGray$v(P2M__request$method$writeGray$v),
        .request$writeGray__RDY(DUT__Test$request$writeGray__RDY),
        .request$readBin(DUT__Test$request$readBin),
        .request$readBin__RDY(DUT__Test$request$readBin__RDY),
        .request$writeBin__ENA(P2M__request$method$writeBin__ENA),
        .request$writeBin$v(P2M__request$method$writeBin$v),
        .request$writeBin__RDY(DUT__Test$request$writeBin__RDY));
    ___P2MGrayCounterIfc#(.width(4)) P2M__request (.CLK(CLK), .nRST(nRST),
        .method$increment__ENA(P2M__request$method$increment__ENA),
        .method$increment__RDY(DUT__Test$request$increment__RDY),
        .method$decrement__ENA(P2M__request$method$decrement__ENA),
        .method$decrement__RDY(DUT__Test$request$decrement__RDY),
        .method$readGray(DUT__Test$request$readGray),
        .method$readGray__RDY(DUT__Test$request$readGray__RDY),
        .method$writeGray__ENA(P2M__request$method$writeGray__ENA),
        .method$writeGray$v(P2M__request$method$writeGray$v),
        .method$writeGray__RDY(DUT__Test$request$writeGray__RDY),
        .method$readBin(DUT__Test$request$readBin),
        .method$readBin__RDY(DUT__Test$request$readBin__RDY),
        .method$writeBin__ENA(P2M__request$method$writeBin__ENA),
        .method$writeBin$v(P2M__request$method$writeBin$v),
        .method$writeBin__RDY(DUT__Test$request$writeBin__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
    assign indication$enq$v = P2M__request$returnInd$enq$v;
    assign indication$enq__ENA = P2M__request$returnInd$enq__ENA;
endmodule 

`default_nettype wire    // set back to default value
