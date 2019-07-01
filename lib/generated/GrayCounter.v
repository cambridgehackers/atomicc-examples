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
    wire [16 - 1:0]RULE$incdec__ENA$ind [10 - 1:0];
    wire RULE$incdec__ENA$parity [10 - 1:0];
    wire ifc$readBin$temp [10 - 1:0];
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
    assign RULE$incdec__ENA$ind[width - 1] = width[ 15 : 0 ] - 16'd1;
    assign RULE$incdec__ENA$parity[width - 1] = counter[ ( width - 1 ) ];
    assign ifc$readBin$temp[width - 1] = counter[ ( width - 1 ) ];
for(__inst$Genvar1 = 0; __inst$Genvar1 < ( width - 1 ); __inst$Genvar1 = 1) begin
        assign RULE$incdec__ENA$ind[__inst$Genvar1] = counter[ __inst$Genvar1 ] ? ( __inst$Genvar1 + 16'd1 ) : RULE$incdec__ENA$ind[__inst$Genvar1 + 1];
        assign RULE$incdec__ENA$parity[__inst$Genvar1] = RULE$incdec__ENA$parity[__inst$Genvar1 + 1] ^ counter[ __inst$Genvar1 ];
        assign ifc$readBin$temp[__inst$Genvar1] = ifc$readBin$temp[__inst$Genvar1 + 1] ^ counter[ __inst$Genvar1 ];
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
      end // nRST
      else begin
        if (!( ifc$increment__ENA == ifc$decrement__ENA )) begin // RULE$incdec__ENA
            counter[ ( ( RULE$incdec__ENA$parity[ 0 ] == ifc$decrement__ENA ) ? 0 : RULE$incdec__ENA$ind[0] ) ] <= counter[ ( ( RULE$incdec__ENA$parity[ 0 ] == ifc$decrement__ENA ) ? 0 : RULE$incdec__ENA$ind[0] ) ] ^ 1;
        end; // End of RULE$incdec__ENA
        if (ifc$writeBin__ENA) begin // ifc$writeBin__ENA
            counter[ ( width - 1 ) ] <= ifc$writeBin$v[ ( width - 1 ) ];
        end; // End of ifc$writeBin__ENA
        if (ifc$writeGray__ENA) begin // ifc$writeGray__ENA
            counter <= ifc$writeGray$v;
        end; // End of ifc$writeGray__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; __inst$Genvar1 < ( width - 1 ); __inst$Genvar1 = 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (ifc$writeBin__ENA) begin // ifc$writeBin__ENA
            counter[ __inst$Genvar1 ] <= ifc$writeBin$v[ ( __inst$Genvar1 + 1 ) ] ^ ifc$writeBin$v[ __inst$Genvar1 ];
        end; // End of ifc$writeBin__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
