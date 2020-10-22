`include "tracebuf.generated.vh"

`default_nettype none
module Trace #(
    parameter integer width = 64,
    parameter integer depth = 1024)(
    input wire CLK,
    input wire nRST,
    input wire enable,
    input wire [width - 1:0]data);
    reg [11 - 1:0]addr;
    reg [width - 1:0]buffer;
    reg [11 - 1:0]readAddr;
    reg [32 - 1:0]timestamp;
    reg writeNext;
    logic RULE$copyRule__ENA;
    logic RULE$copyRule__RDY;
    logic [width - 1:0]bram$dataOut;
    logic bram$read__RDY;
    logic bram$write__RDY;
    PipeIn#(.width(32)) bscan$fromBscan();
    PipeIn#(.width(32)) bscan$toBscan();
    PipeInLength#(.width(width)) radapter$in();
    PipeOutLast#(.width(32)) radapter$out();
    PipeIn#(.width(32)) readUser();
    BRAM#(.width(width),.depth(depth)) bram (.CLK(CLK), .nRST(nRST),
        .write__ENA(!( ( enable == 0 ) || ( !writeNext ) )),
        .write$addr(( !( ( enable == 0 ) || ( !writeNext ) ) ) ? addr : 11'd0),
        .write$data(( !( ( enable == 0 ) || ( !writeNext ) ) ) ? { timestamp , buffer[ ( width - 32 ) : 0 ] } : 0),
        .write__RDY(bram$write__RDY),
        .read__ENA(readUser.enq__ENA && radapter$out.last),
        .read$addr(( readUser.enq__ENA && radapter$out.last ) ? readAddr : 11'd0),
        .read__RDY(bram$read__RDY),
        .dataOut(bram$dataOut),
        .dataOut__RDY(radapter$in.enq__ENA));
    Bscan#(.id(3),.width(32)) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan(bscan$toBscan),
        .fromBscan(readUser));
    AdapterToBus#(.width(width),.owidth(32)) radapter (.CLK(CLK), .nRST(nRST),
        .in(radapter$in),
        .out(radapter$out));
    // Extra assigments, not to output wires
    assign RULE$copyRule__ENA = !( ( enable == 0 ) || ( !( writeNext && bram$write__RDY ) ) );
    assign RULE$copyRule__RDY = !( ( enable == 0 ) || ( !( writeNext && bram$write__RDY ) ) );
    assign bscan$toBscan.enq$v = radapter$out.first__RDY ? radapter$out.first : 0;
    assign bscan$toBscan.enq__ENA = radapter$out.first__RDY;
    assign radapter$in.enq$size = radapter$in.enq__ENA ? ( (32'(width)) ) : 32'd0;
    assign radapter$in.enq$v = radapter$in.enq__ENA ? bram$dataOut : 0;
    assign radapter$out.deq__ENA = readUser.enq__ENA;
    assign readUser.enq__RDY = radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        addr <= 0;
        buffer <= 0;
        readAddr <= 0;
        timestamp <= 0;
        writeNext <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__ENA && RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            addr <= addr + 11'd1;
        end; // End of RULE$copyRule__ENA
        // RULE$init__ENA
            timestamp <= timestamp + 32'd1;
            buffer <= data;
            writeNext <= buffer != data;
        // End of RULE$init__ENA
        if (readUser.enq__ENA && readUser.enq__RDY) begin // readUser.enq__ENA
            if (radapter$out.last)
            readAddr <= readAddr + 11'd1;
        end; // End of readUser.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
