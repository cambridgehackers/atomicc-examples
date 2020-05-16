`include "gray.generated.vh"

`default_nettype none
module Test (input wire CLK, input wire nRST,
    input wire request$increment__ENA,
    output wire request$increment__RDY,
    input wire request$decrement__ENA,
    output wire request$decrement__RDY,
    output wire [4 - 1:0]request$readGray,
    output wire request$readGray__RDY,
    input wire request$writeGray__ENA,
    input wire [4 - 1:0]request$writeGray$v,
    output wire request$writeGray__RDY,
    output wire [4 - 1:0]request$readBin,
    output wire request$readBin__RDY,
    input wire request$writeBin__ENA,
    input wire [4 - 1:0]request$writeBin$v,
    output wire request$writeBin__RDY);
    GrayCounter#(4) counter (.CLK(CLK), .nRST(nRST),
        .increment__ENA(request$increment__ENA),
        .increment__RDY(request$increment__RDY),
        .decrement__ENA(request$decrement__ENA),
        .decrement__RDY(request$decrement__RDY),
        .readGray(request$readGray),
        .readGray__RDY(request$readGray__RDY),
        .writeGray__ENA(request$writeGray__ENA),
        .writeGray$v(request$writeGray$v),
        .writeGray__RDY(request$writeGray__RDY),
        .readBin(request$readBin),
        .readBin__RDY(request$readBin__RDY),
        .writeBin__ENA(request$writeBin__ENA),
        .writeBin$v(request$writeBin$v),
        .writeBin__RDY(request$writeBin__RDY));
endmodule 

`default_nettype wire    // set back to default value
