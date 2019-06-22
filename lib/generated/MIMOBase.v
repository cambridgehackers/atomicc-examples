`include "mimo.generated.vh"

`default_nettype none
module MIMOBase #(
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
    reg [160 - 1:0]buffer;
    reg [160 - 1:0]c;
    genvar __inst$Genvar1;
    assign in$enq__RDY = ( !( 0 == ( ( c >= widthOut ) ^ 1 ) ) );
    assign out$deq__RDY = ( !( 0 == ( c >= widthOut ) ) );
    assign out$first = buffer;
    assign out$first__RDY = ( !( 0 == ( c >= widthOut ) ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        c <= 0;
      end // nRST
      else begin
        if (( in$enq__ENA & in$enq__RDY )) begin // in$enq__ENA
            c <= c + widthIn;
        end; // End of in$enq__ENA
        if (( out$deq__ENA & out$deq__RDY )) begin // out$deq__ENA
            buffer <= buffer[ widthOut : 159 ];
            c <= c - widthOut;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = ( 0 ); ( __inst$Genvar1 < 160 ); __inst$Genvar1 = ( __inst$Genvar1 + 1 )) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( in$enq__ENA & in$enq__RDY )) begin // in$enq__ENA
            if (( __inst$Genvar1 == c ))
            __bitsubstrl@{ buffer , ( __inst$Genvar1 + widthIn ) - 1 , __inst$Genvar1 @} <= in$enq$v;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
