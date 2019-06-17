`include "iobufVec.generated.vh"

`default_nettype none
module IobufVec #(
    parameter integer iovecWidth = 999999)(
    inout wire [iovecWidth - 1:0]IO,
    input wire [iovecWidth - 1:0]I,
    output wire [iovecWidth - 1:0]O,
    input wire T);
    wire CLK;
    wire nRST;
    genvar __inst$Genvar1;
    for(__inst$Genvar1 = 0; __inst$Genvar1 < iovecWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin : iobufs
      wire I;
      wire IO;
      wire O;
      wire T;
      IOBUF data (
        .I(I),
        .IO(IO),
        .O(O),
        .T(T));
    end;
    for(__inst$Genvar1 = 0; __inst$Genvar1 < iovecWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign iobufs[__inst$Genvar1].I = I[ __inst$Genvar1 : 1 ];
        assign iobufs[__inst$Genvar1].IO = IO[ __inst$Genvar1 : 1 ];
        assign iobufs[__inst$Genvar1].O = O[ __inst$Genvar1 : 1 ];
        assign iobufs[__inst$Genvar1].T = T;
    end;
endmodule 

`default_nettype wire    // set back to default value
