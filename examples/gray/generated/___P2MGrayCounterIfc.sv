`include "gray.generated.vh"

`default_nettype none
module ___P2MGrayCounterIfc #(
    parameter integer width = 4)(
    input wire CLK, input wire nRST,
    GrayCounterIfc.client method,
    PipeIn.server pipe,
    PipeIn.client returnInd);
    // Extra assigments, not to output wires
    assign method.decrement__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 );
    assign method.increment__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign method.writeBin$v = pipe.enq$v[ ( (16 + 128) - 32-28-1 ) : ( ((16 + 128) - 32-28 - 4) ) ];
    assign method.writeBin__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 );
    assign method.writeGray$v = pipe.enq$v[ ( (16 + 128) - 32-28-1 ) : ( ((16 + 128) - 32-28 - 4) ) ];
    assign method.writeGray__ENA = pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 );
    assign pipe.enq__RDY = ( method.increment__RDY && ( ( method.decrement__RDY && returnInd.enq__RDY && ( ( method.writeGray__RDY && ( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) || ( ( !method.writeGray__RDY ) && ( !( ( method.writeBin__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) ) ) ) ) ) ) ) || ( ( !method.decrement__RDY ) && ( !( ( method.writeGray__RDY && ( ( method.writeBin__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( method.writeBin__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) ) ) ) || ( ( !method.increment__RDY ) && ( !( ( method.decrement__RDY && ( ( method.writeGray__RDY && ( ( method.writeBin__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( method.writeBin__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) || ( ( !method.decrement__RDY ) && ( ( method.writeGray__RDY && ( ( method.writeBin__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( method.writeBin__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) || ( ( !method.writeBin__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) ) ) );
    assign returnInd.enq__ENA = pipe.enq__ENA && pipe.enq__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width ) );
    always_comb begin
    returnInd.enq$v = 0;
    unique case(1'b1)
    pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2 ): returnInd.enq$v = { 16'd2 , 16'd5 , 12'd0 , method.readGray , 16'd10 , 64'd0 , 16'd2 };
    pipe.enq__ENA && pipe.enq__RDY && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width ): returnInd.enq$v = { width , 16'd5 , 12'd0 , method.readBin , 16'd10 , 64'd0 , 16'd2 };
    endcase
    end
endmodule

`default_nettype wire    // set back to default value
