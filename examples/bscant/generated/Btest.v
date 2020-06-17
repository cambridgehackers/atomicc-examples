`include "bscant.generated.vh"

`default_nettype none
module Btest (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg [8 - 1:0]readCount;
    reg [8 - 1:0]writeCount;
    wire [32 - 1:0]bscan$fromBscan$enq$v;
    wire bscan$fromBscan$enq__ENA;
    wire [32 - 1:0]bscan$toBscan$enq$v;
    wire bscan$toBscan$enq__RDY;
    wire [32 - 1:0]readUser$enq$v;
    Bscan#(32) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan$enq__ENA(request$say__ENA),
        .toBscan$enq$v(bscan$toBscan$enq$v),
        .toBscan$enq__RDY(bscan$toBscan$enq__RDY),
        .fromBscan$enq__ENA(bscan$fromBscan$enq__ENA),
        .fromBscan$enq$v(bscan$fromBscan$enq$v),
        .fromBscan$enq__RDY(indication$heard__RDY));
    assign bscan$toBscan$enq$v = request$say$v;
    assign indication$heard$v = { writeCount , readCount , readUser$enq$v[ 15 : 0 ] };
    assign indication$heard__ENA = bscan$fromBscan$enq__ENA;
    assign request$say__RDY = bscan$toBscan$enq__RDY;
    // Extra assigments, not to output wires
    assign readUser$enq$v = bscan$fromBscan$enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        readCount <= 0;
        writeCount <= 0;
      end // nRST
      else begin
        if (bscan$fromBscan$enq__ENA && indication$heard__RDY) begin // readUser$enq__ENA
            readCount <= readCount + 1;
        end; // End of readUser$enq__ENA
        if (request$say__ENA && bscan$toBscan$enq__RDY) begin // request$say__ENA
            writeCount <= writeCount + 1;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
