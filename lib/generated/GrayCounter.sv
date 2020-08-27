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
    wire RULE$incdec$useLsb;
    wire [width - 1:0]counterBit;
    wire [width - 1:0]m;
    wire [width - 1:0]readBin$rtemp;
    wire readBin$temp [width - 1:0];
    genvar __inst$Genvar1;
    assign decrement__RDY = 1;
    assign increment__RDY = 1;
    assign readBin = readBin$rtemp;
    assign readBin__RDY = 1;
    assign readGray = counterBit;
    assign readGray__RDY = 1;
    assign writeBin__RDY = 1;
    assign writeGray__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$incdec$useLsb = ( ^counterBit ) == decrement__ENA;
for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign counterBit[ __inst$Genvar1 ] = counter[ __inst$Genvar1 ];
    assign readBin$rtemp[ __inst$Genvar1 ] = readBin$temp[ __inst$Genvar1 ];
    assign readBin$temp[ __inst$Genvar1 ] = ^counterBit[ ( width - 1 ) : __inst$Genvar1 ];
    end;

    for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (!( increment__ENA == decrement__ENA )) begin // RULE$incdec__ENA
            counter[ __inst$Genvar1 ] <= counter[ __inst$Genvar1 ] ^ ( ( __inst$Genvar1 == 0 ) ? RULE$incdec$useLsb : ( ( ( RULE$incdec$useLsb != 0 ) ^ 1 ) & ( ( __inst$Genvar1 == ( width - 1 ) ) | counterBit[ ( ( ( !( ( __inst$Genvar1 < 1 ) || ( __inst$Genvar1 == 0 ) ) ) ? ( __inst$Genvar1 - 1 ) : 0 ) ) ] ) & ( ( __inst$Genvar1 == 1 ) | ( ( ( |counterBit[ ( ( ( !( ( __inst$Genvar1 < 2 ) || ( __inst$Genvar1 == 0 ) ) ) ? ( __inst$Genvar1 - 2 ) : 0 ) ) : 0 ] ) != 0 ) ^ 1 ) ) ) );
        end; // End of RULE$incdec__ENA
        if (writeBin__ENA) begin // writeBin__ENA
            if (!( __inst$Genvar1 == ( width - 1 ) ))
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
