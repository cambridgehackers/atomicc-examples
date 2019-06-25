`include "gear1toN.generated.vh"

`default_nettype none
module Gear1toNBase #(
    parameter integer widthIn = 32,
    parameter integer widthOut = 128)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [widthIn - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [widthOut - 1:0]out$first,
    output wire out$first__RDY);
    reg [widthOut - 1:0]buffer;
    reg [widthOut / widthIn - 1:0]c;
    genvar __inst$Genvar1;
    assign in$enq__RDY = !( c == 4 );
    assign out$deq__RDY = c == 4;
    assign out$first = buffer;
    assign out$first__RDY = c == 4;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        c <= 0;
      end // nRST
      else begin
        if (!( ( c == 4 ) | ( !in$enq__ENA ) )) begin // in$enq__ENA
            c <= c + 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & ( c == 4 )) begin // out$deq__ENA
            c <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; __inst$Genvar1 < ( widthOut / widthIn ); __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (!( ( c == 4 ) | ( !in$enq__ENA ) )) begin // in$enq__ENA
            if (__inst$Genvar1 == c)
            __bitsubstrl@{ buffer , ( ( __inst$Genvar1 + 1 ) * widthIn ) - 1 , __inst$Genvar1 * widthIn @} <= in$enq$v;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
