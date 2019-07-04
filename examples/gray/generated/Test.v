`include "gray.generated.vh"

`default_nettype none
module Test (input wire CLK, input wire nRST,
    output wire indication$value__ENA,
    output wire [4 - 1:0]indication$value$v,
    input wire indication$value__RDY,
    input wire request$decrement__ENA,
    output wire request$decrement__RDY,
    input wire request$increment__ENA,
    output wire request$increment__RDY,
    output wire [4 - 1:0]request$readBin,
    output wire request$readBin__RDY,
    output wire [4 - 1:0]request$readGray,
    output wire request$readGray__RDY,
    input wire request$writeBin__ENA,
    input wire [4 - 1:0]request$writeBin$v,
    output wire request$writeBin__RDY,
    input wire request$writeGray__ENA,
    input wire [4 - 1:0]request$writeGray$v,
    output wire request$writeGray__RDY);
    GrayCounter#(4) counter (.CLK(CLK), .nRST(nRST),
        .ifc$decrement__ENA(request$decrement__ENA),
        .ifc$decrement__RDY(request$decrement__RDY),
        .ifc$increment__ENA(request$increment__ENA),
        .ifc$increment__RDY(request$increment__RDY),
        .ifc$readBin(request$readBin),
        .ifc$readBin__RDY(request$readBin__RDY),
        .ifc$readGray(request$readGray),
        .ifc$readGray__RDY(request$readGray__RDY),
        .ifc$writeBin__ENA(request$writeBin__ENA),
        .ifc$writeBin$v(request$writeBin$v),
        .ifc$writeBin__RDY(request$writeBin__RDY),
        .ifc$writeGray__ENA(request$writeGray__ENA),
        .ifc$writeGray$v(request$writeGray$v),
        .ifc$writeGray__RDY(request$writeGray__RDY));
    assign indication$value$v = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$value__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
endmodule 

`default_nettype wire    // set back to default value
