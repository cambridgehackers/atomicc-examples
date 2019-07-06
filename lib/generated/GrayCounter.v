`include "grayCounter.generated.vh"

`default_nettype none
module GrayCounter #(
    parameter integer width = 10)(
    input wire CLK, input wire nRST,
    input wire ifc$decrement__ENA,
    output wire ifc$decrement__RDY,
    input wire ifc$increment__ENA,
    output wire ifc$increment__RDY,
    output wire [width - 1:0]ifc$readBin,
    output wire ifc$readBin__RDY,
    output wire [width - 1:0]ifc$readGray,
    output wire ifc$readGray__RDY,
    input wire ifc$writeBin__ENA,
    input wire [width - 1:0]ifc$writeBin$v,
    output wire ifc$writeBin__RDY,
    input wire ifc$writeGray__ENA,
    input wire [width - 1:0]ifc$writeGray$v,
    output wire ifc$writeGray__RDY);
    reg [width - 1:0]counter;
    wire RULE$incdec$useLsb;
    wire [10 - 1:0]ifc$readBin$temp;
    genvar __inst$Genvar1;
    assign ifc$decrement__RDY = 1;
    assign ifc$increment__RDY = 1;
    assign ifc$readBin = ifc$readBin$temp;
    assign ifc$readBin__RDY = 1;
    assign ifc$readGray = counter;
    assign ifc$readGray__RDY = 1;
    assign ifc$writeBin__RDY = 1;
    assign ifc$writeGray__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$incdec$useLsb = ( ^counter ) == ifc$decrement__ENA;
for(__inst$Genvar1 = 0; __inst$Genvar1 < width; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign ifc$readBin$temp[ __inst$Genvar1 ] = ^counter[ ( width - 1 ) : __inst$Genvar1 ];
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
      end // nRST
      else begin
        if (!( ifc$increment__ENA == ifc$decrement__ENA )) begin // RULE$incdec__ENA
            if (counter[ 0 ] & ( RULE$incdec$useLsb == 0 ))
            counter[ ( 0 + 1 ) ] <= counter[ ( 0 + 1 ) ] ^ 1;
            if (( ( |counter[ ( ( width - 1 ) - 1 ) : 0 ] ) == 0 ) & ( RULE$incdec$useLsb == 0 ))
            counter[ ( width - 1 ) ] <= counter[ ( width - 1 ) ] ^ 1;
            if (!( RULE$incdec$useLsb == 0 ))
            counter[ 0 ] <= counter[ 0 ] ^ 1;
        end; // End of RULE$incdec__ENA
        if (ifc$writeBin__ENA) begin // ifc$writeBin__ENA
            counter[ ( width - 1 ) ] <= ifc$writeBin$v[ ( width - 1 ) ];
        end; // End of ifc$writeBin__ENA
        if (ifc$writeGray__ENA) begin // ifc$writeGray__ENA
            counter <= ifc$writeGray$v;
        end; // End of ifc$writeGray__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; __inst$Genvar1 < ( width - 1 ); __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (ifc$writeBin__ENA) begin // ifc$writeBin__ENA
            counter[ __inst$Genvar1 ] <= ^ifc$writeBin$v[ ( __inst$Genvar1 + 1 ) : __inst$Genvar1 ];
        end; // End of ifc$writeBin__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop

    for(__inst$Genvar1 = 1; __inst$Genvar1 < ( width - 2 ); __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (!( ifc$increment__ENA == ifc$decrement__ENA )) begin // RULE$incdec__ENA
            if (( ( |counter[ ( __inst$Genvar1 - 1 ) : 0 ] ) == 0 ) & counter[ __inst$Genvar1 ] & ( RULE$incdec$useLsb == 0 ))
            counter[ ( __inst$Genvar1 + 1 ) ] <= counter[ ( __inst$Genvar1 + 1 ) ] ^ 1;
        end; // End of RULE$incdec__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule 

`default_nettype wire    // set back to default value
