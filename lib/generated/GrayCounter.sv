`include "grayCounter.generated.vh"

`default_nettype none
module GrayCounter #(
    parameter integer width = 10)(
    input wire CLK, input wire nRST,
    input wire increment__ENA,
    output wire increment__RDY,
    input wire decrement__ENA,
    output wire decrement__RDY,
    output wire [width - 1:0]readGray,
    output wire readGray__RDY,
    input wire writeGray__ENA,
    input wire [width - 1:0]writeGray$v,
    output wire writeGray__RDY,
    output wire [width - 1:0]readBin,
    output wire readBin__RDY,
    input wire writeBin__ENA,
    input wire [width - 1:0]writeBin$v,
    output wire writeBin__RDY);
    reg counter [width - 1:0];
    logic RULE$incdec__ENA;
    logic _RULE$incdec$useLsb;
    logic __traceMemory$clear__ENA;
    PipeOut#(.width(32)) __traceMemory$out();
    logic [width - 1:0]_readBin$rtemp;
    logic _readBin$temp [width - 1:0];
    logic [width - 1:0]counterBit;
    logic [width - 1:0]m;
    genvar __inst$Genvar1;
    Trace#(.width(32+1+1+1+1+1+width+width+width+width),.depth(1024),.head(0),.sensitivity(1+1+1+1+1)) __traceMemory (
        .clear__ENA(__traceMemory$clear__ENA),
        .clear__RDY(),
        .CLK(CLK),
        .nRST(nRST),
        .enable(1'd1),
        .data({ 32'd0 , RULE$incdec__ENA , increment__ENA , decrement__ENA , writeGray__ENA , writeBin__ENA , readGray , writeGray$v , readBin , writeBin$v }),
        .out(__traceMemory$out));
    assign decrement__RDY = 1'd1;
    assign increment__RDY = 1'd1;
    assign readBin = _readBin$rtemp;
    assign readBin__RDY = 1'd1;
    assign readGray = counterBit;
    assign readGray__RDY = 1'd1;
    assign writeBin__RDY = 1'd1;
    assign writeGray__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign RULE$incdec__ENA = increment__ENA != decrement__ENA;
    assign _RULE$incdec$useLsb = ( ^counterBit ) == decrement__ENA;
for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign _readBin$rtemp[ __inst$Genvar1 ] = _readBin$temp[ __inst$Genvar1 ];
    assign _readBin$temp[ __inst$Genvar1 ] = ^counterBit[ ( width - 1 ) : __inst$Genvar1 ];
    assign counterBit[ __inst$Genvar1 ] = counter[ __inst$Genvar1 ];
    end;

    for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( increment__ENA != decrement__ENA ) && RULE$incdec__ENA) begin // RULE$incdec__ENA
            counter[ __inst$Genvar1 ] <= counter[ __inst$Genvar1 ] ^ ( ( __inst$Genvar1 == 0 ) ? _RULE$incdec$useLsb : ( ( ( _RULE$incdec$useLsb != 0 ) ^ 1'd1 ) & ( ( __inst$Genvar1 == ( width - 1 ) ) | counterBit[ ( ( ( !( __inst$Genvar1 < 1 ) ) && ( __inst$Genvar1 != 0 ) ) ? ( __inst$Genvar1 - 1 ) : 0 ) ] ) & ( ( __inst$Genvar1 == 1 ) | ( ( ( |counterBit[ ( ( ( !( __inst$Genvar1 < 2 ) ) && ( __inst$Genvar1 != 0 ) ) ? ( __inst$Genvar1 - 2 ) : 0 ) : 0 ] ) != 0 ) ^ 1'd1 ) ) ) );
        end; // End of RULE$incdec__ENA
        if (writeBin__ENA) begin // writeBin__ENA
            if (__inst$Genvar1 != ( width - 1 ))
            counter[ __inst$Genvar1 ] <= ^writeBin$v[ ( __inst$Genvar1 + 1 ) : __inst$Genvar1 ];
            if (__inst$Genvar1 == ( width - 1 ))
            counter[ __inst$Genvar1 ] <= writeBin$v[ __inst$Genvar1 ];
        end; // End of writeBin__ENA
        if (writeGray__ENA) begin // writeGray__ENA
            counter[ __inst$Genvar1 ] <= writeGray$v[ __inst$Genvar1 ];
        end; // End of writeGray__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule

`default_nettype wire    // set back to default value
