`include "gray.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY);
    GrayCounter#(.width(4)) DUT__Test (.CLK(CLK), .nRST(nRST),
        .increment__ENA(0),
        .increment__RDY(),
        .decrement__ENA(0),
        .decrement__RDY(),
        .readGray(),
        .readGray__RDY(),
        .writeGray__ENA(0),
        .writeGray$v(0),
        .writeGray__RDY(),
        .readBin(),
        .readBin__RDY(),
        .writeBin__ENA(0),
        .writeBin$v(0),
        .writeBin__RDY());
    ___P2MGrayCounterIfc#(.width(4)) P2M__request (.CLK(CLK), .nRST(nRST),
        .method$increment__ENA(),
        .method$increment__RDY(DUT__Test$request$increment__RDY),
        .method$decrement__ENA(),
        .method$decrement__RDY(DUT__Test$request$decrement__RDY),
        .method$readGray(DUT__Test$request$readGray),
        .method$readGray__RDY(DUT__Test$request$readGray__RDY),
        .method$writeGray__ENA(),
        .method$writeGray$v(),
        .method$writeGray__RDY(DUT__Test$request$writeGray__RDY),
        .method$readBin(DUT__Test$request$readBin),
        .method$readBin__RDY(DUT__Test$request$readBin__RDY),
        .method$writeBin__ENA(),
        .method$writeBin$v(),
        .method$writeBin__RDY(DUT__Test$request$writeBin__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
    assign indication$enq$v = P2M__request$returnInd$enq$v;
    assign indication$enq__ENA = P2M__request$returnInd$enq__ENA;
endmodule 

`default_nettype wire    // set back to default value
