`include "bscant.generated.vh"

`default_nettype none
module Btest (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg [32 - 1:0]nextV;
    reg [8 - 1:0]readCount;
    reg ready;
    reg [8 - 1:0]writeCount;
    wire bscan$fromBscan$enq__ENA;
    wire [32 - 1:0]bscan$toBscan$enq$v;
    wire bscan$toBscan$enq__RDY;
    Bscan#(.id(4),.width(32)) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan$enq__ENA(1),
        .toBscan$enq$v(bscan$toBscan$enq$v),
        .toBscan$enq__RDY(bscan$toBscan$enq__RDY),
        .fromBscan$enq__ENA(bscan$fromBscan$enq__ENA),
        .fromBscan$enq$v(indication$heard$v),
        .fromBscan$enq__RDY(indication$heard__RDY));
    assign bscan$toBscan$enq$v = nextV;
    assign indication$heard__ENA = bscan$fromBscan$enq__ENA;
    assign request$say__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        nextV <= 0;
        readCount <= 0;
        ready <= 0;
        writeCount <= 0;
      end // nRST
      else begin
        if (bscan$toBscan$enq__RDY) begin // RULE$copyRule__ENA
            ready <= 0;
            writeCount <= writeCount + 1;
        end; // End of RULE$copyRule__ENA
        if (bscan$fromBscan$enq__ENA && indication$heard__RDY) begin // readUser$enq__ENA
            readCount <= readCount + 1;
        end; // End of readUser$enq__ENA
        if (request$say__ENA) begin // request$say__ENA
            nextV <= request$say$v;
            ready <= 1;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
