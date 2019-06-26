`include "gearNto1.generated.vh"

`default_nettype none
module GearNto1Base #(
    parameter integer widthIn = 128,
    parameter integer widthOut = 32)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [widthIn - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [widthOut - 1:0]out$first,
    output wire out$first__RDY);
    reg [widthOut - 1:0]buffer [1:0];
    reg [$clog2( widthIn / widthOut ) - 1:0]c;
    wire [widthIn - 1:0]m;
    genvar __inst$Genvar1;
    assign in$enq__RDY = c == 0;
    assign out$deq__RDY = !( c == 0 );
    assign out$first = buffer[ 0 ];
    assign out$first__RDY = !( c == 0 );
    // Extra assigments, not to output wires
    assign m = in$enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & ( c == 0 )) begin // in$enq__ENA
            c <= widthIn / widthOut;
        end; // End of in$enq__ENA
        if (!( ( c == 0 ) | ( !out$deq__ENA ) )) begin // out$deq__ENA
            c <= c + ( -1 );
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; ( __inst$Genvar1 + 1 ) < ( widthIn / widthOut ); __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (!( ( c == 0 ) | ( !out$deq__ENA ) )) begin // out$deq__ENA
            buffer[__inst$Genvar1] <= buffer[__inst$Genvar1 + 1];
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate

    for(__inst$Genvar1 = 0; __inst$Genvar1 < ( widthIn / widthOut ); __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (in$enq__ENA & ( c == 0 )) begin // in$enq__ENA
            buffer[__inst$Genvar1] <= m[ ( ( ( __inst$Genvar1 + 1 ) * widthOut ) - 1 ) : ( __inst$Genvar1 * widthOut ) ];
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
