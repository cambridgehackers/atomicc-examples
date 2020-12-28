`include "atomicc.generated.vh"
`default_nettype none
module Test (input wire CLK, input wire nRST,
    GrayCounterIfc.server request);
    GrayCounter#(.width(4)) counter (.CLK(CLK), .nRST(nRST),
        .increment__ENA(request.increment__ENA),
        .increment__RDY(request.increment__RDY),
        .decrement__ENA(request.decrement__ENA),
        .decrement__RDY(request.decrement__RDY),
        .readGray(request.readGray),
        .readGray__RDY(request.readGray__RDY),
        .writeGray__ENA(request.writeGray__ENA),
        .writeGray$v(request.writeGray$v),
        .writeGray__RDY(request.writeGray__RDY),
        .readBin(request.readBin),
        .readBin__RDY(request.readBin__RDY),
        .writeBin__ENA(request.writeBin__ENA),
        .writeBin$v(request.writeBin$v),
        .writeBin__RDY(request.writeBin__RDY));
endmodule

`default_nettype wire    // set back to default value
