`include "iobufVec.generated.vh"

`default_nettype none
module IobufVec #(
    parameter integer iovecWidth = 0)(
    inout wire [iovecWidth- 1:0]IO,
    input wire [iovecWidth- 1:0]I,
    output wire [iovecWidth- 1:0]O,
    input wire T);
    genvar  __inst$Genvar1;
    wire CLK;
    wire nRST;
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
// start RULE$iobufs__ENA
    for (__inst$Genvar1 = 0; __inst$Genvar1 < iovecWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign iobufs[__inst$Genvar1].T = T;
        assign iobufs[__inst$Genvar1].IO = IO[ __inst$Genvar1 : 1 ];
        assign iobufs[__inst$Genvar1].I = I[ __inst$Genvar1 : 1 ];
        assign iobufs[__inst$Genvar1].O = O[ __inst$Genvar1 : 1 ];
    end;
// end RULE$iobufs__ENA
endmodule 

`default_nettype wire    // set back to default value
