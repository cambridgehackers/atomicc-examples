`include "bramt.generated.vh"

`default_nettype none
module Btest (input wire CLK, input wire nRST,
    BtestRequest.server request,
    BtestIndication.client indication);
    reg waitRead;
    logic RULE$callBack__ENA;
    logic RULE$callBack__RDY;
    logic [4 - 1:0]bram$dataOut;
    logic bram$dataOut__RDY;
    logic [$clog2(1024) - 1:0]bram$read$addr;
    logic [$clog2(1024) - 1:0]bram$write$addr;
    logic [4 - 1:0]bram$write$data;
    BRAM#(.width(4),.depth(1024)) bram (.CLK(CLK), .nRST(nRST),
        .write__ENA(request.write__ENA),
        .write$addr(bram$write$addr),
        .write$data(bram$write$data),
        .write__RDY(request.write__RDY),
        .read__ENA(request.read__ENA),
        .read$addr(bram$read$addr),
        .read__RDY(request.read__RDY),
        .dataOut(bram$dataOut),
        .dataOut__RDY(bram$dataOut__RDY));
    assign bram$read$addr = request.read__ENA ? request.read$addr[ 9 : 0 ] : 0;
    assign bram$write$addr = request.write__ENA ? request.write$addr[ 9 : 0 ] : 0;
    assign bram$write$data = request.write__ENA ? request.write$data[ 3 : 0 ] : 4'd0;
    // Extra assigments, not to output wires
    assign RULE$callBack__ENA = !( ( 0 == waitRead ) || ( !( bram$dataOut__RDY && indication.heard__RDY ) ) );
    assign RULE$callBack__RDY = !( ( 0 == waitRead ) || ( !( bram$dataOut__RDY && indication.heard__RDY ) ) );
    assign indication.heard$v = ( !( ( 0 == waitRead ) || ( !bram$dataOut__RDY ) ) ) ? bram$dataOut : 4'd0;
    assign indication.heard__ENA = !( ( 0 == waitRead ) || ( !bram$dataOut__RDY ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        waitRead <= 0;
      end // nRST
      else begin
        if (RULE$callBack__ENA && RULE$callBack__RDY) begin // RULE$callBack__ENA
            waitRead <= 0;
            $display( "callback: data %x" , bram$dataOut );
        end; // End of RULE$callBack__ENA
        if (request.read__ENA && request.read__RDY) begin // request.read__ENA
            waitRead <= 1;
            $display( "read: addr %x" , request.read$addr );
        end; // End of request.read__ENA
        if (request.write__ENA && request.write__RDY) begin // request.write__ENA
            $display( "write: addr %x data %x" , request.write$addr , request.write$data );
        end; // End of request.write__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
