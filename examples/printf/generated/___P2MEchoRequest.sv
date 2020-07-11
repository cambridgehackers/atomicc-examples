`include "printf.generated.vh"

`default_nettype none
module ___P2MEchoRequest (input wire CLK, input wire nRST,
    output wire method$say__ENA,
    output wire [32 - 1:0]method$say$v,
    input wire method$say__RDY,
    output wire method$say2__ENA,
    output wire [16 - 1:0]method$say2$a,
    output wire [16 - 1:0]method$say2$b,
    input wire method$say2__RDY,
    output wire method$setLeds__ENA,
    output wire [8 - 1:0]method$setLeds$v,
    input wire method$setLeds__RDY,
    input wire pipe$enq__ENA,
    input wire [(16 + 128) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY);
    wire [(16 + 128) - 1:0]printfp$enq$v;
    wire printfp$enq__ENA;
    wire printfp$enq__RDY;
    Printf printfp (.CLK(CLK), .nRST(nRST),
        .enq__ENA(printfp$enq__ENA),
        .enq$v(printfp$enq$v),
        .enq__RDY(printfp$enq__RDY));
    assign method$say$v = pipe$enq$v[(16 + 128) - 32 -1 :((16 + 128) - 32 - 32)];
    assign method$say2$a = pipe$enq$v[(16 + 128) - 32 -1 :((16 + 128) - 32 - 16)];
    assign method$say2$b = pipe$enq$v[((16 + 128) - 32 - 16) -1 :(((16 + 128) - 32 - 16) - 16)];
    assign method$say2__ENA = pipe$enq__ENA && method$say__RDY && method$setLeds__RDY && printfp$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign method$say__ENA = pipe$enq__ENA && method$say2__RDY && method$setLeds__RDY && printfp$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method$setLeds$v = pipe$enq$v[(16 + 128) - 32-24 -1 :((16 + 128) - 32-24 - 8)];
    assign method$setLeds__ENA = pipe$enq__ENA && method$say__RDY && method$say2__RDY && printfp$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 );
    assign pipe$enq__RDY = method$say__RDY && method$say2__RDY && method$setLeds__RDY && printfp$enq__RDY;
    assign printfp$enq$v = { 80'd0 , pipe$enq$v , 16'd9 , 16'd32767 , 16'd5 };
    assign printfp$enq__ENA = pipe$enq__ENA && method$say__RDY && method$say2__RDY && method$setLeds__RDY;
endmodule 

`default_nettype wire    // set back to default value
