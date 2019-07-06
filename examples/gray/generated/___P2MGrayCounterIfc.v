`include "gray.generated.vh"

`default_nettype none
module ___P2MGrayCounterIfc #(
    parameter integer width = 4)(
    input wire CLK, input wire nRST,
    output wire method$decrement__ENA,
    input wire method$decrement__RDY,
    output wire method$increment__ENA,
    input wire method$increment__RDY,
    input wire [width - 1:0]method$readBin,
    input wire method$readBin__RDY,
    input wire [width - 1:0]method$readGray,
    input wire method$readGray__RDY,
    output wire method$writeBin__ENA,
    output wire [width - 1:0]method$writeBin$v,
    input wire method$writeBin__RDY,
    output wire method$writeGray__ENA,
    output wire [width - 1:0]method$writeGray$v,
    input wire method$writeGray__RDY,
    input wire pipe$enq__ENA,
    input wire [128 - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire returnInd$enq__ENA,
    output wire [128 - 1:0]returnInd$enq$v,
    input wire returnInd$enq__RDY);
    assign method$decrement__ENA = pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == 16'd0 );
    assign method$increment__ENA = pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == 16'd1 );
    assign method$writeBin$v = pipe$enq$v[(32 + 4) -1 :32];
    assign method$writeBin__ENA = pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == width );
    assign method$writeGray$v = pipe$enq$v[(32 + 4) -1 :32];
    assign method$writeGray__ENA = pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == 16'd5 );
    assign pipe$enq__RDY = method$decrement__RDY & method$increment__RDY & returnInd$enq__RDY & method$writeBin__RDY & method$writeGray__RDY;
    assign returnInd$enq$v = ( ( pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == 16'd2 ) ) ? method$readBin : 128'd0 ) | ( ( pipe$enq__ENA & pipe$enq__RDY & ( pipe$enq$v[ 31 : 16 ] == 16'd3 ) ) ? method$readGray : 128'd0 );
    assign returnInd$enq__ENA = pipe$enq__ENA & pipe$enq__RDY & ( ( pipe$enq$v[ 31 : 16 ] == 16'd2 ) | ( pipe$enq$v[ 31 : 16 ] == 16'd3 ) );
endmodule 

`default_nettype wire    // set back to default value
