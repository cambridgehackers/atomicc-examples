`include "iobufVec.generated.vh"

`default_nettype none
module IobufVec #(
    parameter integer iovecWidth = 999999)(
    inout wire [iovecWidth - 1:0]IO,
    input wire [iovecWidth - 1:0]I,
    output wire [iovecWidth - 1:0]O,
    input wire T);
    wire CLK;
    wire iobufs$I [iovecWidth - 1:0];
    wire iobufs$IO [iovecWidth - 1:0];
    wire iobufs$O [iovecWidth - 1:0];
    wire iobufs$T [iovecWidth - 1:0];
    wire nRST;
    genvar __inst$Genvar1;
    IOBUF iobufs [iovecWidth - 1:0] (
        .I(iobufs$I),
        .IO(iobufs$IO),
        .O(iobufs$O),
        .T(iobufs$T));
    assign IO = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign O = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
for(__inst$Genvar1 = 0; __inst$Genvar1 < iovecWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign iobufs$IO[ __inst$Genvar1 ] = IO[ __inst$Genvar1 : 1 ];
    assign iobufs$I[ __inst$Genvar1 ] = I[ __inst$Genvar1 : 1 ];
    assign iobufs$O[ __inst$Genvar1 ] = O[ __inst$Genvar1 : 1 ];
    assign iobufs$T[ __inst$Genvar1 ] = T;
    end;
endmodule

`default_nettype wire    // set back to default value
