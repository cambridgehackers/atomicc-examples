`include "grayCounter.generated.vh"

`default_nettype none
module GrayCounter #(
    parameter integer width = 10)(
    input wire CLK, input wire nRST,
    input wire ifc$increment__ENA,
    output wire ifc$increment__RDY,
    input wire ifc$decrement__ENA,
    output wire ifc$decrement__RDY,
    output wire [width - 1:0]ifc$readGray,
    output wire ifc$readGray__RDY,
    input wire ifc$writeGray__ENA,
    input wire [width - 1:0]ifc$writeGray$v,
    output wire ifc$writeGray__RDY,
    output wire [width - 1:0]ifc$readBin,
    output wire ifc$readBin__RDY,
    input wire ifc$writeBin__ENA,
    input wire [width - 1:0]ifc$writeBin$v,
    output wire ifc$writeBin__RDY);
    reg counter [width - 1:0];
    wire [width - 1:0]RULE$incdec$ctemp;
    wire RULE$incdec$useLsb;
    wire RULE$incdec__RDY;
    wire [width - 1:0]ifc$readBin$ctemp;
    wire [width - 1:0]ifc$readBin$rtemp;
    wire ifc$readBin$temp [width - 1:0];
    wire [width - 1:0]ifc$readGray$ctemp;
    genvar __inst$Genvar1;
    assign ifc$decrement__RDY = 1;
    assign ifc$increment__RDY = 1;
    assign ifc$readBin = ifc$readBin$rtemp;
    assign ifc$readBin__RDY = 1;
    assign ifc$readGray = ifc$readGray$ctemp;
    assign ifc$readGray__RDY = 1;
    assign ifc$writeBin__RDY = 1;
    assign ifc$writeGray__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$incdec$useLsb = RULE$incdec$ctemp == ifc$decrement__ENA;
    assign RULE$incdec__RDY = !( ifc$increment__ENA == ifc$decrement__ENA );
for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign RULE$incdec$ctemp[ __inst$Genvar1 ] = counter[__inst$Genvar1];
        assign ifc$readBin$ctemp[ __inst$Genvar1 ] = counter[__inst$Genvar1];
        assign ifc$readBin$rtemp[ __inst$Genvar1 ] = ifc$readBin$temp[__inst$Genvar1];
        assign ifc$readBin$temp[__inst$Genvar1] = ifc$readBin$ctemp[ ( width - 1 ) : __inst$Genvar1 ];
        assign ifc$readGray$ctemp[ __inst$Genvar1 ] = counter[__inst$Genvar1];
    end;

    for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (RULE$incdec__RDY) begin // RULE$incdec__ENA
            counter[__inst$Genvar1] <= counter[__inst$Genvar1] ^ ( ( ( __inst$Genvar1 == 0 ) ? RULE$incdec$useLsb : 0 ) | ( ( !( __inst$Genvar1 == 0 ) ) ? ( ( ( RULE$incdec$useLsb != 0 ) ^ 1 ) & ( ( __inst$Genvar1 == ( width - 1 ) ) | RULE$incdec$ctemp[ ( ( ( !( ( __inst$Genvar1 < 1 ) || ( __inst$Genvar1 == 0 ) ) ) ? ( __inst$Genvar1 - 1 ) : 0 ) ) ] ) & ( ( __inst$Genvar1 == 1 ) | ( ( ( RULE$incdec$ctemp[ ( ( ( !( ( __inst$Genvar1 < 2 ) || ( __inst$Genvar1 == 0 ) ) ) ? ( __inst$Genvar1 - 2 ) : 0 ) ) : 0 ] ) != 0 ) ^ 1 ) ) ) : 0 ) );
        end; // End of RULE$incdec__ENA
        if (ifc$writeBin__ENA) begin // ifc$writeBin__ENA
            if (__inst$Genvar1 == ( width - 1 ))
            counter[__inst$Genvar1] <= ifc$writeBin$v[ __inst$Genvar1 ];
            if (!( __inst$Genvar1 == ( width - 1 ) ))
            counter[__inst$Genvar1] <= ifc$writeBin$v[ ( __inst$Genvar1 + 1 ) : __inst$Genvar1 ];
        end; // End of ifc$writeBin__ENA
        if (ifc$writeGray__ENA) begin // ifc$writeGray__ENA
            counter[__inst$Genvar1] <= ifc$writeGray$v[ __inst$Genvar1 ];
        end; // End of ifc$writeGray__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule 

`default_nettype wire    // set back to default value
