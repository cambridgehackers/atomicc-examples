`include "bscant.generated.vh"

`default_nettype none
module Btest (input wire CLK, input wire nRST,
    BtestRequest.server request,
    BtestIndication.client indication);
    reg [32 - 1:0]nextV;
    reg [8 - 1:0]readCount;
    reg ready;
    reg [8 - 1:0]writeCount;
    logic RULE$copyRule__ENA;
    PipeIn#(.width(32)) bscan$fromBscan();
    PipeIn#(.width(32)) bscan$toBscan();
    PipeIn#(.width(32)) readUser();
    Bscan#(.id(4),.width(32)) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan(bscan$toBscan),
        .fromBscan(readUser));
    // Extra assigments, not to output wires
    assign RULE$copyRule__ENA = bscan$toBscan.enq__RDY;
    assign bscan$toBscan.enq$v = nextV;
    assign bscan$toBscan.enq__ENA = 1'd1;
    assign indication.heard$v = readUser.enq__ENA ? readUser.enq$v : 0;
    assign indication.heard__ENA = readUser.enq__ENA;
    assign readUser.enq__RDY = indication.heard__RDY;
    assign request.say__RDY = 1'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        nextV <= 0;
        readCount <= 0;
        ready <= 0;
        writeCount <= 0;
      end // nRST
      else begin
        if (bscan$toBscan.enq__RDY && RULE$copyRule__ENA) begin // RULE$copyRule__ENA
            ready <= 1'd0;
            writeCount <= writeCount + 8'd1;
        end; // End of RULE$copyRule__ENA
        if (indication.heard__RDY && readUser.enq__ENA) begin // readUser.enq__ENA
            readCount <= readCount + 8'd1;
        end; // End of readUser.enq__ENA
        if (request.say__ENA) begin // request.say__ENA
            nextV <= request.say$v;
            ready <= 1'd1;
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
