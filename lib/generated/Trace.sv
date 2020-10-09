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
    reg dataAvail;
    reg [11 - 1:0]readAddr;
    reg [32 - 1:0]timestamp;
    logic RULE$copyRule__ENA;
    logic RULE$copyRule__RDY;
    logic [width - 1:0]bram$dataOut;
    logic [$clog2(depth) - 1:0]bram$read$addr;
    logic bram$read__RDY;
    logic [$clog2(depth) - 1:0]bram$write$addr;
    logic [width - 1:0]bram$write$data;
    logic bram$write__ENA;
    logic bram$write__RDY;
    PipeIn#(.width(width)) bscan$fromBscan();
    PipeIn#(.width(width)) bscan$toBscan();
    PipeIn#(.width(width)) readUser();
    BRAM#(.width(width),.depth(depth)) bram (.CLK(CLK), .nRST(nRST),
        .write__ENA(bram$write__ENA),
        .write$addr(bram$write$addr),
        .write$data(bram$write$data),
        .write__RDY(bram$write__RDY),
        .read__ENA(!( dataAvail || ( !readUser.enq__ENA ) )),
        .read$addr(bram$read$addr),
        .read__RDY(bram$read__RDY),
        .dataOut(bram$dataOut),
        .dataOut__RDY(bscan$toBscan.enq__ENA));
    Bscan#(.id(3),.width(width)) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan(bscan$toBscan),
        .fromBscan(readUser));
    assign bram$read$addr = ( !( dataAvail || ( !readUser.enq__ENA ) ) ) ? readAddr : 11'd0;
    assign bram$write$addr = ( !( ( enable == 0 ) || ( buffer == data ) ) ) ? addr : 11'd0;
    assign bram$write$data = ( !( ( enable == 0 ) || ( buffer == data ) ) ) ? { timestamp , data[ ( width - 32 ) : 0 ] } : 0;
    assign bram$write__ENA = !( ( enable == 0 ) || ( buffer == data ) );
    // Extra assigments, not to output wires
    assign RULE$copyRule__ENA = !( ( enable == 0 ) || ( buffer == data ) || ( !bram$write__RDY ) );
    assign RULE$copyRule__RDY = !( ( enable == 0 ) || ( buffer == data ) || ( !bram$write__RDY ) );
    assign bscan$toBscan.enq$v = bscan$toBscan.enq__ENA ? bram$dataOut : 0;
    assign readUser.enq__RDY = dataAvail || bram$read__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        addr <= 0;
        buffer <= 0;
        dataAvail <= 0;
        readAddr <= 0;
        timestamp <= 0;
      end // nRST
      else begin
        if (bscan$toBscan.enq__ENA && bscan$toBscan.enq__RDY) begin // RULE$callBack__ENA
            dataAvail <= 0;
        end; // End of RULE$callBack__ENA
        if (RULE$copyRule__ENA && RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            addr <= addr + 1;
            buffer <= data;
        end; // End of RULE$copyRule__ENA
        // RULE$init__ENA
            timestamp <= timestamp + 1;
        // End of RULE$init__ENA
        if (readUser.enq__ENA && ( dataAvail || bram$read__RDY )) begin // readUser.enq__ENA
            if (!dataAvail) begin
            readAddr <= readAddr + 1;
            dataAvail <= 1;
            end;
        end; // End of readUser.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
