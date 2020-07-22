`include "gray.generated.vh"

`default_nettype none
module ___P2MGrayCounterIfc #(
    parameter integer width = 4)(
    input wire CLK, input wire nRST,
    output wire method$increment__ENA,
    input wire method$increment__RDY,
    output wire method$decrement__ENA,
    input wire method$decrement__RDY,
    input wire [width - 1:0]method$readGray,
    input wire method$readGray__RDY,
    output wire method$writeGray__ENA,
    output wire [width - 1:0]method$writeGray$v,
    input wire method$writeGray__RDY,
    input wire [width - 1:0]method$readBin,
    input wire method$readBin__RDY,
    output wire method$writeBin__ENA,
    output wire [width - 1:0]method$writeBin$v,
    input wire method$writeBin__RDY,
    input wire pipe$enq__ENA,
    input wire [(16 + 128) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire returnInd$enq__ENA,
    output wire [(16 + 128) - 1:0]returnInd$enq$v,
    input wire returnInd$enq__RDY);
    assign method$decrement__ENA = pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign method$increment__ENA = pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method$writeBin$v = pipe$enq$v[(16 + 128) - 32 -1 :((16 + 128) - 32 - width)];
    assign method$writeBin__ENA = pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 );
    assign method$writeGray$v = pipe$enq$v[(16 + 128) - 32 -1 :((16 + 128) - 32 - width)];
    assign method$writeGray__ENA = pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 );
    assign pipe$enq__RDY = method$increment__RDY && method$decrement__RDY && returnInd$enq__RDY && method$writeGray__RDY && method$writeBin__RDY;
    assign returnInd$enq$v = ( ( pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 ) ) ? ( { method$readGray, 16'd0, 16'd2, 16'd5, 16'd2/* length */} ) : 144'd0 ) | ( ( pipe$enq__ENA && pipe$enq__RDY && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width ) ) ? ( { method$readBin, 16'd0, 16'd4, 16'd5, 16'd2/* length */} ) : 144'd0 );
    assign returnInd$enq__ENA = pipe$enq__ENA && pipe$enq__RDY && ( ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 ) || ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width ) );

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA && pipe$enq__RDY) begin // pipe$enq__ENA
            $display( "DISPLAYP2M %x" , pipe$enq$v );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
