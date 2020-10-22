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
    reg [8 - 1:0]countCB;
    reg [8 - 1:0]countFrom;
    reg [8 - 1:0]countJtag;
    reg [8 - 1:0]countTo;
    reg dataNotAvail;
    reg [32 - 1:0]dataToJtag;
    reg [11 - 1:0]readAddr;
    reg [32 - 1:0]timestamp;
    reg writeNext;
    logic RULE$copyFromAdapter__ENA;
    logic RULE$copyFromAdapter__RDY;
    logic RULE$copyRule__ENA;
    logic RULE$copyRule__RDY;
    logic RULE$readCallBack__ENA;
    logic RULE$readCallBack__RDY;
    logic [width - 1:0]bram$dataOut;
    logic bram$dataOut__RDY;
    logic bram$read__RDY;
    logic bram$write__RDY;
    PipeIn#(.width(32)) bscan$fromBscan();
    PipeIn#(.width(32)) bscan$toBscan();
    PipeIn#(.width(32)) dataFromMem$in();
    PipeOut#(.width(32)) dataFromMem$out();
    PipeInLength#(.width(width)) radapter$in();
    PipeOutLast#(.width(32)) radapter$out();
    PipeIn#(.width(32)) readUser();
    BRAM#(.width(width),.depth(depth)) bram (.CLK(CLK), .nRST(nRST),
        .write__ENA(!( ( enable == 0 ) || ( !writeNext ) )),
        .write$addr(( !( ( enable == 0 ) || ( !writeNext ) ) ) ? addr : 11'd0),
        .write$data(( !( ( enable == 0 ) || ( !writeNext ) ) ) ? { timestamp , buffer[ ( width - 32 ) : 0 ] } : 0),
        .write__RDY(bram$write__RDY),
        .read__ENA(radapter$out.first__RDY && radapter$out.last__RDY && dataFromMem$in.enq__RDY && radapter$out.deq__RDY && radapter$out.last),
        .read$addr(( radapter$out.first__RDY && radapter$out.last__RDY && dataFromMem$in.enq__RDY && radapter$out.deq__RDY && radapter$out.last ) ? readAddr : 11'd0),
        .read__RDY(bram$read__RDY),
        .dataOut(bram$dataOut),
        .dataOut__RDY(bram$dataOut__RDY));
    Bscan#(.id(3),.width(32)) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan(bscan$toBscan),
        .fromBscan(readUser));
    Fifo1Base#(.width(32)) dataFromMem (.CLK(CLK), .nRST(nRST),
        .in(dataFromMem$in),
        .out(dataFromMem$out));
    AdapterToBus#(.width(width),.owidth(32)) radapter (.CLK(CLK), .nRST(nRST),
        .in(radapter$in),
        .out(radapter$out));
    // Extra assigments, not to output wires
    assign RULE$copyFromAdapter__ENA = radapter$out.first__RDY && radapter$out.last__RDY && dataFromMem$in.enq__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) );
    assign RULE$copyFromAdapter__RDY = radapter$out.first__RDY && radapter$out.last__RDY && dataFromMem$in.enq__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) );
    assign RULE$copyRule__ENA = !( ( enable == 0 ) || ( !( writeNext && bram$write__RDY ) ) );
    assign RULE$copyRule__RDY = !( ( enable == 0 ) || ( !( writeNext && bram$write__RDY ) ) );
    assign RULE$readCallBack__ENA = !( ( 0 == ( dataNotAvail ^ 1 ) ) || ( !( bram$dataOut__RDY && radapter$in.enq__RDY ) ) );
    assign RULE$readCallBack__RDY = !( ( 0 == ( dataNotAvail ^ 1 ) ) || ( !( bram$dataOut__RDY && radapter$in.enq__RDY ) ) );
    assign bscan$toBscan.enq$v = dataToJtag;
    assign bscan$toBscan.enq__ENA = 1'd1;
    assign dataFromMem$in.enq$v = ( radapter$out.first__RDY && radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) ) ) ? radapter$out.last : 0;
    assign dataFromMem$in.enq__ENA = radapter$out.first__RDY && radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) );
    assign dataFromMem$out.deq__ENA = readUser.enq__ENA;
    assign radapter$in.enq$size = ( !( ( 0 == ( dataNotAvail ^ 1 ) ) || ( !bram$dataOut__RDY ) ) ) ? ( (16'(width)) ) : 0;
    assign radapter$in.enq$v = ( !( ( 0 == ( dataNotAvail ^ 1 ) ) || ( !bram$dataOut__RDY ) ) ) ? bram$dataOut : 0;
    assign radapter$in.enq__ENA = !( ( 0 == ( dataNotAvail ^ 1 ) ) || ( !bram$dataOut__RDY ) );
    assign radapter$out.deq__ENA = radapter$out.first__RDY && radapter$out.last__RDY && dataFromMem$in.enq__RDY && ( bram$read__RDY || ( !radapter$out.last ) );
    assign readUser.enq__RDY = dataFromMem$out.deq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        addr <= 0;
        buffer <= 0;
        countCB <= 0;
        countFrom <= 0;
        countJtag <= 0;
        countTo <= 0;
        dataNotAvail <= 0;
        dataToJtag <= 0;
        readAddr <= 0;
        timestamp <= 0;
        writeNext <= 0;
      end // nRST
      else begin
        if (bscan$toBscan.enq__RDY) begin // RULE$callBack__ENA
            countCB <= countCB + 8'd1;
        end; // End of RULE$callBack__ENA
        if (RULE$copyFromAdapter__ENA && RULE$copyFromAdapter__RDY) begin // RULE$copyFromAdapter__ENA
            dataToJtag <= radapter$out.first;
            countFrom <= countFrom + 8'd1;
            if (radapter$out.last) begin
            readAddr <= readAddr + 11'd1;
            dataNotAvail <= 1'd0;
            end;
        end; // End of RULE$copyFromAdapter__ENA
        if (RULE$copyRule__ENA && RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            addr <= addr + 11'd1;
        end; // End of RULE$copyRule__ENA
        // RULE$init__ENA
            timestamp <= timestamp + 32'd1;
            buffer <= data;
            writeNext <= buffer != data;
        // End of RULE$init__ENA
        if (RULE$readCallBack__ENA && RULE$readCallBack__RDY) begin // RULE$readCallBack__ENA
            dataNotAvail <= 1'd1;
            countTo <= countTo + 8'd1;
        end; // End of RULE$readCallBack__ENA
        if (readUser.enq__ENA && dataFromMem$out.deq__RDY) begin // readUser.enq__ENA
            countJtag <= countJtag + 8'd1;
        end; // End of readUser.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
