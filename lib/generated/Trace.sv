`include "tracebuf.generated.vh"

`default_nettype none
module Trace #(
    parameter integer width = 64,
    parameter integer depth = 1024,
    parameter integer sensitivity = 99)(
    input wire clear__ENA,
    output wire clear__RDY,
    input wire CLK,
    input wire nRST,
    input wire enable,
    input wire [width - 1:0]data,
    PipeOut.server out);
    reg [11 - 1:0]addr;
    reg [sensitivity - 1:0]buffer;
    reg [11 - 1:0]readAddr;
    reg [32 - 1:0]timestamp;
    logic RULE$copyRule__ENA;
    logic RULE$copyRule__RDY;
    logic [width - 1:0]bram$dataOut;
    logic bram$read__RDY;
    logic bram$write__RDY;
    PipeInLength#(.width(width)) radapter$in();
    PipeOutLast#(.width(32)) radapter$out();
    BRAM#(.width(width),.depth(depth)) bram (.CLK(CLK), .nRST(nRST),
        .write__ENA(!( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) )),
        .write$addr(( !( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) ) ) ? addr : 11'd0),
        .write$data(( !( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) ) ) ? { timestamp , data[ ( width - 32 ) : 0 ] } : 0),
        .write__RDY(bram$write__RDY),
        .read__ENA(out.deq__ENA && radapter$out.last),
        .read$addr(( out.deq__ENA && radapter$out.last ) ? readAddr : 11'd0),
        .read__RDY(bram$read__RDY),
        .dataOut(bram$dataOut),
        .dataOut__RDY(radapter$in.enq__ENA));
    AdapterToBus#(.width(width),.owidth(32)) radapter (.CLK(CLK), .nRST(nRST),
        .clear__ENA(clear__ENA),
        .clear__RDY(clear__RDY),
        .in(radapter$in),
        .out(radapter$out));
    // Extra assigments, not to output wires
    assign RULE$copyRule__ENA = !( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) || ( !bram$write__RDY ) );
    assign RULE$copyRule__RDY = !( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) || ( !bram$write__RDY ) );
    assign out.deq__RDY = radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out.last || ( !radapter$out.deq__RDY ) ) ) ) );
    assign out.first = radapter$out.first;
    assign out.first__RDY = radapter$out.first__RDY;
    assign radapter$in.enq$size = radapter$in.enq__ENA ? ( (32'(width)) ) : 32'd0;
    assign radapter$in.enq$v = radapter$in.enq__ENA ? bram$dataOut : 0;
    assign radapter$out.deq__ENA = out.deq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
        addr <= 0;
        buffer <= 0;
        readAddr <= 0;
        timestamp <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__RDY && RULE$copyRule__ENA) begin // RULE$copyRule__ENA
            addr <= addr + 11'd1;
            buffer <= data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ];
        end; // End of RULE$copyRule__ENA
        // RULE$init__ENA
            timestamp <= timestamp + 32'd1;
        // End of RULE$init__ENA
        if (out.deq__RDY && out.deq__ENA) begin // out.deq__ENA
            if (radapter$out.last)
            readAddr <= readAddr + 11'd1;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
