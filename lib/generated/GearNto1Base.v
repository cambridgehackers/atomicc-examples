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
    reg [4 - 1:0]c;
    wire [widthIn - 1:0]m;
    genvar __inst$Genvar1;
    assign in$enq__RDY = ( !( 0 == ( ( c != 0 ) ^ 1 ) ) );
    assign out$deq__RDY = ( !( 0 == ( ( c == 0 ) ^ 1 ) ) );
    assign out$first = buffer[ 0 ];
    assign out$first__RDY = ( !( 0 == ( ( c == 0 ) ^ 1 ) ) );
    // Extra assigments, not to output wires
    assign m = in$enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= 0;
      end // nRST
      else begin
        if (( in$enq__ENA & in$enq__RDY )) begin // in$enq__ENA
            c <= 4;
        end; // End of in$enq__ENA
        if (( out$deq__ENA & out$deq__RDY )) begin // out$deq__ENA
            c <= c + ( -1 );
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = ( 0 ); ( ( __inst$Genvar1 + 1 ) < 4 ); __inst$Genvar1 = ( __inst$Genvar1 + 1 )) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( out$deq__ENA & out$deq__RDY )) begin // out$deq__ENA
            buffer[__inst$Genvar1] <= buffer[__inst$Genvar1 + 1];
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate

    for(__inst$Genvar1 = ( 0 ); ( __inst$Genvar1 < 4 ); __inst$Genvar1 = ( __inst$Genvar1 + 1 )) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( in$enq__ENA & in$enq__RDY )) begin // in$enq__ENA
            buffer[__inst$Genvar1] <= m[ ( ( ( __inst$Genvar1 + 1 ) * widthOut ) - 1 ) : ( __inst$Genvar1 * widthOut ) ];
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
